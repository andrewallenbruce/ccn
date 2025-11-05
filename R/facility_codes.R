#' @autoglobal
#' @keywords internal
#' @noRd
MEDICAID_FACILITY_TYPE_CODES <- stringfish::convert_to_sf(
  c("A", "B", "E", "F", "G", "H", "J", "K", "L"))

#' Medicaid Facility Types
#'
#' Identify if a CCN corresponds to a Medicaid facility type.
#'
#' @param x A character vector, length 1
#' @return A logical vector
#' @examples
#' LETTERS[is_medicaid_facility_type(LETTERS)]
#' @export
#' @autoglobal
is_medicaid_facility_type <- function(x) {
  stringfish::sf_grepl(
    subject  = x,
    pattern  = MEDICAID_FACILITY_TYPE_CODES,
    fixed    = TRUE,
    nthreads = 4L
  )
}

#' @noRd
#' @autoglobal
IPPS_EXCLUDED_TYPE_CODES <- stringfish::convert_to_sf(
  c("M", "R", "S", "T", "U", "W", "Z"))

#' IPPS-Excluded Types
#'
#' Identify if a CCN corresponds to an IPPS-excluded type.
#'
#' @param x A character vector, length 1
#' @return A logical vector
#' @examples
#' LETTERS[purrr::map_lgl(LETTERS, is_ipps_excluded_type)]
#' @export
#' @autoglobal
is_ipps_excluded_type <- function(x) {
  stringfish::sf_grepl(
    subject  = x,
    pattern  = IPPS_EXCLUDED_TYPE_CODES,
    fixed    = TRUE,
    nthreads = 4L
  )
}

#' @autoglobal
#' @keywords internal
#' @noRd
MEDICAID_FACILITY_CODES = list(
  "NF (Formerly assigned to Medicaid SNF)"            = c("A", "B"),
  "NF (Formerly assigned to ICF)"                     = c("E", "F"),
  "ICF/IID"                                           = c("G", "H"),
  "Medicaid-Only Hospital"                            = c("J"),
  "Medicaid HHA"                                      = c("K"),
  "Psychiatric Residential Treatment Facility (PRTF)" = c("L"),
  "Psychiatric Unit of a CAH"                         = c("M"),
  "Organ Procurement Organization (OPO)"              = c("O"),
  "Rehabilitation Unit of a CAH"                      = c("R"),
  "Psychiatric Unit"                                  = c("S"),
  "Rehabilitation Unit"                               = c("T"),
  "Swing-Bed Approval for Short-Term Hospital"        = c("U"),
  "Swing-Bed Approval for Long-Term Care Hospital"    = c("W"),
  "Swing-Bed Approval for Rehabilitation Hospital"    = c("Y"),
  "Swing-Bed Approval for CAH"                        = c("Z")
)

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
