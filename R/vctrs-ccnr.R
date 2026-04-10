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
    vec_cast_common(
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
    vec_recycle_common(ccn, form, state, number, type, parent, ext)

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
  vec_assert(ccn, character())
  vec_assert(form, character())
  vec_assert(number, character())
  vec_assert(state, character())
  vec_assert(type, character())
  vec_assert(parent, character())
  vec_assert(ext, character())

  new_rcrd(
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
  field(x, "ccn")
}

#' @method format ccnr
#' @export
format.ccnr <- function(x, ...) {
  x <- field(x, "ccn")
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

#' @export
#' @rdname ccnr
as_ccnr <- function(x) {
  i <- index_types(x)

  vec_c(
    if (has_name(i, "care")) ccnr_care(x[i$care]),
    if (has_name(i, "caid")) ccnr_caid(x[i$caid]),
    if (has_name(i, "unit")) ccnr_unit(x[i$unit]),
    if (has_name(i, "sub")) ccnr_sub(x[i$sub]),
    if (has_name(i, "opo")) ccnr_opo(x[i$opo]),
    if (has_name(i, "erh")) ccnr_erh(x[i$erh]),
    if (has_name(i, "supp")) ccnr_supp(x[i$supp]),
    if (has_name(i, "ext_care")) ccnr_care(x[i$ext_care], TRUE),
    if (has_name(i, "ext_caid")) ccnr_caid(x[i$ext_caid], TRUE),
    if (has_name(i, "ext_unit")) ccnr_unit(x[i$ext_unit], TRUE)
  )
}

#' @export
#' @rdname ccnr
decode_ccnr <- function(x) {
  x <- if (is_ccnr(x)) {
    tibble::tibble(vec_data(x))
  } else {
    tibble::tibble(vec_data(as_ccnr(x)))
  }
  collapse::settfmv(x, collapse::gv(x, "number", return = 3), as.integer)
  collapse::settfmv(x, collapse::gv(x, "state", return = 3), decode_state)

  x$facility <- vctrs::vec_init(character(), vctrs::vec_size(x))

  i <- purrr::imap(
    rlang::set_names(collapse::funique(x$form)),
    \(n, i) {
      purrr::pluck(x, "form") %==% n
    }
  )

  x[i$erh, ]$facility <- decode_emergency_type(x[i$erh, ]$type)
  x[i$supp, ]$facility <- decode_supplier_type(x[i$supp, ]$type)

  x[i$caid, ]$facility <- decode_medicaid_type(x[i$caid, ]$type)
  x[i$caid, ]$facility <- vctrs::vec_if_else(
    x[i$caid, ]$facility == "MOH",
    decode_medicaid_range(x[i$caid, ]$number),
    x[i$caid, ]$facility
  )

  x[i$care, ]$facility <- decode_medicare_range(x[i$care, ]$number)
  x[i$sub, ]$facility <- decode_unit_type(x[i$sub, ]$type)

  x[i$sub, ]$parent <- paste0(
    str_state(x[i$sub, ]$ccn),
    subunit_type_prefix(x[i$sub, ]$parent),
    substring(x[i$sub, ]$ccn, 5L, 6L)
  )

  x[i$unit, ]$parent <- vctrs::vec_if_else(
    vctrs::vec_detect_missing(
      unit_type_infix(x[i$unit, ]$type)
    ),
    NA_character_,
    paste0(
      str_state(x[i$unit, ]$ccn),
      unit_type_infix(x[i$unit, ]$type),
      substring(x[i$unit, ]$ccn, 5L, 6L)
    )
  )

  x[i$unit, ]$facility <- decode_unit_type(x[i$unit, ]$type)

  collapse::slt(x, c("ccn", "form", "state", "facility", "parent", "ext"))
}
