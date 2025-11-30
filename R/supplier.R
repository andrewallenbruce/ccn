#' Medicare Supplier
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicare_supplier
#' @returns S7 object of class `Supplier`.
#' @examples
#' medicare_supplier("10C0001062")
#' medicare_supplier("45D0634589")
#' medicare_supplier("21X0009807")
#' medicare_supplier("12C0001062")
NULL

#' @noRd
supplier_sequence <- function(x) {
  Sequence(
    number = x,
    range  = kit::iif(as_int(x) >= 1L & as_int(x) <= 9999999L, "0000001-9999999", NA_character_)
  )
}

#' @noRd
supplier_type_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("C", "D", "X"),
    outputs = c("ASC", "CLIA", "PXRF"),
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
supplier_type_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("C", "D", "X"),
    outputs = c("Ambulatory Surgical Center",
                "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory",
                "Portable X-Ray Facility"),
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
supplier_type <- function(x) {
  Type(code = x,
       abbr = supplier_type_abbr(x),
       desc = supplier_type_desc(x))
}

#' @noRd
Supplier <- S7::new_class(
  name        = "Supplier",
  parent      = CCN,
  properties  = list(
    sequence  = Sequence,
    type      = Type,
    extension = PropExtension
  )
)

#' @rdname medicare_supplier
#' @export
medicare_supplier <- function(x) {
  Supplier(
    ccn      = x,
    entity   = "Medicare Supplier",
    state    = state(x),
    type     = supplier_type(substr_(x, 3L)),
    sequence = supplier_sequence(substr(x, 4L, 10L))
  )
}
