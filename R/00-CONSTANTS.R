#' @include utils.R
NULL

EMERGENCY = list(CODE = list("ERH-NF" = "E", "ERH-F" = "F"),
                 NAME = list("Non-Federal Emergency Hospital (Non-Participating)" = "ERH-NF",
                             "Federal Emergency Hospital (Non-Participating)"     = "ERH-F"))

SUPPLIER = list(CODE = list("ASC" = "C", "CLIA" = "D", "XRAY" = "X"),
                NAME = list("Ambulatory Surgical Center" = "ASC",
                            "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory" = "CLIA",
                            "Portable X-Ray Facility" = "XRAY"))

IPPS_EXCLUDED = list(
  CODE  = list(
    "PSYCH (CAH)" = "M",
    "REHAB (CAH)" = "R",
    "PSYCH"       = "S",
    "REHAB"       = "T",
    "SBA (STH)"   = "U",
    "SBA (LTCH)"  = "W",
    "SBA (REHAB)" = "Y",
    "SBA (CAH)"   = "Z"),
  LONG  = list(
    "Psychiatric Unit of a Critical Access Hospital" = "PSYCH (CAH)",
    "Rehabilitation Unit of a Critical Access Hospital" = "REHAB (CAH)",
    "Psychiatric Unit" = "PSYCH",
    "Rehabilitation Unit" = "REHAB",
    "Swing-Bed Approval for Short-Term Hospital" = "SBA (STH)",
    "Swing-Bed Approval for Long-Term Care Hospital" = "SBA (LTCH)",
    "Swing-Bed Approval for Rehabilitation Hospital" = "SBA (REHAB)",
    "Swing-Bed Approval for Critical Access Hospital" = "SBA (CAH)"),
  PARENT = list(
    "A" = c("LTCH", "20"),
    "B" = c("LTCH", "21"),
    "C" = c("LTCH", "22"),
    "D" = c("Rehabilitation Hospital", "30"),
    "E" = c("Children's Hospital", "33"),
    "F" = c("Psychiatric Hospital", "40"),
    "G" = c("Psychiatric Hospital", "41"),
    "H" = c("Psychiatric Hospital", "42"),
    "J" = c("Psychiatric Hospital", "43"),
    "K" = c("Psychiatric Hospital", "44"))
  )
