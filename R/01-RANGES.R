as_sf <- function(x) {
  stringfish::sf_convert(as.character(x))
}

pad_three <- function(x) {
  x         <- as.character(x)
  n         <- nchar(x)

  x[n == 1] <- paste0("00", x[n == 1])
  x[n == 2] <- paste0("0",  x[n == 2])

  stringfish::sf_convert(x)
}

pad_four <- function(x) {
  x         <- as.character(x)
  n         <- nchar(x)

  x[n == 1] <- paste0("000", x[n == 1])
  x[n == 2] <- paste0("00",  x[n == 2])
  x[n == 3] <- paste0("0",   x[n == 3])

  stringfish::sf_convert(x)
}

MEDICAID_HOSPITAL_RANGES = list(
  "Short-term Acute Care Hospital"  = pad_three(1:99),
  "Children's Hospital"             = as_sf(100:199),
  "Children's Psychiatric Hospital" = as_sf(200:299),
  "Psychiatric Hospital"            = as_sf(300:399),
  "Rehabilitation Hospital"         = as_sf(400:499),
  "Long-term Hospital"              = as_sf(500:599)
)

FACILITY_RANGES = list(
  "Short-term (General and Specialty) Hospital"                                                            = pad_four(1:879),
  "Hospital participating in ORD demonstration project"                                                    = pad_four(880:899),
  "Multiple Hospital Component in a Medical Complex (Number Retired)"                                      = pad_four(900:999),
  "Federally Qualified Health Center"                                                                      = as_sf(1000:1199),
  "Federally Qualified Health Center"                                                                      = as_sf(1800:1989),
  "Alcohol/Drug Hospital (Number Retired)"                                                                 = as_sf(1200:1224),
  "Medical Assistance Facility"                                                                            = as_sf(1225:1299),
  "Critical Access Hospital"                                                                               = as_sf(1300:1399),
  "Community Mental Health Center"                                                                         = as_sf(1400:1499),
  "Community Mental Health Center"                                                                         = as_sf(4600:4799),
  "Community Mental Health Center"                                                                         = as_sf(4900:4999),
  "Hospice"                                                                                                = c(1500L, 1799L),
  "Religious Non-medical Health Care Institution (formerly Christian Science Sanatoria Hospital Services)" = c(1990L, 1999L),
  "Long-Term Care Hospital"                                                                                = c(2000L, 2299L),
  "Hospital-based Renal Dialysis Facility"                                                                 = c(2300L, 2499L),
  "Independent Renal Dialysis Facility"                                                                    = c(2500L, 2899L),
  "Independent Special Purpose Renal Dialysis Facility"                                                    = c(2900L, 2999L),
  "Tuberculosis Hospital (Number Retired)"                                                                 = c(3000L, 3024L),
  "Rehabilitation Hospital"                                                                                = c(3025L, 3099L),
  "Comprehensive Outpatient Rehabilitation Facility"                                                       = c(3200L, 3299L),
  "Children's Hospital"                                                                                    = c(3300L, 3399L),
  "Hospital-based Satellite Renal Dialysis Facility"                                                       = c(3500L, 3699L),
  "Hospital-based Special Purpose Renal Dialysis Facility"                                                 = c(3700L, 3799L),
  "Psychiatric Hospital"                                                                                   = c(4000L, 4499L),
  "Comprehensive Outpatient Rehabilitation Facility"                                                       = list(c(4500L, 4599L), c(4800L, 4899L)),
  "Skilled Nursing Facility"                                                                               = c(5000L, 6499L),
  "Outpatient Physical Therapy Services"                                                                   = c(6500L, 6989L),
  "Number Reserved (formerly Christian Science Sanatoria Skilled Nursing Services)"                        = c(6990L, 6999L),
  "Rural Health Clinic (Provider-based)"                                                                   = list(c(3400L, 3499L), c(3975L, 3999L), c(8500L, 8899L)),
  "Rural Health Clinic (Free-standing)"                                                                    = list(c(3800L, 3974L), c(8900L, 8999L)),
  "Home Health Agency"                                                                                     = list(c(3100L, 3199L), c(7000L, 8499L), c(9000L, 9799L)),
  "Transplant Center"                                                                                      = c(9800L, 9899L),
  "Reserved for Future Use"                                                                                = c(9900L, 9999L)
)
