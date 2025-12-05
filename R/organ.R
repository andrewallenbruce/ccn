#' Organ Procurement Organizations (OPO)
#'
#' Organ Procurement Organizations (OPO) based on their codes.
#'
#' @name organ
#' @param x character vector of codes to look up.
#' @returns S7 object of class `Organ`.
#' @examples
#' organ("05P001")
NULL

#' @noRd
org_seq <- function(x) {
  Sequence(x, if_in(x, c(1L, 99L), "001-099"))
}

#' @noRd
org_type <- function(x) {
  Type(
    code = x,
    abbr = kit::iif(is_organ_type(x), "OPO", NA_character_),
    desc = kit::iif(
      is_organ_type(x),
      "Organ Procurement Organization",
      NA_character_
    )
  )
}

#' @noRd
Organ <- S7::new_class(
  name       = "Organ",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname organ
#' @export
organ <- function(x) {
  Organ(
    ccn      = x,
    entity   = "Medicare Provider",
    state    = state(x),
    type     = org_type(substr_(x, 3L)),
    sequence = org_seq(substr(x, 4L, 6L))
  )
}
