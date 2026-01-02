#' @noRd
print_impl <- function(x) {
  cli::cli_text(
    # paste0(rep(cli::symbol$line, 2), collapse = ""),
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
