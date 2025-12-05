medicaid_types <- tibble::tribble(
  ~code, ~abbr,     ~desc,
  "A",   "NF",      "Nursing Facility (Formerly Assigned to Medicaid SNF)",
  "B",   "NF",      "Nursing Facility (Formerly Assigned to Medicaid SNF)",
  "E",   "NF",      "Nursing Facility (Formerly Assigned to ICF)",
  "F",   "NF",      "Nursing Facility (Formerly Assigned to ICF)",
  "G",   "ICF-IID", "Intermediate Care Facility for Individuals with Intellectual Disabilities",
  "H",   "ICF-IID", "Intermediate Care Facility for Individuals with Intellectual Disabilities",
  "J",   "MOH",     "Medicaid-Only Hospital",
  "K",   "HHA",     "Medicaid Home Health Agency",
  "L",   "PRTF",    "Psychiatric Residential Treatment Facility")
usethis::use_data(medicaid_types, overwrite = TRUE)

medicaid_ranges <- tibble::tribble(
  ~start,  ~end,    ~range,    ~abbr,    ~desc,
      1L,   99L, "001-099",    "STC",    "Short-Term Acute Care Hospital",
    100L,  199L, "100-199",    "CH",     "Children's Hospital",
    200L,  299L, "200-299",    "CP",     "Children's Psychiatric Hospital",
    300L,  399L, "300-399",    "PH",     "Psychiatric Hospital",
    400L,  499L, "400-499",    "IRF",    "Rehabilitation Hospital",
    500L,  599L, "500-599",    "LTC",    "Long-Term Hospital",
    600L,  999L, "600-999",    "RSVD",   "Reserved for Future Use")
usethis::use_data(medicaid_ranges, overwrite = TRUE)

# All other Medicaid-only ranges are 001-999
# constructive::construct(state_codes, constructive::opts_tbl_df("tribble"))
