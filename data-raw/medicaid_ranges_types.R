## code to prepare `medicaid_ranges` dataset goes here

medicaid_ranges <- tibble::tibble(
  range = c("001-099", "100-199", "200-299", "300-399", "400-499", "500-599", "600-999"),
  abbr = c("ACUTE", "CHILD", "CPH", "PSYCH", "REHAB", "LTCH", "RESERVED"),
  desc = c(
    "Medicaid-Only Short-Term Acute Care Hospital",
    "Medicaid-Only Children's Hospital",
    "Medicaid-Only Children's Psychiatric Hospital",
    "Medicaid-Only Psychiatric Hospital",
    "Medicaid-Only Rehabilitation Hospital",
    "Medicaid-Only Long-Term Hospital",
    "Reserved for Future Use"
  )
)

medicaid_types <- tibble::tibble(
  code = c("A", "B", "E", "F", "G", "H", "J", "K", "L"),
  abbr = c("NF (SNF)", "NF (SNF)", "NF (ICF)", "NF (ICF)", "ICF-IID", "ICF-IID", "MCD HOSP", "MCD HHA", "PRTF"),
  desc = c(
    "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)",
    "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)",
    "Nursing Facility (Formerly Assigned to Intermediate Care Facility)",
    "Nursing Facility (Formerly Assigned to Intermediate Care Facility)",
    "Intermediate Care Facility for Individuals with Intellectual Disabilities",
    "Intermediate Care Facility for Individuals with Intellectual Disabilities",
    "Medicaid-Only Hospital",
    "Medicaid Home Health Agency",
    "Psychiatric Residential Treatment Facility"
  )
)

usethis::use_data(medicaid_types, overwrite = TRUE)

medicaid_data <- tibble::tribble(
  ~code,  ~range,      ~abbr,             ~desc,
  "A",    "001-999",   "NF (Fm SNF)",     "Nursing Facility (Formerly assigned to Medicaid Skilled Nursing Facility)",
  "B",    "001-999",   "NF (Fm SNF)",     "Nursing Facility (Formerly assigned to Medicaid Skilled Nursing Facility)",
  "E",    "001-999",   "NF (Fm ICF)",     "Nursing Facility (Formerly assigned to Intermediate Care Facility)",
  "F",    "001-999",   "NF (Fm ICF)",     "Nursing Facility (Formerly assigned to Intermediate Care Facility)",
  "G",    "001-999",   "ICF/IID",         "Intermediate Care Facility for Individuals with Intellectual Disabilities",
  "H",    "001-999",   "ICF/IID",         "Intermediate Care Facility for Individuals with Intellectual Disabilities",
  "J",    "001-099",   "MCD ACUTE",       "Medicaid-Only Short-Term Acute Care Hospital",
  "J",    "100-199",   "MCD CHILD",       "Medicaid-Only Children’s Hospital",
  "J",    "200-299",   "MCD CHILD PSYCH", "Medicaid-Only Children's Psychiatric Hospital",
  "J",    "300-399",   "MCD PSYCH",       "Medicaid-Only Psychiatric Hospital",
  "J",    "400-499",   "MCD REHAB",       "Medicaid-Only Rehabilitation Hospital",
  "J",    "500-599",   "MCD LTCH",        "Medicaid-Only Long-Term Hospital",
  "J",    "600-999",   "RESERVED",        "Reserved for Future Use",
  "K",    "001-999",   "MCD HHA",         "Medicaid Home Health Agency",
  "L",    "001-999",   "PRTF",            "Psychiatric Residential Treatment Facility",
)

usethis::use_data(medicaid_data, overwrite = TRUE)
