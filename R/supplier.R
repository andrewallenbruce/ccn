#' Medicare Supplier
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name supplier
#' @returns S7 object of class `Supplier`.
#' @examples
#' supplier("10C0001062")
#' supplier("45D0634589")
#' supplier("21X0009807")
#' supplier("12C0001062")
NULL

#' @noRd
supplier_range <- function(x) {
  if_in(substr(x, 4L, 10L), c(1L, 9999999L), "0000001-9999999")
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

#' @rdname supplier
#' @export
supplier <- function(x) {
  Supplier(
    ccn      = x,
    state    = state(x),
    sequence = substr(x, 4L, 10L),
    range    = supplier_range(x),
    type     = supplier_type(substr_(x, 3L))
  )
}
