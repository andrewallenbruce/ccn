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
  fmt_head(x) |> cat(sep = "\n")
  paste0(fmt_names(x), unlist_(x)) |> cat(sep = "\n")
  invisible(x)
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.medicare <- print_impl

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.organ <- print_impl

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.emergency <- print_impl

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.supplier <- print_impl

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.medicaid <- print_impl

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.unit <- print_impl

#' @rdname slice_medicare
#' @export
#' @keywords internal
print.subunit <- print_impl
