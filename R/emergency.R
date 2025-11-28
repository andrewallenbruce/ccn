#' Emergency Hospital
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name emergency
#' @returns character vector of names associated with codes.
#' @examples
#' is_type_emergency(c("E", "F"))
#' emergency_abbr(c("E", "F"))
#' emergency_desc(c("E", "F"))
#' emergency_type("E")
NULL

#' @rdname emergency
#' @export
is_type_emergency <- function(x) {
  x %in_% c("E", "F")
}

#' @rdname emergency
#' @export
emergency_abbr <- function(x) {
  cheapr::val_match(
    x,
    "E" ~ "ER (NF)",
    "F" ~ "ER (F)",
    .default = NA_character_
  )
}

#' @rdname emergency
#' @export
emergency_desc <- function(x) {
  cheapr::val_match(
    x,
    "E" ~ "Non-Federal Emergency Hospital (Non-Participating)",
    "F" ~ "Federal Emergency Hospital (Non-Participating)",
    .default = NA_character_
  )
}

#' @rdname emergency
#' @export
emergency_type <- function(x) {
  Type(
    code = x,
    abbr = emergency_abbr(x),
    desc = emergency_desc(x)
  )
}

#' @rdname emergency
#' @export
emergency_sequence <- function(x) {
  Sequence(
    number = x,
    range = cheapr::if_else_(
      as_int(x) >= 1L & as_int(x) <= 999L,
      "001-999",
      NA_character_
    )
  )
}
