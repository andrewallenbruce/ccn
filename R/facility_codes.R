#' @autoglobal
#' @keywords internal
#' @noRd
IPPS_PARENT_HOSPITAL_TYPES <- list(
  "A" = c("LTCH", "20"),
  "B" = c("LTCH", "21"),
  "C" = c("LTCH", "22"),
  "D" = c("Rehabilitation Hospital", "30"),
  "E" = c("Children's Hospital", "33"),
  "F" = c("Psychiatric Hospital", "40"),
  "G" = c("Psychiatric Hospital", "41"),
  "H" = c("Psychiatric Hospital", "42"),
  "J" = c("Psychiatric Hospital", "43"),
  "K" = c("Psychiatric Hospital", "44")
)

#' @autoglobal
#' @keywords internal
#' @noRd
MEDICAID_FACILITY_CODES <- list(
  "NF (Formerly assigned to Medicaid SNF)"            = c("A", "B"),
  "NF (Formerly assigned to ICF)"                     = c("E", "F"),
  "ICF/IID"                                           = c("G", "H"),
  "Medicaid-Only Hospital"                            = "J",
  "Medicaid HHA"                                      = "K",
  "Psychiatric Residential Treatment Facility (PRTF)" = "L",
  "Psychiatric Unit of a CAH"                         = "M",
  "Rehabilitation Unit of a CAH"                      = "R",
  "Psychiatric Unit"                                  = "S",
  "Rehabilitation Unit"                               = "T",
  "Swing-Bed Approval for Short-Term Hospital"        = "U",
  "Swing-Bed Approval for Long-Term Care Hospital"    = "W",
  "Swing-Bed Approval for Rehabilitation Hospital"    = "Y",
  "Swing-Bed Approval for CAH"                        = "Z"
)

#' @autoglobal
#' @keywords internal
#' @noRd
MEDICAID_FACILITY_TYPE_CODES <- stringfish::sf_convert(
  unlist_(MEDICAID_FACILITY_CODES)[1:9])

#' @autoglobal
#' @keywords internal
#' @noRd
IPPS_EXCLUDED_TYPE_CODES <- stringfish::sf_convert(
  unlist_(MEDICAID_FACILITY_CODES)[c(10, 12:16, 18)])

#' Medicaid Facility Types
#'
#' Identify a Medicaid facility type
#'
#' @param x A character vector, length 1
#' @return A logical vector
#' @examples
#' is_medicaid_facility_type(LETTERS)
#' @export
#' @autoglobal
is_medicaid_facility_type <- function(x) {
  !cheapr::is_na(collapse::fmatch(x, MEDICAID_FACILITY_TYPE_CODES))
}

#' IPPS-Excluded Types
#'
#' Identify an IPPS-excluded type
#'
#' @param x character vector
#' @return logical vector
#' @examples
#' is_ipps_excluded_type(LETTERS)
#' @export
#' @autoglobal
is_ipps_excluded_type <- function(x) {
  !cheapr::is_na(collapse::fmatch(x, IPPS_EXCLUDED_TYPE_CODES))
}
