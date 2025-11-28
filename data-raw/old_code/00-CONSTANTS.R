#' @include utils.R
NULL

EMERGENCY = list(CODE = list("ER (NF)" = "E", "ER (F)" = "F"),
                 NAME = list("Non-Federal Emergency Hospital (Non-Participating)" = "ER (NF)",
                             "Federal Emergency Hospital (Non-Participating)"     = "ER (F)"))

OPO = list(CODE  = list("OPO" = "P"),
           NAME  = list("Organ Procurement Organization" = "OPO"))
           # RANGE = list("001-099" = pad_three(1:99)),
           # ABBR = list("OPO" = "001-099"),


SUPPLIER = list(CODE  = list("ASC" = "C", "CLIA" = "D", "XRAY" = "X"),
                # RANGE = list("000001-9999999" = pad_seven(1:9999999)),
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
                  "D" = c("REHAB", "30"),
                  "E" = c("CHILD", "33"),
                  "F" = c("PSYCH", "40"),
                  "G" = c("PSYCH", "41"),
                  "H" = c("PSYCH", "42"),
                  "J" = c("PSYCH", "43"),
                  "K" = c("PSYCH", "44")))

supplier_abbr <- function(x) {
  cheapr::val_match(
    x,
    "C" ~ "ASC",
    "D" ~ "CLIA",
    "X" ~ "XRAY",
    .default = NA_character_
  )
}

supplier_desc <- function(x) {
  cheapr::val_match(
    x,
    "C" ~ "Ambulatory Surgical Center",
    "D" ~ "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory",
    "X" ~ "Portable X-Ray Facility",
    .default = NA_character_
  )
}
