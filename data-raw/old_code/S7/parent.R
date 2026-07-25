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
#' parent("21AE26")
#' parent("21SE26")
#' parent("21SB26")
#' parent("21SD26")
#' @export
parent <- S7::new_generic("parent", "x")

#' @noRd
has_parent <- function(x) {
  inherits(x, "subunit") ||
    inherits(x, "unit") & (!x$type %chin% c("S", "T", "V"))
}

S7::method(parent, S7::class_character) <- function(x) {
  x <- parse(x)

  if (has_parent(x)) {
    return(parent(x))
  }
  cli::cli_alert_danger(
    "{.strong {.pkg {x$ccn}}} ({.obj_type_friendly {x}}) has no {.cls parent} unit."
  )
  invisible(NULL)
}

S7::method(parent, S7::new_S3_class("unit")) <- function(x) {
  unit_parent_ccn(x$ccn) |>
    parse() |>
    parent()
}


S7::method(parent, S7::new_S3_class("subunit")) <- function(x) {
  subunit_parent_ccn(x$ccn) |>
    parse() |>
    parent()
}

S7::method(parent, S7::new_S3_class("medicare")) <- function(x) {
  decode(x)
}
