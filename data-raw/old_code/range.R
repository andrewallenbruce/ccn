`%inrange%` <- data.table::`%inrange%`()
`%between%` <- data.table::`%between%`

x = 1234L
x %between% c(1000L, 1199L) | x %between% c(1800L, 1989L)

MEDICAID_HOSPITAL_RANGES = list(
  # pad to THREE digits before use (001-099)
  # c(1L - 1L, 99L) + 100
  "Short-term Acute Care Hospital"  = c(1L, 99L),
  "Children's Hospital"             = c(100L, 199L),
  "Children's Psychiatric Hospital" = c(200L, 299L),
  "Psychiatric Hospital"            = c(300L, 399L),
  "Rehabilitation Hospital"         = c(400L, 499L),
  "Long-term Hospital"              = c(500L, 599L)
)

range <- data.table::data.table(
  start = c(1L, 100L, 200L, 300L, 400L, 500L),
  end = c(99L, 199L, 299L, 399L, 499L, 599L))

names(MEDICAID_HOSPITAL_RANGES)[cheapr::which_(data.table::between(123L, range$start, range$end))]

data.table::between(123L, range$start, range$end)


data.table::inrange(123:125, medicare_ranges$start, medicare_ranges$end)

medicare_ranges$range[data.table::between("123", medicare_ranges$start, medicare_ranges$end)]

#' @rdname medicare
#' @export
range_medicare_desc <- function(x) {
  cheapr::case(
    x == "0001-0879"                                 ~ "Short-Term Hospital (General & Specialty)",
    x == "0880-0899"                                 ~ "Hospital Participating in ORD Demonstration Project",
    x == "0900-0999"                                 ~ "Multiple Hospital Component in a Medical Complex (Retired)",
    x == "1200-1224"                                 ~ "Alcohol-Drug Hospital (Retired)",
    x == "1225-1299"                                 ~ "Medical Assistance Facility",
    x == "1300-1399"                                 ~ "Critical Access Hospital",
    x == "1500-1799"                                 ~ "Hospice",
    x == "1990-1999"                                 ~ "Religious Non-medical Health Care Institution",
    x == "2000-2299"                                 ~ "Long-Term Care Hospital (Excluded from IPPS)",
    x == "2300-2499"                                 ~ "Hospital-based Renal Dialysis Facility",
    x == "2500-2899"                                 ~ "Independent Renal Dialysis Facility",
    x == "2900-2999"                                 ~ "Independent Special Purpose Renal Dialysis Facility",
    x == "3000-3024"                                 ~ "Tuberculosis Hospital (Retired)",
    x == "3025-3099"                                 ~ "Rehabilitation Hospital (Excluded from IPPS)",
    x == "3300-3399"                                 ~ "Children's Hospital (Excluded from IPPS)",
    x == "3500-3699"                                 ~ "Hospital-based Satellite Renal Dialysis Facility",
    x == "3700-3799"                                 ~ "Hospital-based Special Purpose Renal Dialysis Facility",
    x == "4000-4499"                                 ~ "Psychiatric Hospital (Excluded from IPPS)",
    x == "5000-6499"                                 ~ "Skilled Nursing Facility",
    x == "6500-6989"                                 ~ "Outpatient Physical Therapy Services",
    x == "6990-6999"                                 ~ "Number Reserved",
    x == "9800-9899"                                 ~ "Transplant Center",
    x == "9900-9999"                                 ~ "Freestanding Opioid Treatment Program",
    x %in_% c("1000-1199", "1800-1989")              ~ "Federally Qualified Health Center",
    x %in_% c("3800-3974", "8900-8999")              ~ "Rural Health Clinic (Free-standing)",
    x %in_% c("3400-3499", "3975-3999", "8500-8899") ~ "Rural Health Clinic (Provider-based)",
    x %in_% c("1400-1499", "4600-4799", "4900-4999") ~ "Community Mental Health Center",
    x %in_% c("3100-3199", "7000-8499", "9000-9799") ~ "Home Health Agency",
    x %in_% c("3200-3299", "4500-4599", "4800-4899") ~ "Comprehensive Outpatient Rehabilitation Facility",
    .default = NA_character_
  )
}

