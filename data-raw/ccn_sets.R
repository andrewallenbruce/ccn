ccn_dataset_info <- providertwo:::field_table() |>
  collapse::sbt(
    catalog != "open" &
      point != "temporal" &
      stringr::str_detect(field, "ccn|CCN|Ccn|certification_number") &
      stringr::str_detect(alias, "_chow$", negate = TRUE)
  ) |>
  collapse::funique(cols = "alias") |>
  collapse::roworder(catalog, point, alias) |>
  collapse::slt(catalog, alias, title)


ccn_dataset_info |>
  collapse::sbt(catalog == "care") |>
  _$alias

c("fqhc_enroll",
  "hha_enroll",
  "hosp_enroll",
  "rhc_enroll",
  "snf_enroll",
  "spice_enroll")

providertwo::endpoint("hha_enroll") |>
  providertwo::list_resources() |>
  collapse::sbt(ext == "csv") |>
  _$download

providertwo:::the$clog$care$current |>
  collapse::sbt(
    title %in% c(
      ccn_dataset_info |>
        collapse::sbt(catalog == "prov") |>
        _$title
      )
    )

hha = list(
  enroll = list(
    path = fs::path("C:/Users/Andrew/Downloads/HHA_Enrollments_2025.10.01.csv"),
    spec = readr::cols(
    `ENROLLMENT ID`                = readr::col_character(),
    `ENROLLMENT STATE`             = readr::col_character(),
    `PROVIDER TYPE CODE`           = readr::col_character(),
    `PROVIDER TYPE TEXT`           = readr::col_character(),
    NPI                            = readr::col_integer(),
    `MULTIPLE NPI FLAG`            = readr::col_character(),
    CCN                            = readr::col_character(),
    `ASSOCIATE ID`                 = readr::col_character(),
    `ORGANIZATION NAME`            = readr::col_character(),
    `DOING BUSINESS AS NAME`       = readr::col_character(),
    `INCORPORATION DATE`           = readr::col_character(),
    `INCORPORATION STATE`          = readr::col_character(),
    `ORGANIZATION TYPE STRUCTURE`  = readr::col_character(),
    `ORGANIZATION OTHER TYPE TEXT` = readr::col_character(),
    PROPRIETARY_NONPROFIT          = readr::col_character(),
    `ADDRESS LINE 1`               = readr::col_character(),
    `ADDRESS LINE 2`               = readr::col_character(),
    CITY                           = readr::col_character(),
    STATE                          = readr::col_character(),
    `ZIP CODE`                     = readr::col_character(),
    `PRACTICE LOCATION TYPE`       = readr::col_character(),
    `LOCATION OTHER TYPE TEXT`     = readr::col_logical()
    )
  ),
  address = list(
    path = fs::path("C:/Users/Andrew/Downloads/HHA_Additional_Addresses_2025.10.01.csv")),
  npi     = list(
    path = fs::path("C:/Users/Andrew/Downloads/HHA_Additional_NPIs_2025.10.01.csv"))
)

hha_enroll <- readr::read_csv(file = hha$enroll$path, col_types = hha$enroll$spec, num_threads = 4L) |>
  janitor::clean_names() |>
  collapse::mtt(
    inc_date = readr::parse_date(incorporation_date, format = "%m/%d/%Y"),
    inc_state = incorporation_state,
    address = providertwo:::make_address(address_line_1, address_line_2),
    multi_npi = cheapr::val_match(multiple_npi_flag, "Y" ~ 1L, "N" ~ 0L, .default = NA_integer_)
    ) |>
  collapse::slt(
    npi,
    ccn,
    enid = enrollment_id,
    multi_npi,
    pac = associate_id,
    org_name = organization_name,
    dba_name = doing_business_as_name,
    prop_non = proprietary_nonprofit,
    org_type = organization_type_structure,
    org_other = organization_other_type_text,
    address,
    city,
    zip = zip_code,
    inc_date,
    enid_state = enrollment_state,
    inc_state,
    loc_state = state)

hha_enroll |>
  cheapr::overview()

