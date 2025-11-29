#' Emergency Hospital
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name emergency
#' @returns character vector of names associated with codes.
#' @examples
#' is_emergency_type(c("E", "F"))
#' emergency_type_abbr(c("E", "F"))
#' emergency_type_desc(c("E", "F"))
#' emergency_type("E")
NULL

#' @rdname emergency
#' @export
is_emergency_type <- function(x) {
  x %in% c("E", "F")
}

#' @rdname emergency
#' @export
emergency_type_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("E", "F"),
    outputs = c("ER (NF)", "ER (F)"),
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname emergency
#' @export
emergency_type_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("E", "F"),
    outputs = c(
      "Non-Federal Emergency Hospital (Non-Participating)",
      "Federal Emergency Hospital (Non-Participating)"
    ),
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname emergency
#' @export
emergency_type <- function(x) {
  Type(
    code = x,
    abbr = emergency_type_abbr(x),
    desc = emergency_type_desc(x)
  )
}

#' @rdname emergency
#' @export
emergency_sequence <- function(x) {
  Sequence(
    number = x,
    range = kit::iif(as_int(x) >= 1L & as_int(x) <= 999L, "001-999", NA_character_)
  )
}