#' @rdname medicare
#' @export
range_medicare_abbr <- function(x) {
  cheapr::case(
    x == "0001-0879"                                 ~ "ACUTE",
    x == "0880-0899"                                 ~ "ORD",
    x == "0900-0999"                                 ~ "MHCMC (RET)",
    x == "1200-1224"                                 ~ "ADH (RET)",
    x == "1225-1299"                                 ~ "MAF",
    x == "1300-1399"                                 ~ "CAH",
    x == "1500-1799"                                 ~ "HOSPICE",
    x == "1990-1999"                                 ~ "RNHCI",
    x == "2000-2299"                                 ~ "LTCH",
    x == "2300-2499"                                 ~ "RDF-H",
    x == "2500-2899"                                 ~ "RDF-I",
    x == "2900-2999"                                 ~ "RDF-I (SP)",
    x == "3000-3024"                                 ~ "TUBER (RET)",
    x == "3025-3099"                                 ~ "REHAB",
    x == "3300-3399"                                 ~ "CHILD",
    x == "3500-3699"                                 ~ "RDF-H (SAT)",
    x == "3700-3799"                                 ~ "RDF-H (SP)",
    x == "4000-4499"                                 ~ "PSYCH",
    x == "5000-6499"                                 ~ "SNF",
    x == "6500-6989"                                 ~ "OPT",
    x == "6990-6999"                                 ~ "RESERVED",
    x == "9800-9899"                                 ~ "TRANSPLANT",
    x == "9900-9999"                                 ~ "OPIOID (FREE)",
    x %in_% c("1000-1199", "1800-1989")              ~ "FQHC",
    x %in_% c("3800-3974", "8900-8999")              ~ "RHC (FREE)",
    x %in_% c("3400-3499", "3975-3999", "8500-8899") ~ "RHC (PROV)",
    x %in_% c("1400-1499", "4600-4799", "4900-4999") ~ "CMHC",
    x %in_% c("3100-3199", "7000-8499", "9000-9799") ~ "HHA",
    x %in_% c("3200-3299", "4500-4599", "4800-4899") ~ "CORF",
    .default = NA_character_
  )
}

medicare_range <- function(x) {
  x <- as_int(x)
  kit::nif(
    x >=    1L & x <= 879L,  "0001-0879",
    x >=  880L & x <= 899L,  "0880-0899",
    x >=  900L & x <= 999L,  "0900-0999",
    x >= 1000L & x <= 1199L, "1000-1199",
    x >= 1200L & x <= 1224L, "1200-1224",
    x >= 1225L & x <= 1299L, "1225-1299",
    x >= 1300L & x <= 1399L, "1300-1399",
    x >= 1400L & x <= 1499L, "1400-1499",
    x >= 1500L & x <= 1799L, "1500-1799",
    x >= 1800L & x <= 1989L, "1800-1989",
    x >= 1990L & x <= 1999L, "1990-1999",
    x >= 2000L & x <= 2299L, "2000-2299",
    x >= 2300L & x <= 2499L, "2300-2499",
    x >= 2500L & x <= 2899L, "2500-2899",
    x >= 2900L & x <= 2999L, "2900-2999",
    x >= 3000L & x <= 3024L, "3000-3024",
    x >= 3025L & x <= 3099L, "3025-3099",
    x >= 3100L & x <= 3199L, "3100-3199",
    x >= 3200L & x <= 3299L, "3200-3299",
    x >= 3300L & x <= 3399L, "3300-3399",
    x >= 3400L & x <= 3499L, "3400-3499",
    x >= 3500L & x <= 3699L, "3500-3699",
    x >= 3700L & x <= 3799L, "3700-3799",
    x >= 3800L & x <= 3974L, "3800-3974",
    x >= 3975L & x <= 3999L, "3975-3999",
    x >= 4000L & x <= 4499L, "4000-4499",
    x >= 4500L & x <= 4599L, "4500-4599",
    x >= 4600L & x <= 4799L, "4600-4799",
    x >= 4800L & x <= 4899L, "4800-4899",
    x >= 4900L & x <= 4999L, "4900-4999",
    x >= 5000L & x <= 6499L, "5000-6499",
    x >= 6500L & x <= 6989L, "6500-6989",
    x >= 6990L & x <= 6999L, "6990-6999",
    x >= 7000L & x <= 8499L, "7000-8499",
    x >= 8500L & x <= 8899L, "8500-8899",
    x >= 8900L & x <= 8999L, "8900-8999",
    x >= 9000L & x <= 9799L, "9000-9799",
    x >= 9800L & x <= 9899L, "9800-9899",
    x >= 9900L & x <= 9999L, "9900-9999",
    default = NA_character_
  )
}
