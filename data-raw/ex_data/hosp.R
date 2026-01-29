hosp <- readr::read_csv(
  file = fs::path(
    "C:/Users/Andrew/Downloads/Hospital_Enrollments_2025.10.01.csv"
  ),
  num_threads = 4L,
  col_types = readr::cols(
    `ENROLLMENT ID` = readr::col_character(),
    `ENROLLMENT STATE` = readr::col_character(),
    `PROVIDER TYPE CODE` = readr::col_character(),
    `PROVIDER TYPE TEXT` = readr::col_character(),
    NPI = readr::col_integer(),
    `MULTIPLE NPI FLAG` = readr::col_character(),
    CCN = readr::col_character(),
    `ASSOCIATE ID` = readr::col_character(),
    `ORGANIZATION NAME` = readr::col_character(),
    `DOING BUSINESS AS NAME` = readr::col_character(),
    `INCORPORATION DATE` = readr::col_character(),
    `INCORPORATION STATE` = readr::col_character(),
    `ORGANIZATION TYPE STRUCTURE` = readr::col_character(),
    `ORGANIZATION OTHER TYPE TEXT` = readr::col_character(),
    `PROPRIETARY NONPROFIT` = readr::col_character(),
    `ADDRESS LINE 1` = readr::col_character(),
    `ADDRESS LINE 2` = readr::col_character(),
    CITY = readr::col_character(),
    STATE = readr::col_character(),
    `ZIP CODE` = readr::col_character(),
    `PRACTICE LOCATION TYPE` = readr::col_character(),
    `LOCATION OTHER TYPE TEXT` = readr::col_character(),
    `SUBGROUP - GENERAL` = readr::col_character(),
    `SUBGROUP - ACUTE CARE` = readr::col_character(),
    `SUBGROUP - ALCOHOL DRUG` = readr::col_character(),
    `SUBGROUP - CHILDRENS` = readr::col_character(),
    `SUBGROUP - LONG-TERM` = readr::col_character(),
    `SUBGROUP - PSYCHIATRIC` = readr::col_character(),
    `SUBGROUP - REHABILITATION` = readr::col_character(),
    `SUBGROUP - SHORT-TERM` = readr::col_character(),
    `SUBGROUP - SWING-BED APPROVED` = readr::col_character(),
    `SUBGROUP - PSYCHIATRIC UNIT` = readr::col_character(),
    `SUBGROUP - REHABILITATION UNIT` = readr::col_character(),
    `SUBGROUP - SPECIALTY HOSPITAL` = readr::col_character(),
    `SUBGROUP - OTHER` = readr::col_character(),
    `SUBGROUP - OTHER TEXT` = readr::col_character(),
    `REH CONVERSION FLAG` = readr::col_character(),
    `REH CONVERSION DATE` = readr::col_character(),
    `CAH OR HOSPITAL CCN` = readr::col_character()
  )
) |>
  janitor::clean_names() |>
  collapse::mtt(
    inc_date = readr::parse_date(incorporation_date, format = "%m/%d/%Y"),
    inc_state = incorporation_state,
    address = providertwo:::make_address(address_line_1, address_line_2),
    proprietary_nonprofit = cheapr::val_match(
      proprietary_nonprofit,
      "P" ~ 1L,
      "N" ~ 0L,
      .default = NA_integer_
    ),
    multi_npi = cheapr::val_match(
      multiple_npi_flag,
      "Y" ~ 1L,
      "N" ~ 0L,
      .default = NA_integer_
    ),
    reh_flag = cheapr::val_match(
      reh_conversion_flag,
      "Y" ~ 1L,
      "N" ~ 0L,
      .default = NA_integer_
    ),
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
    ),
    practice_location_type = data.table::fifelse(
      !is.na(location_other_type_text),
      as.character(glue::glue("Other: {location_other_type_text}")),
      practice_location_type
    )
  ) |>
  collapse::slt(
    # npi,
    # enid = enrollment_id,
    # enid_state = enrollment_state,
    # pac = associate_id,
    ccn,
    prop = proprietary_nonprofit,
    state,
    name = organization_name,
    org = organization_type_structure,
    # org_dba = doing_business_as_name,
    # org_otxt = organization_other_type_text,
    # address,
    # city,
    # zip = zip_code,
    # inc_date,
    # inc_state,
    # loc_otxt = location_other_type_text,
    # multi_npi,
    # reh_date,
    location = practice_location_type,
    reh_ccns = cah_or_hospital_ccn,
    sub_otxt = subgroup_other_text,
    REH = reh_flag,
    Other = subgroup_other,
    General = subgroup_general,
    Specialty = subgroup_specialty_hospital,
    Acute = subgroup_acute_care,
    STC = subgroup_short_term,
    ADH = subgroup_alcohol_drug,
    Childs = subgroup_childrens,
    LTC = subgroup_long_term,
    IRF = subgroup_rehabilitation,
    `Swing Bed` = subgroup_swing_bed_approved,
    Psych = subgroup_psychiatric,
    `Psych Unit` = subgroup_psychiatric_unit,
    `IRF Unit` = subgroup_rehabilitation_unit
  )

hosp_facility_type <- hosp |>
  collapse::slt(ccn, REH:`IRF Unit`) |>
  collapse::pivot(ids = c("ccn")) |>
  collapse::roworder(ccn) |>
  collapse::sbt(value %==% 1L, -value) |>
  collapse::mtt(
    subgroup = stringr::str_remove(variable, "sub_"),
    variable = NULL
  ) |>
  collapse::fgroup_by(ccn) |>
  collapse::mtt(subgroup = toString(subgroup)) |>
  collapse::funique() |>
  collapse::fungroup()

hosp <- hosp |>
  collapse::slt(ccn:sub_otxt) |>
  collapse::join(hosp_facility_type, on = "ccn") |>
  collapse::mtt(
    subgroup = data.table::fifelse(
      !is.na(sub_otxt),
      as.character(glue::glue("{subgroup}, {sub_otxt}")),
      subgroup
    ),
    subgroup = data.table::fifelse(
      !is.na(reh_ccns),
      as.character(glue::glue("{subgroup}: {reh_ccns}")),
      subgroup
    ),
    sub_otxt = NULL,
    reh_ccns = NULL
  )

hosp <- ccn:::get_pin("hosp")

# hosp === 9,217 × 7 [1.5 MB]
pin_update(
  hosp,
  name = "hosp",
  title = "Hospital Enrollments",
  description = "Hospital Enrollments 2025"
)

# 4   Z      1321
# 2   S       736
# 1   T       718
# 3   U       292
# 6   M        46
# 7   R         6
# 8   E         2
# 11  W         2
# 9   Y         1
# 5   F         1
# 10 TA        38
# 12 SA         5
# 13 TB         2
# 14 SE         1
# 15 SB         1
# 16 SD         1

#    facility_type     N
# 1  Acute          3056
# 2  General        1548
# 3  PH Unit         970
# 4  IRF Unit        863
# 5  PH              816
# 6  IRF             645
# 7  SBA             428
# 8  LTC             336
# 9  Other           280
# 10 STC             128
# 11 CH              106
# 12 Specialty        75
# 13 REH              41
# 14 ADH              21

# CCN count by facility type
# 1  4625
# 2  1210
# 3   468
# 4   151
# 6     5
# 5    36
# 7     6
# 8     1
