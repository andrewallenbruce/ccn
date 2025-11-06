library(collapse)

#-----FACILITY AFFILIATIONS-----
affl <- readr::read_csv(
  file      = fs::path("C:/Users/Andrew/Downloads/Facility_Affiliation.csv"),
  col_types = readr::cols(
    NPI     = readr::col_integer(),
    Ind_PAC_ID = readr::col_character(),
    `Provider Last Name` = readr::col_character(),
    `Provider First Name` = readr::col_character(),
    `Provider Middle Name` = readr::col_character(),
    suff = readr::col_character(),
    facility_type = readr::col_character(),
    `Facility Affiliations Certification Number` = readr::col_character(),
    `Facility Type Certification Number` = readr::col_character()),
  num_threads = 4L) |>
  janitor::clean_names() |>
  collapse::frename(
    ind_pac_id = "pac",
    provider_last_name = "last",
    provider_first_name = "first",
    provider_middle_name = "middle",
    suff = "suffix",
    facility_affiliations_certification_number = "ccn_facility",
    facility_type_certification_number = "ccn_facility_type")

affl <- collapse::mtt(affl, i = seq_len(nrow(affl)))
subs <- collapse::fcount(affl, ccn_facility_type) |> collapse::sbt(!cheapr::is_na(ccn_facility_type)) |> _$ccn_facility_type
subs <- collapse::sbt(affl, ccn_facility_type %iin% subs)
subi <- subs$i
subs <- collapse::slt(subs, facility_type, ccn_facility_type, ccn_facility, npi, pac)
affl <- collapse::sbt(affl, i %!iin% subi) |> collapse::slt(facility_type, ccn_facility_type, ccn_facility, npi, pac)
subs <- collapse::slt(subs, facility_type, ccn_facility_type, ccn_facility, npi, pac)
affl <- affl[, !cheapr::col_all_na(affl)] |> collapse::slt(facility_type, ccn_facility, npi, pac)

pin_update(
  subs,
  name = "ccn_subunits",
  title = "Subunit CCNs",
  description = "Subunit CCNs Facility Affiliation")

pin_update(
  affl,
  name = "ccn_parents",
  title = "Parent CCNs",
  description = "Parent CCNs Facility Affiliation")

#-----SUBUNITS
# facility_type                         N
# Inpatient rehabilitation facility  2702 --> T
# Nursing home                       2638 --> Z

#-----OVERALL
# facility_type                           N
# Hospital                          1423652
# Home health agency                 107527
# Nursing home                        31362
# Hospice                             25834
# Dialysis facility                   18242
# Inpatient rehabilitation facility   11731
# Long-term care hospital              3762
