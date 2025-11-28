#' Organ Procurement Organizations (OPO)
#'
#' Functions for identifying and describing Organ Procurement Organizations (OPO) based on their codes.
#'
#' @name opo
#' @param x character vector of codes to look up.
#' @returns character vector of names associated with codes.
#' @examples
#' is_type_opo("P")
#' opo_abbr(c("P", "X"))
#' opo_desc("P")
#' opo_sequence("001")
#' opo_type("P")
NULL

#' @rdname opo
#' @export
is_type_opo <- function(x) {
  x == "P"
}

#' @rdname opo
#' @export
opo_abbr <- function(x) {
  cheapr::if_else_(x == "P", "OPO", NA_character_)
}

#' @rdname opo
#' @export
opo_desc <- function(x) {
  cheapr::if_else_(x == "P", "Organ Procurement Organization", NA_character_)
}

#' @rdname opo
#' @export
opo_sequence <- function(x) {
  Sequence(
    number = x,
    range = cheapr::if_else_(as_int(x) >= 1L & as_int(x) <= 99L, "001-099", NA_character_)
  )
}

#' @rdname opo
#' @export
opo_type <- function(x) {
  Type(
    code = x,
    abbr = opo_abbr(x),
    desc = opo_desc(x)
  )
}
