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
org_range <- function(x) {
  if_in(substr(x, 4L, 6L), c(1L, 99L), "001-099")
}

#' @noRd
org_type <- function(x) {
  Type(
    code = x,
    abbr = is_in(is_organ_type(x), "OPO"),
    desc = is_in(is_organ_type(x), "Organ Procurement Organization")
  )
}

#' @rdname organ
#' @export
organ <- function(x) {
  Organ(
    ccn = x,
    state = state(x),
    sequence = substr(x, 4L, 6L),
    range = org_range(x),
    type = org_type(str3(x))
  )
}
