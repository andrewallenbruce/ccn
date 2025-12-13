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
#' subunit("21SA26")
#' parent("21SA26")
#' subunit("21TA26")
#' parent("21TA26")
#'
#' subunit("02TA01")
#' parent("02TA01")
#'
#' subunit("04SD38")
#' parent("04SD38")
#'
#' subunit("52TA05")
#' parent("52TA05")
NULL

#' @noRd
subunit_prefix <- function(x) {
  vs(x, ccn::subunit_types[["code"]], ccn::subunit_types[["prefix"]])
}

#' @noRd
subunit_sequence <- function(x) {
  paste0(subunit_prefix(substring(x, 4L, 4L)), substring(x, 5L, 6L))
}

#' @noRd
subunit_parent_ccn <- function(x) {
  paste0(substring(x, 1L, 2L), subunit_sequence(x))
}

#' @noRd
SubunitParent <- S7::new_class(
  name = "SubunitParent",
  properties = list(
    code = S7::class_character,
    ccn = S7::class_character,
    range = RangeMCR
  )
)

#' @noRd
subunit_parent <- function(x) {
  SubunitParent(
    code = substring(x, 4L, 4L),
    ccn = subunit_parent_ccn(x),
    range = RangeMCR(subunit_sequence(x))
  )
}

#' @noRd
EippsSubunit <- S7::new_class(
  name = "EippsSubunit",
  parent = Unit,
  properties = list(parent = SubunitParent)
)

#' @rdname subunit
#' @export
subunit <- function(x) {
  EippsSubunit(
    ccn = x,
    state = state(x),
    type = TypeUnit(substring(x, 3L, 3L)),
    parent = subunit_parent(x)
  )
}

#' @noRd
subunit_ <- function(x) {
  Subunit(ccn = x, type = TypeUnit(substring(x, 3L, 3L)))
}

#' @rdname subunit
#' @export
parent <- function(x) {
  Parent(
    ccn = subunit_parent_ccn(x),
    state = state(x),
    range = RangeMCR(subunit_sequence(x)),
    subunit = subunit_(x)
  )
}
