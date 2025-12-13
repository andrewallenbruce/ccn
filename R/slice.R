#' Slice CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @param ... additional arguments passed to methods.
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
#' slice("000000000")
#' slice("000000000000")
#' # slice("0000000000000000")
#' # slice("")
#' # slice("IIIIII")
NULL

#' @rdname slice
#' @export
slice <- function(x) {
  if (!nzchar(x)) {
    check_arg(x, "cannot be an {.strong empty} string.")
  }
  if (!nchar_ccn(x)) {
    check_arg(x, "must be {.strong 6 - 14} characters.")
  }
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
    check_arg(x, "is an invalid Provider CCN: {.val {x}}.")
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
    check_arg(x, "is an invalid CCN: {.val {x}}.") # TODO redundant?
  )
}

#' @rdname slice
#' @export
slice_provider_ext <- function(x) {
  p <- switch_provider(substring(x, 1L, 6L))

  structure(
    c(
      p,
      extension = substring(x, 7L, nchar(x))
    ),
    class = class(p)
  )
}

# Medicare Provider: 670055 -> 67 0055
#' @rdname slice
#' @export
slice_medicare <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L), c(2L, 6L)) |>
        `names<-`(c("state", "sequence"))
    ),
    class = "medicare"
  )
}

# Medicare OPO Provider: 05P001 -> 05 P 001
#' @rdname slice
#' @export
slice_organ <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
        `names<-`(c("state", "type", "sequence"))
    ),
    class = "organ"
  )
}

# Emergency Hospital: 12345E -> 12 345 E
#' @rdname slice
#' @export
slice_emergency <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 6L), c(2L, 5L, 6L)) |>
        `names<-`(c("state", "sequence", "type"))
    ),
    class = "emergency"
  )
}

# Medicare Supplier: 10C0001062 -> 10 C 0001062
#' @rdname slice
#' @export
slice_supplier <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 10L)) |>
        `names<-`(c("state", "type", "sequence"))
    ),
    class = "supplier"
  )
}

#' @rdname slice
#' @export
slice_supplier_ext <- function(x) {
  p <- slice_supplier(substring(x, 1L, 10L))

  structure(
    c(
      p,
      extension = substring(x, 11L, nchar(x))
    ),
    class = class(p)
  )
}

# Medicaid-Only Facility: 01L008 -> 01 L 008
#' @rdname slice
#' @export
slice_medicaid <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
        `names<-`(c("state", "type", "sequence"))
    ),
    class = "medicaid"
  )
}

# IPPS-Excluded Provider: 21T101 -> 21 T 101
#' @rdname slice
#' @export
slice_unit <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
        `names<-`(c("state", "type", "sequence"))
    ),
    class = "unit"
  )
}

# IPPS-Excluded Unit: 02TA01 -> 02 T A 01
#' @rdname slice
#' @export
slice_subunit <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L, 5L), c(2L, 3L, 4L, 6L)) |>
        `names<-`(c("state", "type", "parent", "sequence"))
    ),
    class = "subunit"
  )
}

#' @noRd
print_impl <- function(x) {
  cli::cli_text(
    paste0(rep(cli::symbol$line, 4), collapse = ""),
    "<ccn:{cli::col_cyan(class(x))}>"
  )
  glue::glue(
    '{cli::col_silver(format(names(x), justify = "right"))}',
    '{cli::col_grey(":")} {unname(x)}'
  ) |>
    cat(sep = "\n")
  invisible(x)
}

#' @rdname slice
#' @export
print.medicare <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice
#' @export
print.organ <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice
#' @export
print.emergency <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice
#' @export
print.supplier <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice
#' @export
print.medicaid <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice
#' @export
print.unit <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice
#' @export
print.subunit <- function(x, ...) {
  print_impl(x)
}
