#' @autoglobal
#' @noRd
EMERGENCY_CODES <- list(
  "Non-Federal Emergency Hospital" = "E",
  "Federal Emergency Hospital" = "F"
)

#' @autoglobal
#' @noRd
SUPPLIER_CODES <- list(
  "Ambulatory Surgical Center"                                           = "C",
  "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory" = "D",
  "Portable X-Ray Facility"                                              = "X"
)

#' Supplier Code Lookup
#' Convert supplier codes to standard supplier names.
#' @param x character vector of supplier codes.
#' @examples
#' supplier_code(c("C", "D", "X"))
#' @returns character vector of supplier names.
#' @autoglobal
#' @export
supplier_code <- make_switch(x = SUPPLIER_CODES)

#' Emergency Code Lookup
#' Convert emergency codes to standard emergency names.
#' @param x character vector of emergency codes.
#' @examples
#' emergency_code(c("E", "F"))
#' @returns character vector of emergency names.
#' @autoglobal
#' @export
emergency_code <- make_switch(x = EMERGENCY_CODES)
