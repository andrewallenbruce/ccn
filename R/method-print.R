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
