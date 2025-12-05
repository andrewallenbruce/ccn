#' IPPS-Excluded Hospital Units/Swing-Bed Approvals
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name eipps
#' @returns character vector of names associated with codes.
#' @examples
#' medicare("210101")
#' unit("21T101")
#' unit("21S101")
#' unit("21U101")
#'
#' medicare("212026")
#' eipps("21SA26")
#' parent("21SA26")
#' eipps("21TA26")
#' parent("21TA26")
#'
#' medicare("022001")
#' eipps("02TA01")
#' parent("02TA01")
#'
#' medicare("043038")
#' eipps("04SD38")
#' parent("04SD38")
#'
#' medicare("522005")
#' eipps("52TA05")
#' parent("52TA05")
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
eipps_type <- function(x) {
  Type(code = x,
       abbr = eipps_abbr(x),
       desc = eipps_desc(x))
}

#' @noRd
Unit <- S7::new_class(
  name       = "Unit",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname eipps
#' @export
unit <- function(x) {
  Unit(
    ccn      = x,
    entity   = "IPPS-Excluded Unit",
    state    = state(x),
    sequence = mof_sequence(substr(x, 4L, 6L)),
    type     = eipps_type(substr_(x, 3L))
  )
}

#' @include medicare.R
#' @noRd
SubunitParent <- S7::new_class(
  name       = "SubunitParent",
  properties = list(
    code     = S7::class_character,
    ccn      = S7::class_character,
    sequence = MedicareSequence
  )
)

#' @noRd
subunit_parent <- function(x) {
  SubunitParent(
    code     = substr_(x, 4L),
    ccn      = eipps_parent_ccn(x),
    sequence = medicare_sequence(eipps_sequence(x)))
}

#' @noRd
EippsSubunit <- S7::new_class(
  name       = "EippsSubunit",
  parent     = Unit,
  properties = list(parent = SubunitParent)
)

#' @rdname eipps
#' @export
eipps <- function(x) {
  EippsSubunit(
    ccn      = x,
    entity   = "IPPS-Excluded Provider",
    state    = state(x),
    type     = eipps_type(substr_(x, 3L)),
    parent   = subunit_parent(x)
  )
}

#' @noRd
subunit <- function(x) {
  Subunit(
    ccn    = x,
    entity = "IPPS-Excluded Subunit",
    type   = eipps_type(substr_(x, 3L)))
}

#' @rdname eipps
#' @export
parent <- function(x) {
  Parent(
    ccn      = eipps_parent_ccn(x),
    entity   = "Medicare Provider",
    state    = state(x),
    sequence = medicare_sequence(eipps_sequence(x)),
    subunit  = subunit(x)
  )
}
