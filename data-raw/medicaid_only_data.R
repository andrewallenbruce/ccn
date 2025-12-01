#' CCN Medicaid-Only Facility Types
#'
#'    * Section __2779B__
#'    * Title: "CMS Certification Numbers for Medicaid Providers"
#'    * Pgs. 407-408
#'    * Rev. 123
#'    * Issued/Effective/Implementation: 10-03-14
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
  "L",   "PRTF",    "Psychiatric Residential Treatment Facility")
usethis::use_data(medicaid_only_facility_types, overwrite = TRUE)

#' CCN Medicaid-Only Hospital Ranges
#'
#'    * Section: __2779B__
#'    * Title: "CMS Certification Numbers for Medicaid Providers"
#'    * Pgs. 407-408
#'    * Rev. 123
#'    * Iss./Eff./Impl. 10-03-14
medicaid_only_hospital_ranges <- tibble::tribble(
  ~range,    ~abbr,   ~desc,
  "001-099", "STACH", "Short-Term Acute Care",
  "100-199", "CH",    "Children's",
  "200-299", "CPH",   "Children's Psychiatric",
  "300-399", "PH",    "Psychiatric",
  "400-499", "REHAB", "Rehabilitation",
  "500-599", "LTCH",  "Long-Term",
  "600-999", "RSVD",  "Reserved for Future Use")

# All other Medicaid-only ranges are 001-999
usethis::use_data(medicaid_only_hospital_ranges, overwrite = TRUE)

# constructive::construct(state_codes, constructive::opts_tbl_df("tribble"))
