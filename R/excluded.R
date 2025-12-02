#' IPPS-Excluded Hospital Units/Swing-Bed Approvals
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name eipps
#' @returns character vector of names associated with codes.
#' @examples
#' medicare_provider("210101")
#' eipps_hospital("21T101")
#' eipps_hospital("21S101")
#' eipps_hospital("21U101")
NULL

#' @noRd
eipps_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_unit_swing_types$code,
    outputs = ccn::eipps_unit_swing_types$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
eipps_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_unit_swing_types$code,
    outputs = ccn::eipps_unit_swing_types$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
eipps_type <- function(x) {
  Type(
    code = x,
    abbr = eipps_abbr(x),
    desc = eipps_desc(x)
  )
}

#' @noRd
Eipps <- S7::new_class(
  name = "Eipps",
  parent = CCN,
  properties = list(type = Type)
)

#' @rdname eipps
#' @export
eipps_hospital <- function(x) {
  Eipps(
    ccn      = x,
    entity   = "IPPS-Excluded",
    state    = state(x),
    sequence = mof_sequence(substr(x, 4L, 6L)),
    type     = eipps_type(substr_(x, 3L))
  )
}

#' @noRd
IppsExcludedParent <- S7::new_class(
  name = "IppsExcludedParent",
  properties = list(
    type = S7::class_character,
    ccn = S7::class_character
  )
)

#' @noRd
IppsExcludedUnit <- S7::new_class(
  name = "IppsExcludedUnit",
  parent = Eipps,
  properties = list(
    type = Type,
    parent = IppsExcludedParent
  )
)
