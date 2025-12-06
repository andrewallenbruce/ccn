#' @include medicare.R
#' @include unit.R
NULL

#' IPPS-Excluded Hospital Sub-Units
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x <character> scalar.
#' @name subunit
#' @returns character vector of names associated with codes.
#' @examples
#' medicare("212026")
#' subunit("21SA26")
#' parent("21SA26")
#' subunit("21TA26")
#' parent("21TA26")
#'
#' medicare("022001")
#' subunit("02TA01")
#' parent("02TA01")
#'
#' medicare("043038")
#' subunit("04SD38")
#' parent("04SD38")
#'
#' medicare("522005")
#' subunit("52TA05")
#' parent("52TA05")
NULL

#' @noRd
eipps_prefix <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_subunit$code,
    outputs = ccn::eipps_subunit$prefix,
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
SubunitParent <- S7::new_class(
  name       = "SubunitParent",
  properties = list(
    code     = S7::class_character,
    ccn      = S7::class_character,
    sequence = RangeMDC
  )
)

#' @noRd
subunit_parent <- function(x) {
  SubunitParent(
    code     = substr_(x, 4L),
    ccn      = eipps_parent_ccn(x),
    sequence = range_mdc(eipps_sequence(x)))
}

#' @noRd
EippsSubunit <- S7::new_class(
  name       = "EippsSubunit",
  parent     = Unit,
  properties = list(parent = SubunitParent)
)

#' @rdname subunit
#' @export
subunit <- function(x) {
  EippsSubunit(
    ccn      = x,
    state    = state(x),
    type     = eipps_type(substr_(x, 3L)),
    parent   = subunit_parent(x)
  )
}

#' @noRd
subunit_ <- function(x) {
  Subunit(ccn = x, type = eipps_type(substr_(x, 3L)))
}

#' @rdname subunit
#' @export
parent <- function(x) {
  Parent(
    ccn      = eipps_parent_ccn(x),
    state    = state(x),
    sequence = eipps_sequence(x),
    range = range_mdc(eipps_sequence(x)),
    subunit  = subunit_(x)
  )
}
