#' Organ Procurement Organizations (OPO)
#'
#' Organ Procurement Organizations (OPO) based on their codes.
#'
#' @name medicare_opo
#' @param x character vector of codes to look up.
#' @returns S7 object of class `MedicareOPO`.
#' @examples
#' medicare_opo("05P001")
NULL

#' @noRd
opo_sequence <- function(x) {
  Sequence(number = x, range = if_in(x, c(1L, 99L), "001-099"))
}

#' @noRd
opo_type <- function(x) {
  Type(
    code = x,
    abbr = kit::iif(is_opo_type(x), "OPO", NA_character_),
    desc = kit::iif(
      is_opo_type(x),
      "Organ Procurement Organization",
      NA_character_
    )
  )
}

#' @noRd
MedicareOPO <- S7::new_class(
  name       = "MedicareOPO",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname medicare_opo
#' @export
medicare_opo <- function(x) {
  MedicareOPO(
    ccn      = x,
    entity   = "Medicare Provider",
    state    = state(x),
    type     = opo_type(substr_(x, 3L)),
    sequence = opo_sequence(substr(x, 4L, 6L))
  )
}
