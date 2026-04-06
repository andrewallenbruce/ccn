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
#' @returns An S3 vector of class `<ccnr>`
#' @examples
#' new_ccnr(
#'   ccn = c("670005", "12345E", NA, "05P001", "21T101", "02TA01", "10C0001062", "000001A001"),
#'   form = c("medicare", "emergency", NA, "organ", "unit", "subunit", "supplier", "medicare"),
#'   state = c("67", "12", NA, "05", "21", "02", "10", "00"),
#'   number = c("0005", "345", NA, "001", "101", "01", "0001062", "0001"),
#'   type = c(NA, "E", NA, "P", "T", "T", "C", NA),
#'   parent = c(NA, NA, NA, NA, NA, "A", NA, NA),
#'   ext = c(NA, NA, NA, NA, NA, NA, NA, "A001"))
#'
#' x <- ccnr(
#'   ccn = c("670005", "12345E", NA, "05P001", "21T101", "02TA01", "10C0001062", "000001A001"),
#'   form = c("medicare", "emergency", NA, "organ", "unit", "subunit", "supplier", "medicare"),
#'   state = c("67", "12", NA, "05", "21", "02", "10", "00"),
#'   number = c("0005", "345", NA, "001", "101", "01", "0001062", "0001"),
#'   type = c(NA, "E", NA, "P", "T", "T", "C", NA),
#'   parent = c(NA, NA, NA, NA, NA, "A", NA, NA),
#'   ext = c(NA, NA, NA, NA, NA, NA, NA, "A001"))
#'
#' tibble::tibble(x)
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
      state = state,
      number = number,
      type = type,
      parent = parent,
      ext = ext
    ),
    class = "ccnr"
  )
}
