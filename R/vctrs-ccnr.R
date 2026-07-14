methods::setOldClass(c("ccnr", "vctrs_vctr"))

#' Construct a `ccnr` object
#'
#' @param ccn a vector
#' @param form a vector
#' @param state Passed on to methods
#' @param number a vector
#' @param type a vector
#' @param parent a vector
#' @param ext a vector
#' @param x object
#' @returns An S3 vector of class `<ccnr>`
#' @examples
#' decode_ccnr(c(get_pin("ccn"), "01J008"))
#' @export
ccnr <- function(
  ccn = character(),
  form = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
) {
  .c(ccn, form, state, number, type, parent, ext) %=%
    vctrs::vec_cast_common(
      ccn,
      form,
      state,
      number,
      type,
      parent,
      ext,
      .to = character()
    )
  .c(ccn, form, state, number, type, parent, ext) %=%
    vctrs::vec_recycle_common(ccn, form, state, number, type, parent, ext)

  new_ccnr(ccn, form, state, number, type, parent, ext)
}

#' @export
#' @rdname ccnr
new_ccnr <- function(
  ccn = character(),
  form = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
) {
  vctrs::vec_assert(ccn, character())
  vctrs::vec_assert(form, character())
  vctrs::vec_assert(number, character())
  vctrs::vec_assert(state, character())
  vctrs::vec_assert(type, character())
  vctrs::vec_assert(parent, character())
  vctrs::vec_assert(ext, character())

  vctrs::new_rcrd(
    list(
      ccn = ccn,
      form = form,
      state = state,
      number = number,
      type = type,
      parent = parent,
      ext = ext
    ),
    class = "ccnr"
  )
}

#' @export
#' @rdname ccnr
is_ccnr <- function(x) {
  inherits(x, "ccnr")
}

#' Comparison
#'
#' Dispatch methods to support [vctrs::vec_proxy_equal()].
#'
#' @inheritParams vctrs::vec_proxy_equal
#' @method vec_proxy_equal ccnr
#' @export
#' @export vec_proxy_equal.ccnr
vec_proxy_equal.ccnr <- function(x, ...) {
  vctrs::field(x, "ccn")
}

#' @method format ccnr
#' @export
format.ccnr <- function(x, ...) {
  x <- vctrs::field(x, "ccn")
  out <- formatC(x, format = "s")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
vec_ptype_abbr.ccnr <- function(x, ...) {
  "ccnr"
}

#' @export
vec_ptype_full.ccnr <- function(x, ...) {
  "ccn_rcrd"
}

#' @noRd
has_ccnr <- function(x, index, key, .fn, ext = FALSE) {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    .fn(x[i], ext = ext)
  } else {
    NULL
  }
}

#' @export
#' @rdname ccnr
as_ccnr <- function(x) {
  i <- index_types(x)

  vctrs::vec_c(
    has_ccnr(x, i, "care", ccnr_care),
    has_ccnr(x, i, "caid", ccnr_caid),
    has_ccnr(x, i, "unit", ccnr_unit),
    has_ccnr(x, i, "sub", ccnr_sub),
    has_ccnr(x, i, "opo", ccnr_opo),
    has_ccnr(x, i, "erh", ccnr_erh),
    has_ccnr(x, i, "supp", ccnr_supp),
    has_ccnr(x, i, "ext_care", ccnr_care, TRUE),
    has_ccnr(x, i, "ext_caid", ccnr_caid, TRUE),
    has_ccnr(x, i, "ext_unit", ccnr_unit, TRUE),
  )
}

#' @export
#' @rdname ccnr
decode_ccnr <- function(x) {
  x <- if (is_ccnr(x)) {
    tibble::tibble(vctrs::vec_data(x))
  } else {
    tibble::tibble(vctrs::vec_data(as_ccnr(x)))
  }
  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::settfmv(x, collapse::gv(x, "state", return = 3L), decode_state)

  x[["facility"]] <- vctrs::vec_init(character(), vctrs::vec_size(x))

  i <- purrr::imap(
    rlang::set_names(collapse::funique(x$form)),
    function(n, i) {
      purrr::pluck(x, "form") %==% n
    }
  )

  if (rlang::has_name(i, "erh")) {
    x[i$erh, ]$facility <- decode_emergency_type(x[i$erh, ]$type)
  }

  if (rlang::has_name(i, "supp")) {
    x[i$supp, ]$facility <- decode_supplier_type(x[i$supp, ]$type)
  }

  if (rlang::has_name(i, "caid")) {
    x[i$caid, ]$facility <- decode_medicaid_type(x[i$caid, ]$type)

    x[i$caid, ]$facility <- vctrs::vec_if_else(
      x[i$caid, ]$facility == "MOH",
      decode_medicaid_range(x[i$caid, ]$number),
      x[i$caid, ]$facility
    )
  }

  if (rlang::has_name(i, "care")) {
    x[i$care, ]$facility <- decode_medicare_range(x[i$care, ]$number)
  }

  if (rlang::has_name(i, "sub")) {
    x[i$sub, ]$facility <- decode_unit_type(x[i$sub, ]$type)

    x[i$sub, ]$parent <- paste0(
      str_state(x[i$sub, ]$ccn),
      subunit_type_prefix(x[i$sub, ]$parent),
      substring(x[i$sub, ]$ccn, 5L, 6L)
    )
  }

  if (rlang::has_name(i, "unit")) {
    x[i$unit, ]$facility <- decode_unit_type(x[i$unit, ]$type)

    infix <- unit_type_infix(x[i$unit, ]$type)

    infix[cheapr::which_na(infix)] <- "!"

    x[i$unit, ]$parent <- paste0(
      str_state(x[i$unit, ]$ccn),
      infix,
      substring(x[i$unit, ]$ccn, 4L, 6L)
    )
  }

  collapse::gv(
    x,
    c("ccn", "form", "state", "facility", "parent", "ext", "number", "type")
  )
}
