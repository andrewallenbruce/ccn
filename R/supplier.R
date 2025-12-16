#' Suppliers
#'
#' @description
#' Suppliers that are paid by Part B carriers have a 10-digit alphanumeric CCN.
#' The first 2 digits identify the State in which the supplier is located. The
#' third digit is an alpha character that identifies the type of facility. The
#' remaining 7 digits are the unique facility identifier.
#'
#' The RO assigns the following alpha-characters in the third position as
#' indicated:
#'
#'    * `C` - Ambulatory Surgical Centers
#'    * `D` - Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratories
#'    * `X` - Portable X-Ray Facilities
#'
#' @param x `<character>` 10-position alphanumeric code.
#' @name supplier
#' @returns S7 object of class `<Supplier>`.
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
