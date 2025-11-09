#' @autoglobal
#' @noRd
EMERGENCY_HOSPITAL_CODES <- list(
  "Non-Federal Emergency Hospital" = "E",
  "Federal Emergency Hospital"     = "F"
)

#' Supplier Types
#'
#' Identify a Medicaid supplier type
#'
#' @param x A character vector, length 1
#' @return A logical vector
#' @examples
#' is_emergency_hospital_code(LETTERS)
#' @export
#' @autoglobal
is_emergency_hospital_code <- function(x) {
  !cheapr::is_na(collapse::fmatch(x, unlist_(EMERGENCY_HOSPITAL_CODES)))
}

#' Emergency Hospital Codes
#'
#' Convert emergency codes to standard emergency names.
#'
#' @param x character vector of emergency codes.
#'
#' @examples
#' emergency_hospital_name(c("E", "F"))
#'
#' @returns character vector of emergency code names.
#' @autoglobal
#' @export
emergency_hospital_name <- make_switch(EMERGENCY_HOSPITAL_CODES)

#' @autoglobal
#' @noRd
SUPPLIER_CODES <- list(
  "Ambulatory Surgical Center"                                           = "C",
  "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory" = "D",
  "Portable X-Ray Facility"                                              = "X"
)

#' Supplier Types
#'
#' Identify a Medicaid supplier type
#'
#' @param x A character vector, length 1
#' @return A logical vector
#' @examples
#' is_supplier_code(LETTERS)
#' @export
#' @autoglobal
is_supplier_code <- function(x) {
  !cheapr::is_na(collapse::fmatch(x, unlist_(SUPPLIER_CODES)))
}

#' Supplier Code Lookup
#' Convert supplier codes to standard supplier names.
#' @param x character vector of supplier codes.
#' @examples
#' supplier_name(c("C", "D", "X"))
#' @returns character vector of supplier names.
#' @autoglobal
#' @export
supplier_name <- make_switch(SUPPLIER_CODES)
