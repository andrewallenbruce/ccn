#' @include unit.R
NULL

#' IPPS-Excluded Hospital Subunits
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x `<character>` 6-position alphanumeric code.
#' @name subunit
#' @returns S7 object of class `<Subunit>`.
#' @examples
#' subunit("21SA26")
#' subunit("21TA26")
#' subunit("02TA01")
#' subunit("04SD38")
#' subunit("52TA05")
NULL

#' @noRd
subunit_prefix <- function(x) {
  vs(x, ccn::subunit_types$code, ccn::subunit_types$prefix)
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
Subunit <- S7::new_class(
  name = "Subunit",
  properties = list(
    ccn = S7::class_character,
    state = State,
    type = TypeUnit,
    parent = S7::new_property(
      S7::class_character,
      getter = function(self) {
        subunit_parent_ccn(self@ccn)
      }
    )
  )
)

#' @rdname subunit
#' @export
subunit <- function(x) {
  Subunit(
    ccn = x,
    state = state(x),
    type = TypeUnit(substring(x, 3L, 3L))
  )
}
