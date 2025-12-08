#' Slice CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name slice
#' @returns character vector of names associated with codes.
#' @examples
#' slice("670055")
#' slice("05P001")
#' slice("12345E")
#' slice("10C0001062")
#' slice("A5J508")
#' slice("21T101")
#' slice("02TA01")
#' slice("240019A")
#' slice("330125001")
NULL

#' @rdname slice
#' @export
slice <- function(x) {
  ccn_slice(clean(x))
}

#' @rdname slice
#' @export
provider_slice <- function(x) {
  switch(
    provider_type(x),
    medicare = slice_medicare(x),
    organ = slice_organ(x),
    emergency = slice_emergency(x),
    medicaid = slice_medicaid(x),
    unit = slice_unit(x),
    subunit = slice_subunit(x),
    cli::cli_abort("CCN type not recognized")
  )
}

#' @rdname slice
#' @export
ccn_slice <- function(x) {
  switch(
    ccn_type(x),
    provider = provider_slice(x),
    provider_ext = slice_provider_ext(x),
    supplier = slice_supplier(x),
    supplier_ext = slice_supplier_ext(x),
    cli::cli_abort("CCN type not recognized")
  )
}

#' @rdname slice
#' @export
slice_provider <- function(x) {
  substring(x, 1L, 6L)
}

#' @rdname slice
#' @export
slice_provider_ext <- function(x) {
  x <- substring(x, c(1L, 7L), c(6L, 9L))

  ext <- x[2]
  x   <- x[1]

  c(switch(provider_type(x),
      medicare = slice_medicare(x),
      organ = slice_organ(x),
      emergency = slice_emergency(x),
      medicaid = slice_medicaid(x),
      unit = slice_unit(x),
      subunit = slice_subunit(x),
      cli::cli_abort("CCN type not recognized: {(x)}")),
    ext)
}

# Medicare Provider: 670055 -> 67 0055
#' @rdname slice
#' @export
slice_medicare <- function(x) {
  substring(x, c(1L, 3L), c(2L, 6L))
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

#' @rdname slice
#' @export
slice_supplier_ext <- function(x) {
  substring(
    x,
    c(1L, 3L, 4L, 11L),
    c(2L, 3L, 10L, nchar(x))
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
