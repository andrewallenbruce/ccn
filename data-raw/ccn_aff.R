library(collapse)

#-----FACILITY AFFILIATIONS-----
affl <- readr::read_csv(
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
    `Facility Type Certification Number`         = readr::col_character()
  )
) |>
  janitor::clean_names() |>
  collapse::frename(
    ind_pac_id                                   = "pac",
    provider_last_name                           = "last",
    provider_first_name                          = "first",
    provider_middle_name                         = "middle",
    suff                                         = "suffix",
    facility_affiliations_certification_number   = "ccn_facility",
    facility_type_certification_number           = "ccn_parent"
  )

aff_slt <- function(x) {
  x |> collapse::slt(
    facility_type,
    ccn_parent,
    ccn_facility,
    npi,
    pac)
}

# create row identifiers
affl <- collapse::mtt(affl, i = seq_len(nrow(affl)))

sub_vec <- collapse::fcount(affl, ccn_parent) |>
  collapse::sbt(!cheapr::is_na(ccn_parent)) |>
  _$ccn_parent

subs <- collapse::sbt(affl, ccn_parent %iin% sub_vec)
subi <- subs$i
subs <- aff_slt(subs)

affl <- aff_slt(collapse::sbt(affl, i %!iin% subi))
affl <- affl[, !cheapr::col_all_na(affl)]

affl <- list(parent = affl, subunit = subs)

pin_update(
  affl,
  name = "fac_aff",
  title = "Facility Affiliations",
  description = "CCNs Facility Affiliation")

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
