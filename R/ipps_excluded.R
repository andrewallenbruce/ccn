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
#' eipps_unit("21T101")
#' eipps_unit("21S101")
#' eipps_unit("21U101")
#'
#' medicare_provider("212026")
#' eipps_unit2("21SA26")
#' eipps_parent("21SA26")
#' eipps_unit2("21TA26")
#' eipps_parent("21TA26")
#'
#' medicare_provider("022001")
#' eipps_unit2("02TA01")
#' eipps_parent("02TA01")
#'
#' medicare_provider("043038")
#' eipps_unit2("04SD38")
#' eipps_parent("04SD38")
#'
#' medicare_provider("522005")
#' eipps_unit2("52TA05")
#' eipps_parent("52TA05")
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
  Type(code = x,
       abbr = eipps_abbr(x),
       desc = eipps_desc(x))
}

#' @noRd
EippsUnit <- S7::new_class(
  name       = "EippsUnit",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname eipps
#' @export
eipps_unit <- function(x) {
  EippsUnit(
    ccn      = x,
    entity   = "IPPS-Excluded Unit",
    state    = state(x),
    sequence = mof_sequence(substr(x, 4L, 6L)),
    type     = eipps_type(substr_(x, 3L))
  )
}

#' @noRd
eipps_prefix <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_hospital_units_types$code,
    outputs = ccn::eipps_hospital_units_types$prefix,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
eipps_sequence <- function(x) {
  paste0(eipps_prefix(substr_(x, 4L)), substr(x, 5L, 6L))
}

#' @noRd
eipps_parent_ccn <- function(x) {
  paste0(str_state(x), eipps_sequence(x))
}

#' @noRd
EippsParent2 <- S7::new_class(
  name       = "EippsParent2",
  properties = list(
    code     = S7::class_character,
    ccn      = S7::class_character
  )
)

#' @noRd
eipps_parent2 <- function(x) {
  EippsParent2(
    code = substr_(x, 4L),
    ccn  = eipps_parent_ccn(x))
}

#' @noRd
EippsUnit2 <- S7::new_class(
  name       = "EippsUnit2",
  parent     = EippsUnit,
  properties = list(parent = EippsParent2)
)

#' @rdname eipps
#' @export
eipps_unit2 <- function(x) {
  EippsUnit2(
    ccn      = x,
    entity   = "IPPS-Excluded Unit",
    state    = state(x),
    sequence = medicare_sequence(eipps_sequence(x)),
    type     = eipps_type(substr_(x, 3L)),
    parent   = eipps_parent2(x)
  )
}

#' @noRd
eipps_subunit <- function(x) {
  SubUnit(
    ccn    = x,
    entity = "IPPS-Excluded Subunit",
    type   = eipps_type(substr_(x, 3L)))
}

#' @include medicare.R
#' @noRd
EippsParent <- S7::new_class(
  name       = "EippsParent",
  parent     = Medicare,
  properties = list(subunit = SubUnit)
)

#' @rdname eipps
#' @export
eipps_parent <- function(x) {
  EippsParent(
    ccn      = eipps_parent_ccn(x),
    entity   = "Medicare Provider",
    state    = state(x),
    sequence = medicare_sequence(eipps_sequence(x)),
    subunit  = eipps_subunit(x)
  )
}
