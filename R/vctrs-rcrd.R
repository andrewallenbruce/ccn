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
#' x <- ccnr(
#'   c("670005", "12345E", NA, "05P001", "21T101", "02TA01", "10C0001062", "000001A001"),
#'   c("care", "erh", NA, "opo", "unit", "sub", "supp", "care"),
#'   c("67", "12", NA, "05", "21", "02", "10", "00"),
#'   c("0005", "345", NA, "001", "101", "01", "0001062", "0001"),
#'   c(NA, "E", NA, "P", "T", "T", "C", NA),
#'   c(NA, NA, NA, NA, NA, "A", NA, NA),
#'   c(NA, NA, NA, NA, NA, NA, NA, "A001"))
#' x
#' tibble::tibble(x, ccn = as_ccn(x))
#' tibble::as_tibble(vctrs::vec_data(x))
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
