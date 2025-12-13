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
supplier_type <- function(x) {
  Type(
    abbr = vs(x, c("C", "D", "X"), c("ASC", "CLIA", "PXRF")),
    desc = vs(
      x,
      c("C", "D", "X"),
      c(
        "Ambulatory Surgical Center",
        "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory",
        "Portable X-Ray Facility"
      )
    )
  )
}

#' @rdname supplier
#' @export
supplier <- function(x) {
  Supplier(
    ccn = x,
    state = state(x),
    range = if_in(substring(x, 4L, 10L), c(1L, 9999999L), "0000001-9999999"),
    type = supplier_type(substring(x, 3L, 3L))
  )
}
