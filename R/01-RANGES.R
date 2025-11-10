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
  "001-099" = pad_three(1:99),
  "100-199" = as_sf(100:199),
  "200-299" = as_sf(200:299),
  "300-399" = as_sf(300:399),
  "400-499" = as_sf(400:499),
  "500-599" = as_sf(500:599))


MEDICAID_HOSPITAL_RANGES_NAMES_LONG = list(
  "Short-term Acute Care Hospital"  = "001-099",
  "Children's Hospital"             = "100-199",
  "Children's Psychiatric Hospital" = "200-299",
  "Psychiatric Hospital"            = "300-399",
  "Rehabilitation Hospital"         = "400-499",
  "Long-term Hospital"              = "500-599")

FACILITY_RANGES = list(
  "0001-0879" = pad_four(1:879),
  "0880-0899" = pad_four(880:899),
  "0900-0999" = pad_four(900:999),
  "1000-1199" = as_sf(1000:1199),
  "1800-1989" = as_sf(1800:1989),
  "1200-1224" = as_sf(1200:1224),
  "1225-1299" = as_sf(1225:1299),
  "1300-1399" = as_sf(1300:1399),
  "1400-1499" = as_sf(1400:1499),
  "4600-4799" = as_sf(4600:4799),
  "4900-4999" = as_sf(4900:4999),
  "1500-1799" = as_sf(1500:1799),
  "1990-1999" = as_sf(1990:1999),
  "2000-2299" = as_sf(2000:2299),
  "2000-2299" = as_sf(2300:2499), # HERE
  "2000-2299" = as_sf(2500:2899),
  "2000-2299" = as_sf(2900:2999),
  "2000-2299" = as_sf(3000:3024),
  "2000-2299" = as_sf(3025:3099),
  "2000-2299" = as_sf(3300:3399),
  "2000-2299" = as_sf(3500:3699),
  "2000-2299" = as_sf(3700:3799),
  "2000-2299" = as_sf(4000:4499),
  "2000-2299" = as_sf(3200:3299),
  "2000-2299" = as_sf(4500:4599),
  "2000-2299" = as_sf(4800:4899),
  "2000-2299" = as_sf(5000:6499),
  "2000-2299" = as_sf(6500:6989),
  "2000-2299" = as_sf(6990:6999),
  "2000-2299" = as_sf(3400:3499),
  "2000-2299" = as_sf(3975:3999),
  "2000-2299" = as_sf(8500:8899),
  "2000-2299" = as_sf(3800:3974),
  "2000-2299" = as_sf(8900:8999),
  "2000-2299" = as_sf(3100:3199),
  "2000-2299" = as_sf(7000:8499),
  "2000-2299" = as_sf(9000:9799),
  "2000-2299" = as_sf(9800:9899),
  "2000-2299" = as_sf(9900:9999)
)

FACILITY_RANGES_NAMES_LONG = list(
  "Short-term (General and Specialty) Hospital" = pad_four(1:879),
  "Hospital participating in ORD demonstration project" = pad_four(880:899),
  "Multiple Hospital Component in a Medical Complex (Number Retired)" = pad_four(900:999),
  "Federally Qualified Health Center" = as_sf(1000:1199),
  "Federally Qualified Health Center" = as_sf(1800:1989),
  "Alcohol/Drug Hospital (Number Retired)" = as_sf(1200:1224),
  "Medical Assistance Facility" = as_sf(1225:1299),
  "Critical Access Hospital" = as_sf(1300:1399),
  "Community Mental Health Center" = as_sf(1400:1499),
  "Community Mental Health Center" = as_sf(4600:4799),
  "Community Mental Health Center" = as_sf(4900:4999),
  "Hospice" = as_sf(1500:1799),
  "Religious Non-medical Health Care Institution (formerly Christian Science Sanatoria Hospital Services)" = as_sf(1990:1999),
  "Long-Term Care Hospital" = as_sf(2000:2299),
  "Hospital-based Renal Dialysis Facility" = as_sf(2300:2499),
  "Independent Renal Dialysis Facility" = as_sf(2500:2899),
  "Independent Special Purpose Renal Dialysis Facility" = as_sf(2900:2999),
  "Tuberculosis Hospital (Number Retired)" = as_sf(3000:3024),
  "Rehabilitation Hospital" = as_sf(3025:3099),
  "Children's Hospital" = as_sf(3300:3399),
  "Hospital-based Satellite Renal Dialysis Facility" = as_sf(3500:3699),
  "Hospital-based Special Purpose Renal Dialysis Facility" = as_sf(3700:3799),
  "Psychiatric Hospital" = as_sf(4000:4499),
  "Comprehensive Outpatient Rehabilitation Facility" = as_sf(3200:3299),
  "Comprehensive Outpatient Rehabilitation Facility" = as_sf(4500:4599),
  "Comprehensive Outpatient Rehabilitation Facility" = as_sf(4800:4899),
  "Skilled Nursing Facility" = as_sf(5000:6499),
  "Outpatient Physical Therapy Services" = as_sf(6500:6989),
  "Number Reserved (formerly Christian Science Sanatoria Skilled Nursing Services)" = as_sf(6990:6999),
  "Rural Health Clinic (Provider-based)" = as_sf(3400:3499),
  "Rural Health Clinic (Provider-based)" = as_sf(3975:3999),
  "Rural Health Clinic (Provider-based)" = as_sf(8500:8899),
  "Rural Health Clinic (Free-standing)" = as_sf(3800:3974),
  "Rural Health Clinic (Free-standing)" = as_sf(8900:8999),
  "Home Health Agency" = as_sf(3100:3199),
  "Home Health Agency" = as_sf(7000:8499),
  "Home Health Agency" = as_sf(9000:9799),
  "Transplant Center" = as_sf(9800:9899),
  "Reserved for Future Use" = as_sf(9900:9999))
