#' @noRd
#' @autoglobal
MEDICAID_HOSPITAL_RANGES = list(
  # pad to THREE digits before use (001-099)
  "Short-term Acute Care Hospital"  = c(1L, 99L),
  "Children's Hospital"             = c(100L, 199L),
  "Children's Psychiatric Hospital" = c(200L, 299L),
  "Psychiatric Hospital"            = c(300L, 399L),
  "Rehabilitation Hospital"         = c(400L, 499L),
  "Long-term Hospital"              = c(500L, 599L)
)

#' @noRd
#' @autoglobal
FACILITY_RANGES = list(
  # pad to FOUR digits before use (0001-0879) / (0880-0899)
  "Short-term (General and Specialty) Hospital"                                                            = c(1L, 879L),
  "Hospital participating in ORD demonstration project"                                                    = c(880L, 899L),
  "Multiple Hospital Component in a Medical Complex (Number Retired)"                                      = c(900L, 999L),
  "Federally Qualified Health Center"                                                                      = list(c(1000L, 1199L), c(1800L, 1989L)),
  "Alcohol/Drug Hospital (Number Retired)"                                                                 = c(1200L, 1224L),
  "Medical Assistance Facility"                                                                            = c(1225L, 1299L),
  "Critical Access Hospital"                                                                               = c(1300L, 1399L),
  "Community Mental Health Center"                                                                         = list(c(1400L, 1499L), c(4600L, 4799L), c(4900L, 4999L)),
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
