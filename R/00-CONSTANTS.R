EMERGENCY_HOSPITAL_CODE_LIST <- list(
  "Non-Federal Emergency Hospital" = "E",
  "Federal Emergency Hospital"     = "F"
)

SUPPLIER_CODE_LIST <- list(
  "Ambulatory Surgical Center"                                           = "C",
  "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory" = "D",
  "Portable X-Ray Facility"                                              = "X"
)

MEDICAID_FACILITY_CODE_LIST_ALL <- list(
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

STATE_CODE_LIST <- list(
  "Arizona"                                           = c("00", "03"),
  "Alabama"                                           = c("01"),
  "Alaska"                                            = c("02"),
  "Arkansas"                                          = c("04", "89"),
  "Colorado"                                          = c("06", "91"),
  "New Hampshire"                                     = c("30"),
  "New Jersey"                                        = c("31", "83"),
  "New Mexico"                                        = c("32", "96"),
  "New York"                                          = c("33", "57"),
  "California"                                        = c("05", "55", "75", "92", "A0", "A1", "B2"),
  "North Carolina"                                    = c("34", "86"),
  "North Dakota"                                      = c("35"),
  "Connecticut"                                       = c("07", "81"),
  "Ohio"                                              = c("36", "72", "A6"),
  "Delaware"                                          = c("08"),
  "Oklahoma"                                          = c("37", "90"),
  "District of Columbia"                              = c("09"),
  "Oregon"                                            = c("38", "93"),
  "Florida"                                           = c("10", "68", "69", "A2"),
  "Pennsylvania"                                      = c("39", "73", "A7"),
  "Georgia"                                           = c("11", "85"),
  "Puerto Rico"                                       = c("40", "84"),
  "Hawaii"                                            = c("12"),
  "Rhode Island"                                      = c("41"),
  "Idaho"                                             = c("13", "54"),
  "South Carolina"                                    = c("42", "87"),
  "Illinois"                                          = c("14", "78"),
  "South Dakota"                                      = c("43"),
  "Indiana"                                           = c("15"),
  "Tennessee"                                         = c("44", "88", "A8"),
  "Iowa"                                              = c("16", "76"),
  "Texas"                                             = c("45", "67", "74", "97", "A9"),
  "Kansas"                                            = c("17", "70"),
  "Utah"                                              = c("46"),
  "Kentucky"                                          = c("18", "B0"),
  "Vermont"                                           = c("47"),
  "Louisiana"                                         = c("19", "71", "95", "A3"),
  "Virgin Islands"                                    = c("48"),
  "Maine"                                             = c("20"),
  "Virginia"                                          = c("49"),
  "Maryland"                                          = c("21", "80"),
  "Washington"                                        = c("50", "94"),
  "Massachusetts"                                     = c("22", "82"),
  "West Virginia"                                     = c("51", "58", "B1"),
  "Michigan"                                          = c("23", "A4"),
  "Wisconsin"                                         = c("52"),
  "Minnesota"                                         = c("24", "77"),
  "Wyoming"                                           = c("53"),
  "Mississippi"                                       = c("25", "A5"),
  "Canada"                                            = c("56"),
  "Missouri"                                          = c("26", "79"),
  "Mexico"                                            = c("59"),
  "Montana"                                           = c("27"),
  "American Samoa"                                    = c("64"),
  "Nebraska"                                          = c("28"),
  "Guam"                                              = c("65"),
  "Nevada"                                            = c("29"),
  "Commonwealth of the Northern Marianas Islands"     = c("66"),
  "Foreign Countries (exceptions: Canada and Mexico)" = c("99")
)
