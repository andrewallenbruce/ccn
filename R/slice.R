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
  switch_ccn(clean(x))
}

#' @rdname slice
#' @export
switch_provider <- function(x) {
  switch(
    provider_type(x),
    medicare = slice_medicare(x),
    organ = slice_organ(x),
    emergency = slice_emergency(x),
    medicaid = slice_medicaid(x),
    unit = slice_unit(x),
    subunit = slice_subunit(x),
    cli::cli_abort("Provider CCN type not recognized")
  )
}

#' @rdname slice
#' @export
switch_ccn <- function(x) {
  switch(
    ccn_type(x),
    provider = switch_provider(x),
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
  c(switch_provider(slice_provider(x)), ext = substring(x, 7L, nchar(x)))
}

# Medicare Provider: 670055 -> 67 0055
#' @rdname slice
#' @export
slice_medicare <- function(x) {
  c(
    entity = "medicare",
    substring(x, c(1L, 3L), c(2L, 6L)) |>
      `names<-`(c("state", "sequence"))
  )
}

# Medicare OPO Provider: 05P001 -> 05 P 001
#' @rdname slice
#' @export
slice_organ <- function(x) {
  c(
    entity = "organ",
    substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
      `names<-`(c("state", "type", "sequence"))
  )
}

# Emergency Hospital: 12345E -> 12 345 E
#' @rdname slice
#' @export
slice_emergency <- function(x) {
  c(
    entity = "emergency",
    substring(x, c(1L, 3L, 6L), c(2L, 5L, 6L)) |>
      `names<-`(c("state", "sequence", "type"))
  )
}

# Medicare Supplier: 10C0001062 -> 10 C 0001062
#' @rdname slice
#' @export
slice_supplier <- function(x) {
  c(
    entity = "supplier",
    substring(x, c(1L, 3L, 4L), c(2L, 3L, 10L)) |>
      `names<-`(c("state", "type", "sequence"))
  )
}

#' @rdname slice
#' @export
slice_supplier_ext <- function(x) {
  c(slice_supplier(substring(x, 1L, 10L)), ext = substring(x, 11L, nchar(x)))
}

# Medicaid-Only Facility: 01L008 -> 01 L 008
#' @rdname slice
#' @export
slice_medicaid <- function(x) {
  c(
    entity = "medicaid",
    substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
      `names<-`(c("state", "type", "sequence"))
  )
}

# IPPS-Excluded Provider: 21T101 -> 21 T 101
#' @rdname slice
#' @export
slice_unit <- function(x) {
  c(
    entity = "unit",
    substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
      `names<-`(c("state", "type", "sequence"))
  )
}

# IPPS-Excluded Unit: 02TA01 -> 02 T A 01
#' @rdname slice
#' @export
slice_subunit <- function(x) {
  c(
    entity = "subunit",
    substring(x, c(1L, 3L, 4L, 5L), c(2L, 3L, 4L, 6L)) |>
      `names<-`(c("state", "type", "parent", "sequence"))
  )
}
