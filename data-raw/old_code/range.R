library(vctrs)
"Federally Qualified Health Center" = list(c(1000L, 1199L), c(1800L, 1989L)),
"Alcohol/Drug Hospital (Number Retired)" = c(1200L, 1224L),
"Medical Assistance Facility" = c(1225L, 1299L),
"Critical Access Hospital" = c(1300L, 1399L)

args   <- list(x = 1234L, left = 1000L, right = 1199L)
args   <- vec_cast_common(!!!args)
x      <- args$x
args$x <- NULL
args   <- vec_recycle_common(!!!args, .size = vec_size(x))

left   <- args$left
right  <- args$right

left   <- vec_compare(x, left + 1000)
left   <- left >= 0L

right  <- vec_compare(x, right)
right  <- right <= 0L

left & right


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

names(MEDICAID_HOSPITAL_RANGES)[data.table::between(123L, range$start, range$end)]



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
