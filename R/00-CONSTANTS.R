#' @include utils.R
NULL

EMERGENCY_HOSPITAL_CODE_LIST  <- list("ER (NF)" = "E", "ER (F)" = "F")
EMERGENCY_HOSPITAL_NAME_LONG <- list(
  "Non-Federal Emergency Hospital" = "ER (NF)",
  "Federal Emergency Hospital"     = "ER (F)")

SUPPLIER_CODE_LIST  <- list("ASC" = "C", "CLIA" = "D", "XRAY" = "X")
SUPPLIER_NAME_LONG <- list(
  "Ambulatory Surgical Center"                                           = "ASC",
  "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory" = "CLIA",
  "Portable X-Ray Facility"                                              = "XRAY")

MEDICAID_FACILITY_CODE_LIST_ALL <- list(
  "NF (SNF)"    = c("A", "B"),
  "NF (ICF)"    = c("E", "F"),
  "ICF/IID"     = c("G", "H"),
  "MCD HOSP"    = "J",
  "MCD HHA"     = "K",
  "PRTF"        = "L",
  "PSYCH (CAH)" = "M",
  "REHAB (CAH)" = "R",
  "PSYCH"       = "S",
  "REHAB"       = "T",
  "SBA (STH)"   = "U",
  "SBA (LTCH)"  = "W",
  "SBA (REHAB)" = "Y",
  "SBA (CAH)"   = "Z")

MEDICAID_FACILITY_NAME_LONG_ALL <- list(
  "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)" = "NF (SNF)",
  "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"        = "NF (ICF)",
  "Intermediate Care Facility for Individuals with Intellectual Disabilities" = "ICF/IID",
  "Medicaid-Only Hospital"                                                    = "MCD HOSP",
  "Medicaid Home Health Agency"                                               = "MCD HHA",
  "Psychiatric Residential Treatment Facility"                                = "PRTF",
  "Psychiatric Unit of a Critical Access Hospital"                            = "PSYCH (CAH)",
  "Rehabilitation Unit of a Critical Access Hospital"                         = "REHAB (CAH)",
  "Psychiatric Unit"                                                          = "PSYCH",
  "Rehabilitation Unit"                                                       = "REHAB",
  "Swing-Bed Approval for Short-Term Hospital"                                = "SBA (STH)",
  "Swing-Bed Approval for Long-Term Care Hospital"                            = "SBA (LTCH)",
  "Swing-Bed Approval for Rehabilitation Hospital"                            = "SBA (REHAB)",
  "Swing-Bed Approval for Critical Access Hospital"                           = "SBA (CAH)")

MEDICAID_FACILITY_CODE_LIST  <- MEDICAID_FACILITY_CODE_LIST_ALL[1:6]
IPPS_EXCLUDED_TYPE_CODE_LIST <- MEDICAID_FACILITY_CODE_LIST_ALL[c(7, 9:12, 14)]

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
