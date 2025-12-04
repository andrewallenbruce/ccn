library(collapse)

#-----FACILITY AFFILIATIONS-----
aff <- readr::read_csv(
  file                                           = fs::path("C:/Users/Andrew/Downloads/Facility_Affiliation.csv"),
  num_threads                                    = 4L,
  col_types                                      = readr::cols(
    NPI                                          = readr::col_integer(),
    Ind_PAC_ID                                   = readr::col_character(),
    `Provider Last Name`                         = readr::col_character(),
    `Provider First Name`                        = readr::col_character(),
    `Provider Middle Name`                       = readr::col_character(),
    suff                                         = readr::col_character(),
    facility_type                                = readr::col_character(),
    `Facility Affiliations Certification Number` = readr::col_character(),
    `Facility Type Certification Number`         = readr::col_character())) |>
  janitor::clean_names() |>
  collapse::slt(
    facility_type,
    ccn_facility = facility_affiliations_certification_number,
    ccn_parent = facility_type_certification_number) |>
  collapse::funique()


aff <- list(
  fac = collapse::sbt(aff, is.na(ccn_parent), -ccn_parent) |>
    collapse::slt(ccn = ccn_facility, facility_type) |>
    collapse::roworder(ccn),
  sub = collapse::sbt(aff, !is.na(ccn_parent)) |>
    collapse::slt(ccn = ccn_facility, parent = ccn_parent, facility_type) |>
    collapse::roworder(ccn, parent)
)

pin_update(
  aff,
  name = "aff",
  title = "Facility Affiliations",
  description = "CCNs Facility Affiliation")

# SUBUNIT === 1,889 × 3
# Inpatient rehabilitation facility     738 --> T
# Nursing home                         1151 --> Z

# OVERALL === 37,241 × 2
# Nursing home                        12682
# Dialysis facility                    7248
# Home health agency                   6919
# Hospice                              5114
# Hospital                             4576
# Inpatient rehabilitation facility     396
# Long-term care hospital               306
