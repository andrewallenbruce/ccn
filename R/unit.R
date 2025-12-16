#' IPPS-Excluded Hospital Units
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name unit
#' @returns character vector of names associated with codes.
#' @examples
#' medicare("210101")
#' unit("21T101")
#' unit("21S101")
#' unit("21U101")
NULL

#' @noRd
unit_type_abbr <- function(x) {
  vs(x, ccn::unit_types[["code"]], ccn::unit_types[["abbr"]])
}

#' @noRd
unit_type_desc <- function(x) {
  vs(x, ccn::unit_types[["code"]], ccn::unit_types[["desc"]])
}

#' @noRd
unit_parent_ccn <- function(x) {
  paste0(substring(x, 1L, 2L), "_", substring(x, 4L, 6L))
}

#' @noRd
TypeUnit <- S7::new_class(
  name = "TypeUnit",
  parent = Type,
  properties = list(eipps = S7::class_logical),
  constructor = function(code) {
    if (length(code) != 1L) {
      check_arg(code, "must be length {.strong 1}.")
    }
    if (nchar(code) != 1L) {
      check_arg(code, "must be {.strong 1} character.")
    }
    if (!is_unit_type(code)) {
      check_arg(code, "{.val {x}} is an invalid unit type.")
    }
    S7::new_object(
      S7::S7_object(),
      abbr = unit_type_abbr(code),
      desc = unit_type_desc(code),
      eipps = is_eipps_type(code)
    )
  }
)

#' @noRd
Unit <- S7::new_class(
  name = "Unit",
  properties = list(
    ccn = S7::class_character,
    state = State,
    range = S7::class_character,
    type = TypeUnit,
    parent = S7::new_property(
      S7::class_character,
      getter = function(self) {
        unit_parent_ccn(self@ccn)
      }
    )
  )
)

#' @rdname unit
#' @export
unit <- function(x) {
  Unit(
    ccn = x,
    state = state(x),
    range = if_in(substring(x, 4L, 6L), c(1L, 999L), "001-999"),
    type = TypeUnit(substring(x, 3L, 3L))
  )
}
