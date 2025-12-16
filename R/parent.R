#' @include subunit.R
NULL

#' Unit Parents
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @param ... additional arguments (not used).
#' @returns S7 object of class `Medicare`.
#' @examples
#' parent("21SE26")
#' subunit("21SE26")
#' parent("21SB26")
#' subunit("21SB26")
#' parent("21SD26")
#' subunit("21SD26")
#' @export
parent <- S7::new_generic("parent", "x")

S7::method(parent, class_character) <- function(x) {
  decode(x) |>
    S7::prop("parent") |>
    decode()
}
