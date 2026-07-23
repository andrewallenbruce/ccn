medicaid_types <- tibble::tribble(
  ~code , ~abbr     , ~desc                                                                       ,
  "A"   , "SNF-NF"  , "Skilled Nursing Facility"                                                  , #  (Formerly Assigned to Medicaid SNF)
  "B"   , "SNF-NF"  , "Skilled Nursing Facility"                                                  , #  (Formerly Assigned to Medicaid SNF)
  "E"   , "SNF-NF"  , "Skilled Nursing Facility"                                                  , #  (Formerly Assigned to ICF)
  "F"   , "SNF-NF"  , "Skilled Nursing Facility"                                                  , #  (Formerly Assigned to ICF)
  "G"   , "ICF-IID" , "Intermediate Care Facility for Individuals with Intellectual Disabilities" ,
  "H"   , "ICF-IID" , "Intermediate Care Facility for Individuals with Intellectual Disabilities" ,
  "J"   , "MOH"     , "Medicaid-Only Hospital"                                                    ,
  "K"   , "HHA"     , "Home Health Agency"                                                        ,
  "L"   , "PRTF"    , "Psychiatric Residential Treatment Facility"
)
usethis::use_data(medicaid_types, overwrite = TRUE)

medicaid_ranges <- tibble::tribble(
  ~start , ~end , ~range    , ~abbr         , ~desc                             ,
    1L   ,  99L , "001-099" , "Acute"       , "Short-Term Acute Care Hospital"  ,
  100L   , 199L , "100-199" , "Child"       , "Children's Hospital"             ,
  200L   , 299L , "200-299" , "Child-Psych" , "Children's Psychiatric Hospital" ,
  300L   , 399L , "300-399" , "Psych"       , "Psychiatric Hospital"            ,
  400L   , 499L , "400-499" , "IRF"         , "Rehabilitation Hospital"         ,
  500L   , 599L , "500-599" , "LTCH"        , "Long-Term Hospital"              ,
  600L   , 999L , "600-999" , "Reserved"    , "Reserved for Future Use"
)

medicaid_ranges$iv <- ivs::iv(medicaid_ranges$start, medicaid_ranges$end + 1L)
medicaid_ranges

usethis::use_data(medicaid_ranges, overwrite = TRUE)

# All other Medicaid-only ranges are 001-999
# constructive::construct(state_codes, constructive::opts_tbl_df("tribble"))
