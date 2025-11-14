#' @include utils.R
NULL

EMERGENCY = list(CODE = list("ERH-NF" = "E", "ERH-F" = "F"),
                 NAME = list("Non-Federal Emergency Hospital (Non-Participating)" = "ERH-NF",
                             "Federal Emergency Hospital (Non-Participating)"     = "ERH-F"))

SUPPLIER = list(CODE  = list("ASC" = "C", "CLIA" = "D", "XRAY" = "X"),
                RANGE = list("000001-9999999" = pad_seven(1:9999999)),
                NAME  = list("Ambulatory Surgical Center" = "ASC",
                             "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory" = "CLIA",
                             "Portable X-Ray Facility" = "XRAY"))

EXCLUDED = list(CODE = list("PSYCH (CAH)" = "M",
                            "REHAB (CAH)" = "R",
                            "PSYCH"       = "S",
                            "REHAB"       = "T",
                            "SBA (STH)"   = "U",
                            "SBA (LTCH)"  = "W",
                            "SBA (REHAB)" = "Y",
                            "SBA (CAH)"   = "Z"),
                NAME = list("Psychiatric Unit of a Critical Access Hospital"                                          = "PSYCH (CAH)",
                             "Rehabilitation Unit of a Critical Access Hospital"                                      = "REHAB (CAH)",
                             "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"    = "PSYCH",
                             "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital" = "REHAB",
                             "Swing-Bed Approval for Short-Term Hospital"                                             = "SBA (STH)",
                             "Swing-Bed Approval for Long-Term Care Hospital"                                         = "SBA (LTCH)",
                             "Swing-Bed Approval for Rehabilitation Hospital"                                         = "SBA (REHAB)",
                             "Swing-Bed Approval for Critical Access Hospital"                                        = "SBA (CAH)"),
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
                  "K" = c("Psychiatric Hospital", "44")))
