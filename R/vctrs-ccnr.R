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

  if (rlang::has_name(i, "Emergency")) {
    x[i$Emergency, ]$facility <- decode_other_type(x[i$Emergency, ]$type)
  }

  if (rlang::has_name(i, "Supplier")) {
    x[i$Supplier, ]$facility <- decode_other_type(x[i$Supplier, ]$type)
  }

  if (rlang::has_name(i, "Organ")) {
    x[i$Organ, ]$facility <- decode_other_type(x[i$Organ, ]$type)
  }

  if (rlang::has_name(i, "Medicaid")) {
    x[i$Medicaid, ]$facility <- decode_medicaid_type(x[i$Medicaid, ]$type)

    x[i$Medicaid, ]$facility <- vctrs::vec_if_else(
      x[i$Medicaid, ]$facility == "MOH",
      decode_medicaid_range(x[i$Medicaid, ]$number),
      x[i$Medicaid, ]$facility
    )
  }

  if (rlang::has_name(i, "Medicare")) {
    xi <- vctrs::vec_slice(x, i[["Medicare"]])
    vctrs::vec_slice(x, i[["Medicare"]])$facility <- decode_medicare_range(
      xi[["number"]]
    )
  }

  if (rlang::has_name(i, "Subunit")) {
    x[i$Subunit, ]$facility <- decode_unit_type(x[i$Subunit, ]$type)

    x[i$Subunit, ]$parent <- paste0(
      str_state(x[i$Subunit, ]$ccn),
      decode_subunit_type(x[i$Subunit, ]$parent),
      substring(x[i$Subunit, ]$ccn, 5L, 6L)
    )
  }

  if (rlang::has_name(i, "Unit")) {
    xi <- vctrs::vec_slice(x, i[["Unit"]])
    vctrs::vec_slice(x, i[["Unit"]])$facility <- decode_unit_type(xi[["type"]])

    infix <- unit_type_infix(xi[["type"]])

    vctrs::vec_slice(x, i[["Unit"]])$parent <- paste0(
      str_state(xi[["ccn"]]),
      infix,
      substring(xi[["ccn"]], 4L, 6L)
    )
  }

  collapse::gv(
    x,
    c("ccn", "form", "state", "facility", "parent", "ext", "number", "type")
  )
}