hosp_spec <- readr::cols(
  `ENROLLMENT ID`                  = readr::col_character(),
  `ENROLLMENT STATE`               = readr::col_character(),
  `PROVIDER TYPE CODE`             = readr::col_character(),
  `PROVIDER TYPE TEXT`             = readr::col_character(),
  NPI                              = readr::col_integer(),
  `MULTIPLE NPI FLAG`              = readr::col_character(),
  CCN                              = readr::col_character(),
  `ASSOCIATE ID`                   = readr::col_character(),
  `ORGANIZATION NAME`              = readr::col_character(),
  `DOING BUSINESS AS NAME`         = readr::col_character(),
  `INCORPORATION DATE`             = readr::col_character(),
  `INCORPORATION STATE`            = readr::col_character(),
  `ORGANIZATION TYPE STRUCTURE`    = readr::col_character(),
  `ORGANIZATION OTHER TYPE TEXT`   = readr::col_character(),
  `PROPRIETARY NONPROFIT`          = readr::col_character(),
  `ADDRESS LINE 1`                 = readr::col_character(),
  `ADDRESS LINE 2`                 = readr::col_character(),
  CITY                             = readr::col_character(),
  STATE                            = readr::col_character(),
  `ZIP CODE`                       = readr::col_character(),
  `PRACTICE LOCATION TYPE`         = readr::col_character(),
  `LOCATION OTHER TYPE TEXT`       = readr::col_character(),
  `SUBGROUP - GENERAL`             = readr::col_character(),
  `SUBGROUP - ACUTE CARE`          = readr::col_character(),
  `SUBGROUP - ALCOHOL DRUG`        = readr::col_character(),
  `SUBGROUP - CHILDRENS`           = readr::col_character(),
  `SUBGROUP - LONG-TERM`           = readr::col_character(),
  `SUBGROUP - PSYCHIATRIC`         = readr::col_character(),
  `SUBGROUP - REHABILITATION`      = readr::col_character(),
  `SUBGROUP - SHORT-TERM`          = readr::col_character(),
  `SUBGROUP - SWING-BED APPROVED`  = readr::col_character(),
  `SUBGROUP - PSYCHIATRIC UNIT`    = readr::col_character(),
  `SUBGROUP - REHABILITATION UNIT` = readr::col_character(),
  `SUBGROUP - SPECIALTY HOSPITAL`  = readr::col_character(),
  `SUBGROUP - OTHER`               = readr::col_character(),
  `SUBGROUP - OTHER TEXT`          = readr::col_character(),
  `REH CONVERSION FLAG`            = readr::col_character(),
  `REH CONVERSION DATE`            = readr::col_character(),
  `CAH OR HOSPITAL CCN`            = readr::col_character()
)

hosp_enroll <- fs::path("C:/Users/Andrew/Downloads/Hospital_Enrollments_2025.10.01.csv")
# hospital_address <- fs::path("C:/Users/Andrew/Downloads/Hospital_Additional_Addresses_2025.10.01.csv")
# hospital_npi <- fs::path("C:/Users/Andrew/Downloads/Hospital_Additional_NPIs_2025.10.01.csv")

chr_bin <- \(x) cheapr::case(x == "Y" ~ 1L, x == "N" ~ 0L, .default = NA_integer_)

hosp <- readr::read_csv(file = hosp_enroll,
                col_types = hosp_spec,
                num_threads = 4L) |>
  janitor::clean_names() |>
  collapse::mtt(
    inc_date = readr::parse_date(incorporation_date, format = "%m/%d/%Y"),
    inc_state = incorporation_state,
    address = providertwo:::make_address(address_line_1, address_line_2),
    multi_npi = cheapr::val_match(multiple_npi_flag, "Y" ~ 1L, "N" ~ 0L, .default = NA_integer_),
    reh_flag = cheapr::val_match(reh_conversion_flag, "Y" ~ 1L, "N" ~ 0L, .default = NA_integer_),
    reh_date = readr::parse_date(reh_conversion_date, format = "%m/%d/%Y"),
    acr(
      c(
        subgroup_general,
        subgroup_acute_care,
        subgroup_alcohol_drug,
        subgroup_childrens,
        subgroup_long_term,
        subgroup_psychiatric,
        subgroup_rehabilitation,
        subgroup_short_term,
        subgroup_swing_bed_approved,
        subgroup_psychiatric_unit,
        subgroup_rehabilitation_unit,
        subgroup_specialty_hospital,
        subgroup_other
      ),
      chr_bin
    )
  ) |>
  collapse::slt(
    npi,
    ccn,
    enid = enrollment_id,
    multi_npi,
    pac = associate_id,
    org_name = organization_name,
    dba_name = doing_business_as_name,
    prop_non = proprietary_nonprofit,
    org_type = organization_type_structure,
    org_other = organization_other_type_text,
    address,
    city,
    zip = zip_code,
    inc_date,
    enid_state = enrollment_state,
    inc_state,
    loc_state = state,
    loc_type = practice_location_type,
    loc_other = location_other_type_text,
    reh_flag,
    reh_date,
    sub_general = subgroup_general,
    sub_acute = subgroup_acute_care,
    sub_drug = subgroup_alcohol_drug,
    sub_child = subgroup_childrens,
    sub_long = subgroup_long_term,
    sub_rehab = subgroup_rehabilitation,
    sub_short = subgroup_short_term,
    sub_swing = subgroup_swing_bed_approved,
    sub_psych = subgroup_psychiatric,
    sub_psychu = subgroup_psychiatric_unit,
    sub_rehabu = subgroup_rehabilitation_unit,
    sub_spec = subgroup_specialty_hospital,
    sub_other = subgroup_other,
    sub_otxt = subgroup_other_text) |>
  dplyr::glimpse()

hosp |>
  cheapr::overview()
