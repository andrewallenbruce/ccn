library(collapse)

#-----National Downloadable File-----
ndf <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/DAC_NationalDownloadableFile.csv"),
  num_threads = 4L,
  col_types = readr::cols(
    NPI                    = readr::col_integer(),
    Ind_PAC_ID             = readr::col_character(),
    Ind_enrl_ID            = readr::col_character(),
    `Provider Last Name`   = readr::col_character(),
    `Provider First Name`  = readr::col_character(),
    `Provider Middle Name` = readr::col_character(),
    suff                   = readr::col_character(),
    gndr                   = readr::col_character(),
    Cred                   = readr::col_character(),
    Med_sch                = readr::col_character(),
    Grd_yr                 = readr::col_integer(),
    pri_spec               = readr::col_character(),
    sec_spec_1             = readr::col_character(),
    sec_spec_2             = readr::col_character(),
    sec_spec_3             = readr::col_character(),
    sec_spec_4             = readr::col_character(),
    sec_spec_all           = readr::col_character(),
    Telehlth               = readr::col_character(),
    `Facility Name`        = readr::col_character(),
    org_pac_id             = readr::col_character(),
    num_org_mem            = readr::col_integer(),
    adr_ln_1               = readr::col_character(),
    adr_ln_2               = readr::col_character(),
    ln_2_sprs              = readr::col_character(),
    `City/Town`            = readr::col_character(),
    State                  = readr::col_character(),
    `ZIP Code`             = readr::col_character(),
    `Telephone Number`     = readr::col_character(),
    ind_assgn              = readr::col_character(),
    grp_assgn              = readr::col_character(),
    adrs_id                = readr::col_character()
  )
)

# pin_update(
#   hosp,
#   name = "hospital_enrollment",
#   title = "Hospital Enrollments",
#   description = "Hospital Enrollments 2025")
