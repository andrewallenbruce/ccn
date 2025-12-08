#' Slice CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name slice
#' @returns character vector of names associated with codes.
#' @examples
#' slice_medicare("670055")
#' slice_organ("05P001")
#' slice_emergency("12345E")
#' slice_supplier("10C0001062")
#' slice_medicaid("A5J508")
#' slice_unit("21T101")
#' slice_subunit("02TA01")
NULL

# Medicare Provider: 670055 -> 67 0055
#' @rdname slice
#' @export
slice_medicare <- function(x) {
  substring(
    x,
    c(1L, 3L), c(2L, 6L)
  )
}

# Medicare OPO Provider: 05P001 -> 05 P 001
#' @rdname slice
#' @export
slice_organ <- function(x) {
  substring(
    x,
    c(1L, 3L, 4L),
    c(2L, 3L, 6L)
  )
}

# Emergency Hospital: 12345E -> 12 345 E
#' @rdname slice
#' @export
slice_emergency <- function(x) {
  substring(
    x,
    c(1L, 3L, 6L),
    c(2L, 5L, 6L)
  )
}

# Medicare Supplier: 10C0001062 -> 10 C 0001062
#' @rdname slice
#' @export
slice_supplier <- function(x) {
  substring(
    x,
    c(1L, 3L, 4L),
    c(2L, 3L, 10L)
  )
}

# Medicaid-Only Facility: 01L008 -> 01 L 008
#' @rdname slice
#' @export
slice_medicaid <- function(x) {
  substring(
    x,
    c(1L, 3L, 4L),
    c(2L, 3L, 6L)
  )
}

# IPPS-Excluded Provider: 21T101 -> 21 T 101
#' @rdname slice
#' @export
slice_unit <- function(x) {
  substring(
    x,
    c(1L, 3L, 4L),
    c(2L, 3L, 6L)
  )
}

# IPPS-Excluded Unit: 02TA01 -> 02 T A 01
#' @rdname slice
#' @export
slice_subunit <- function(x) {
  substring(
    x,
    c(1L, 3L, 4L, 5L),
    c(2L, 3L, 4L, 6L)
  )
}
