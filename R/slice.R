#' Medicare Provider: 670055 -> 67 0055
#' @param x character vector of codes to look up.
#' @param ... additional arguments (not used).
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
print_impl <- function(x) {
  cli::cli_text(
    paste0(rep(cli::symbol$line, 2), collapse = ""),
    "<{cli::col_red('parsed')}:{cli::col_yellow(class(x))}>"
  )
  glue::glue(
    '{cli::col_silver(format(names(x), justify = "right"))}',
    '{cli::col_grey(":")} {unname(x)}'
  ) |>
    cat(sep = "\n")
  invisible(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.medicare <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.organ <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.emergency <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.supplier <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.medicaid <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.unit <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.subunit <- function(x, ...) {
  list2DF(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.medicare <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.organ <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.emergency <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.supplier <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.medicaid <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.unit <- function(x, ...) {
  print_impl(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.subunit <- function(x, ...) {
  print_impl(x)
}
