#' Parse CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns character vector of names associated with codes.
#' @examples
#' parse("670055")
#' parse("05P001")
#' parse("12345E")
#' parse("10C0001062")
#' parse("A5J508")
#' parse("21T101")
#' parse("02TA01")
#' parse("240019A")
#' parse("330125001")
#' parse("000000000")
#' parse("00000000000000")
#' @export
parse <- function(x) {
  if (!nzchar(x)) {
    check_arg(x, "cannot be an {.strong empty} string.")
  }
  if (!nchar_ccn(x)) {
    check_arg(x, "must be {.strong 6 - 14} characters.")
  }
  switch_ccn(clean(x))
}

#' @noRd
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

#' @noRd
switch_ccn <- function(x) {
  switch(
    ccn_by_nchar(x),
    provider = switch_provider(x),
    provider_ext = slice_provider_ext(x),
    supplier = slice_supplier(x),
    supplier_ext = slice_supplier_ext(x),
    check_arg(x, "is an invalid CCN: {.val {x}}.") # TODO redundant?
  )
}

#' @noRd
is_parsed <- function(x) {
  rlang::inherits_any(
    x,
    c(
      "medicare",
      "organ",
      "emergency",
      "supplier",
      "medicaid",
      "unit",
      "subunit"
    )
  )
}

#' Medicare Provider: 670055 -> 67 0055
#' @param x character vector of codes to look up.
#' @name slice_medicare
#' @export
#' @keywords internal
slice_medicare <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L), c(2L, 6L)) |>
        `names<-`(c("state", "sequence"))
    ) |>
      as.list(),
    class = "medicare"
  )
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
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

#' Medicare Supplier with Extension: 10C0001062EXT -> 10 C 0001062 EXT
#' @rdname slice_medicare
#' @export
#' @keywords internal
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

#' Medicare OPO Provider: 05P001 -> 05 P 001
#' @rdname slice_medicare
#' @export
#' @keywords internal
slice_organ <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
        `names<-`(c("state", "type", "sequence"))
    ) |>
      as.list(),
    class = "organ"
  )
}

#' Emergency Hospital: 12345E -> 12 345 E
#' @rdname slice_medicare
#' @export
#' @keywords internal
slice_emergency <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 6L), c(2L, 5L, 6L)) |>
        `names<-`(c("state", "sequence", "type"))
    ) |>
      as.list(),
    class = "emergency"
  )
}

#' Medicare Supplier: 10C0001062 -> 10 C 0001062
#' @rdname slice_medicare
#' @export
#' @keywords internal
slice_supplier <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 10L)) |>
        `names<-`(c("state", "type", "sequence"))
    ) |>
      as.list(),
    class = "supplier"
  )
}

#' Medicaid-Only Facility: 01L008 -> 01 L 008
#' @rdname slice_medicare
#' @export
#' @keywords internal
slice_medicaid <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
        `names<-`(c("state", "type", "sequence"))
    ) |>
      as.list(),
    class = "medicaid"
  )
}

#' IPPS-Excluded Provider: 21T101 -> 21 T 101
#' @rdname slice_medicare
#' @export
#' @keywords internal
slice_unit <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L), c(2L, 3L, 6L)) |>
        `names<-`(c("state", "type", "sequence"))
    ) |>
      as.list(),
    class = "unit"
  )
}

#' IPPS-Excluded Unit: 02TA01 -> 02 T A 01
#' @rdname slice_medicare
#' @export
#' @keywords internal
slice_subunit <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L, 4L, 5L), c(2L, 3L, 4L, 6L)) |>
        `names<-`(c("state", "type", "parent", "sequence"))
    ) |>
      as.list(),
    class = "subunit"
  )
}

#' @noRd
fmt_names <- function(x) {
  paste0(
    cli::col_silver(format(names(x), justify = "right")),
    cli::col_grey(": ")
  )
}

#' @noRd
fmt_head <- function(x) {
  paste0(
    "<",
    cli::col_red("parse"),
    cli::col_grey(":"),
    cli::col_yellow(cli::style_bold((class(x)))),
    ">"
  )
}

#' @noRd
print_impl <- function(x, ...) {
  cat(fmt_head(x), sep = "\n")
  cat(paste0(fmt_names(x), unlist_(x)), sep = "\n")
  invisible(x)
}

#' @export
#' @exportS3Method base::print
print.medicare <- print_impl

#' @export
#' @exportS3Method base::print
print.organ <- print_impl

#' @export
#' @exportS3Method base::print
print.emergency <- print_impl

#' @export
#' @exportS3Method base::print
print.supplier <- print_impl

#' @export
#' @exportS3Method base::print
print.medicaid <- print_impl

#' @export
#' @exportS3Method base::print
print.unit <- print_impl

#' @export
#' @exportS3Method base::print
print.subunit <- print_impl
