#' Decode CCNs
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns S7 object of class `Medicare`.
#' @examples
#' decode("670055")
#' decode("123456")
#' @export
decode <- function(x) {
  decode_(parse(x))
}

#' @noRd
decode_ <- S7::new_generic("decode_", "x")

S7::method(decode_, S7::new_S3_class("medicare")) <- function(x) {
  Medicare(
    ccn = x[["ccn"]],
    state = State(x[["state"]]),
    range = RangeMCR(x[["sequence"]]),
    extension = x[["extension"]] %||% NA_character_
  )
}

local({
  S7::method(print, Medicare) <- function(x, ...) {
    cli::cli_text(
      paste0(rep(cli::symbol$line, 4), collapse = ""),
      "<{cli::col_cyan(class(x)[1])}>"
    )
    cli::cli_text(cli::symbol$circle_filled, " CCN: <{cli::col_yellow(x@ccn)}>")
    cli::cli_text(
      cli::symbol$circle_filled,
      " State: {cli::col_yellow(x@state@abbr)} - {cli::col_green(x@state@name)}"
    )
    cli::cli_text(
      cli::symbol$circle_filled,
      " Facility Type: {cli::col_yellow(x@range@abbr)} - {cli::col_green(x@range@desc)}"
    )
    cli::cli_text(
      cli::symbol$circle_filled,
      " IPPS-Excluded: {if (x@range@eipps) cli::col_red(cli::symbol$tick) else cli::col_yellow(cli::symbol$cross)}"
    )
    invisible(x)
  }
})
