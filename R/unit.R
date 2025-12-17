#' Hospital Units
#'
#' @description
#' An alpha character in the third position of a CCN identifies either hospitals
#' with swing-bed approval, rehabilitation units, or psychiatric units excluded
#' from IPPS payment.
#'
#' The first 2 digits identify the State in which the provider is located. The
#' third position (which is alpha) identifies the type of unit or swing-bed
#' designation.
#'
#' __The last 3 digits must match the last 3 digits of the parent provider.__
#'
#' @param x `<character>` 6-position alphanumeric code.
#' @name unit
#' @returns S7 object of class `<Unit>`.
#' @examples
#' medicare("210101")
#' unit("21T101")
#' unit("21S101")
#' unit("21U101")
#'
#' unit("28Z348")
#' medicare("281348")
NULL

#' @noRd
unit_type_infix <- function(x) {
  vs(x, ccn::unit_types[["code"]], ccn::unit_types[["infix"]])
}

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
  paste0(
    substring(x, 1L, 2L),
    unit_type_infix(substring(x, 3L, 3L)),
    substring(x, 4L, 6L)
  )
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
