#' @noRd
#' @autoglobal
MEDICAID <- list(
  FACILITY_CODES = list(
    c("A", "B"), "NF (Formerly assigned to Medicaid SNF)",
    c("E", "F"), "NF (Formerly assigned to ICF)",
    c("G", "H"), "ICF/IID",
    c("J"), "Medicaid-Only Hospital",
    c("K"), "Medicaid HHA",
    c("L"), "Psychiatric Residential Treatment Facility (PRTF)",
    c("M"), "Psychiatric Unit of a CAH",
    c("O"), "Organ Procurement Organization (OPO)",
    c("R"), "Rehabilitation Unit of a CAH",
    c("S"), "Psychiatric Unit",
    c("T"), "Rehabilitation Unit",
    c("U"), "Swing-Bed Approval for Short-Term Hospital",
    c("W"), "Swing-Bed Approval for Long-Term Care Hospital",
    c("Y"), "Swing-Bed Approval for Rehabilitation Hospital",
    c("Z"), "Swing-Bed Approval for CAH"),

  # should be padded to three digits before use (001-099, etc.)
  HOSPITAL_RANGES = list(
    "Short-term Acute Care Hospital" = collapse::frange(c(1L, 99L)),
    ivs::iv(start = 100L, end = 199L), "Children's Hospital",
    ivs::iv(start = 200L, end = 299L), "Children's Psychiatric Hospital",
    ivs::iv(start = 300L, end = 399L), "Psychiatric Hospital",
    ivs::iv(start = 400L, end = 499L), "Rehabilitation Hospital",
    ivs::iv(start = 500L, end = 599L), "Long-term Hospital"),

  # from FACILITY_CODES above
  TYPE_CODES = c("A", "B", "E", "F", "G", "H", "J", "K", "L")
)

#' @noRd
#' @autoglobal
FACILITY_RANGES = list(
  ivs::iv(start = as.integer(0001), end = as.integer(0879)), "Short-term (General and Specialty) Hospital",
  0880:0899, "Hospital participating in ORD demonstration project",
  0900:0999, "Multiple Hospital Component in a Medical Complex (Number Retired)",
  1000:1199, "Federally Qualified Health Center",
  1200:1224, "Alcohol/Drug Hospital (Number Retired)",
  1225:1299, "Medical Assistance Facility",
  1300:1399, "Critical Access Hospital",
  1400:1499, "Community Mental Health Center",
  1500:1799, "Hospice",
  1800:1989, "Federally Qualified Health Center",
  1990:1999, "Religious Non-medical Health Care Institution (formerly Christian Science Sanatoria Hospital Services)",
  2000:2299, "Long-Term Care Hospital",
  2300:2499, "Hospital-based Renal Dialysis Facility",
  2500:2899, "Independent Renal Dialysis Facility",
  2900:2999, "Independent Special Purpose Renal Dialysis Facility",
  3000:3024, "Tuberculosis Hospital (Number Retired)",
  3025:3099, "Rehabilitation Hospital",
  3100:3199, "Home Health Agency",
  3200:3299, "Comprehensive Outpatient Rehabilitation Facility",
  3300:3399, "Children's Hospital",
  3400:3499, "Rural Health Clinic (Provider-based)",
  3500:3699, "Hospital-based Satellite Renal Dialysis Facility",
  3700:3799, "Hospital-based Special Purpose Renal Dialysis Facility",
  3800:3974, "Rural Health Clinic (Free-standing)",
  3975:3999, "Rural Health Clinic (Provider-based)",
  4000:4499, "Psychiatric Hospital",
  4500:4599, "Comprehensive Outpatient Rehabilitation Facility",
  4600:4799, "Community Mental Health Center",
  4800:4899, "Comprehensive Outpatient Rehabilitation Facility",
  4900:4999, "Community Mental Health Center",
  5000:6499, "Skilled Nursing Facility",
  6500:6989, "Outpatient Physical Therapy Services",
  6990:6999, "Number Reserved (formerly Christian Science Sanatoria Skilled Nursing Services)",
  7000:8499, "Home Health Agency",
  8500:8899, "Rural Health Clinic (Provider-based)",
  8900:8999, "Rural Health Clinic (Free-standing)",
  9000:9799, "Home Health Agency",
  9800:9899, "Transplant Center",
  9900:9999, "Reserved for Future Use"
)

#' @noRd
#' @autoglobal
IPPS <- list(

  EXCLUDED_TYPE_CODES = c("M", "R", "S", "T", "U", "W", "Z"),

  PARENT_HOSPITAL_TYPES = list(
    "A", c("LTCH", "20"),
    "B", c("LTCH", "21"),
    "C", c("LTCH", "22"),
    "D", c("Rehabilitation Hospital", "30"),
    "E", c("Children's Hospital", "33"),
    "F", c("Psychiatric Hospital", "40"),
    "G", c("Psychiatric Hospital", "41"),
    "H", c("Psychiatric Hospital", "42"),
    "J", c("Psychiatric Hospital", "43"),
    "K", c("Psychiatric Hospital", "44"))
)
