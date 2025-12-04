hosp <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/Hospital_Enrollments_2025.10.01.csv"),
  num_threads                        = 4L,
  col_types                          = readr::cols(
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
    `CAH OR HOSPITAL CCN`            = readr::col_character())) |>
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
    org_name = organization_name,
    prop_non = proprietary_nonprofit,
    org_type = organization_type_structure,
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
    state,
    loc_type = practice_location_type,
    reh_ccns = cah_or_hospital_ccn,
    sub_otxt = subgroup_other_text,
    REH = reh_flag,
    Other = subgroup_other,
    General = subgroup_general,
    Specialty = subgroup_specialty_hospital,
    Acute = subgroup_acute_care,
    STC = subgroup_short_term,
    ADH = subgroup_alcohol_drug,
    CH = subgroup_childrens,
    LTC = subgroup_long_term,
    IRF = subgroup_rehabilitation,
    SBA = subgroup_swing_bed_approved,
    PH = subgroup_psychiatric,
    `PH Unit` = subgroup_psychiatric_unit,
    `IRF Unit` = subgroup_rehabilitation_unit)

# hosp === 9,217 × 22 [2.1 MB]
pin_update(
  hosp,
  name        = "hosp",
  title       = "Hospital Enrollments",
  description = "Hospital Enrollments 2025")

#############################################
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

collapse::slt(hosp, ccn, REH:`IRF Unit`) |>
  collapse::pivot(ids = c("ccn")) |>
  collapse::roworder(ccn) |>
  collapse::sbt(value %==% 1L, -value) |>
  collapse::mtt(facility_type = stringr::str_remove(variable, "sub_"), variable = NULL) |>
  # collapse::sbt(facility_type == "General")
  collapse::fcount(facility_type) |>
  collapse::roworder(-N)

collapse::slt(hosp, ccn:sub_otxt) |>
  collapse::sbt(!is.na(sub_otxt)) |>
  collapse::fcount(sub_otxt)

#############################################
hosp <- collapse::mtt(hosp, i = seq_len(nrow(hosp))) |>
  collapse::mtt(has_alpha = stringr::str_detect(ccn, "[A-Z]")) |>
  collapse::colorder(i) |>
  collapse::rsplit(~ has_alpha) |>
  rlang::set_names(c("numeric_ccn", "alphanumeric_ccn"))

hosp$other_ccn <- collapse::rowbind(
  collapse::sbt(hosp$alphanumeric_ccn, !is.na(sub_otxt)),
  collapse::sbt(hosp$numeric_ccn, !is.na(sub_otxt)),
  fill = TRUE)

hosp$alphanumeric_ccn <- collapse::sbt(hosp$alphanumeric_ccn, i %!iin% hosp$other_ccn$i)
hosp$numeric_ccn      <- collapse::sbt(hosp$numeric_ccn, i %!iin% hosp$other_ccn$i)

# reh_date is all NA
hosp$alphanumeric_ccn <- hosp$alphanumeric_ccn[, !cheapr::col_all_na(hosp$alphanumeric_ccn)]


#-----Transforming the Subunits-----
hosp_ccn <- get_pin("hospital_enrollment")$alphanumeric_ccn$ccn

fastplyr::new_tbl(
  ccn = hosp_ccn,
  chr = nchar(ccn),
  # valid = (nchar(ccn) %in% c(6L, 10L)) |> as.integer(),
  # ten = (nchar(ccn) == 10L) |> as.integer(),
  state = get_state_code(ccn),
  state_nm = get_state_name(state),
  three = get_three(ccn),
  four  = get_four(ccn),
  six = get_six(ccn),
  alpha3 = is_letter(three) |> as.integer(),
  alpha4 = is_letter(four) |> as.integer(),
  alpha6 = is_letter(six) |> as.integer()
) |>
  # collapse::fcount(chr) |>
  collapse::sbt(chr > 6L) |>
  print(n = Inf)

# both enid and ccn are unique
x   <- colnames(hosp$numeric_ccn)
sub <- x[startsWith(x, "sub")]

sub_numeric <- hosp$numeric_ccn |>
  collapse::slt(c('i', 'ccn', sub))

sub_numeric |>
  collapse::slt(-sub_otxt) |>
  collapse::pivot(ids = c("i", "ccn")) |>
  collapse::roworder(ccn) |>
  collapse::sbt(value %==% 1L) |>
  collapse::mtt(variable = stringr::str_remove(variable, "sub_")) |>
  collapse::fcount(variable)

hosp$other_ccn |>
  collapse::sbt(!is.na(sub_otxt)) |>
  collapse::slt(sub_other, sub_otxt)
