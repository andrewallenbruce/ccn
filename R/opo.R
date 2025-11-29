#' Organ Procurement Organizations (OPO)
#'
#' Functions for identifying and describing Organ Procurement Organizations (OPO) based on their codes.
#'
#' @name opo
#' @param x character vector of codes to look up.
#' @returns character vector of names associated with codes.
#' @examples
#' new_opo("05P001")
NULL

#' @rdname opo
#' @export
opo_sequence <- function(x) {
  Sequence(
    number = x,
    range = kit::iif(as_int(x) >= 1L & as_int(x) <= 99L, "001-099", NA_character_)
  )
}

#' @rdname opo
#' @export
opo_type <- function(x) {
  Type(
    code = x,
    abbr = kit::iif(x == "P", "OPO", NA_character_),
    desc = kit::iif(x == "P", "Organ Procurement Organization", NA_character_)
  )
}

#' @noRd
OPO <- S7::new_class(
  name = "OPO",
  parent = CCN,
  properties = list(type = Type)
)

#' @rdname opo
#' @export
new_opo <- function(x) {
  OPO(
    ccn      = x,
    entity   = "Medicare Provider",
    state    = state(x),
    type     = opo_type(substr_(x, 3L)),
    sequence = opo_sequence(substr_(x, c(4L, 6L)))
  )
}
