medicaid_only_facility_types <- tibble::tribble(
  ~code, ~abbr,     ~desc,
  "A",   "NF",      "Nursing Facility (Formerly Assigned to Medicaid SNF)",
  "B",   "NF",      "Nursing Facility (Formerly Assigned to Medicaid SNF)",
  "E",   "NF",      "Nursing Facility (Formerly Assigned to ICF)",
  "F",   "NF",      "Nursing Facility (Formerly Assigned to ICF)",
  "G",   "ICF-IID", "Intermediate Care Facility for Individuals with Intellectual Disabilities",
  "H",   "ICF-IID", "Intermediate Care Facility for Individuals with Intellectual Disabilities",
  # "J",   "MOH",     "Medicaid-Only Hospital",
  "K",   "MHHA",    "Medicaid Home Health Agency",
  "L",   "PRTF",    "Psychiatric Residential Treatment Facility",
)
#' CCN Medicaid-Only Facility Types
#'
#'    * Section __2779B__
#'    * Title: "CMS Certification Numbers for Medicaid Providers"
#'    * Pgs. 407-408
#'    * Rev. 123
#'    * Issued/Effective/Implementation: 10-03-14

usethis::use_data(medicaid_only_facility_types, overwrite = TRUE)


# All other Medicaid-only ranges are 001-999
medicaid_only_hospital_ranges <- tibble::tribble(
  ~range,    ~abbr,   ~desc,
  "001-099", "STACH", "Medicaid-Only Hospital (Short-Term Acute Care)",
  "100-199", "CH",    "Medicaid-Only Hospital (Children's)",
  "200-299", "CPH",   "Medicaid-Only Hospital (Children's Psychiatric)",
  "300-399", "PH",    "Medicaid-Only Hospital (Psychiatric)",
  "400-499", "REHAB", "Medicaid-Only Hospital (Rehabilitation)",
  "500-599", "LTCH",  "Medicaid-Only Hospital (Long-Term)",
  "600-999", "RSVD",  "Reserved for Future Use",
)

usethis::use_data(medicaid_only_hospital_ranges, overwrite = TRUE)
#' CCN Medicaid-Only Hospital Ranges
#'
#'    * Section: __2779B__
#'    * Title: "CMS Certification Numbers for Medicaid Providers"
#'    * Pgs. 407-408
#'    * Rev. 123
#'    * Iss./Eff./Impl. 10-03-14

# constructive::construct(state_codes, constructive::opts_tbl_df("tribble"))
