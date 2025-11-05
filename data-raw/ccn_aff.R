library(collapse)
library(clitable)

#-----FACILITY AFFILIATIONS-----
affl <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/Facility_Affiliation.csv"),
  col_types = readr::cols(
    NPI = readr::col_integer(),
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
affl <- collapse::sbt(affl, ccn_facility_type %iin% subs) |> collapse::slt(i, facility_type, ccn_facility_type, ccn_facility, npi, pac)

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


clitable::cli_table(
  head(affl, 10),
  header_style = "gray",
  border_style = "single",
  NA_style = "red") |>
  cat(sep = "\n")
