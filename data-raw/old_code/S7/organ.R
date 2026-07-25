#' Organ Procurement Organizations
#'
#' @description
#' Organ procurement organizations (OPOs) are assigned a 6-digit alphanumeric
#' CCN. The first 2 digits identify the State code. The third digit is the alpha
#' character `P`. The remaining 3 digits are the unique facility identifier.
#'
#' @name organ
#' @param x `<character>` 6-position alphanumeric code.
#' @returns S7 object of class `<Organ>`.
#' @examples
#' organ("05P001")
NULL

#' @noRd
org_type <- function(x) {
  Type(
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
    range = if_in(substring(x, 4L, 6L), c(1L, 99L), "001-099"),
    type = org_type(substring(x, 3L, 3L))
  )
}
