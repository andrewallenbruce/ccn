hosp_info <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/Hospital_General_Information.csv"),
  num_threads = 4L,
  col_types = readr::cols(
    `Facility ID` = readr::col_character(),
    `Facility Name` = readr::col_character(),
    Address = readr::col_character(),
    `City/Town` = readr::col_character(),
    State = readr::col_character(),
    `ZIP Code` = readr::col_character(),
    `County/Parish` = readr::col_character(),
    `Telephone Number` = readr::col_character(),
    `Hospital Type` = readr::col_character(),
    `Hospital Ownership` = readr::col_character(),
    `Emergency Services` = readr::col_character(),
    `Meets criteria for birthing friendly designation` = readr::col_character(),
    `Hospital overall rating` = readr::col_character(),
    `Hospital overall rating footnote` = readr::col_double(),
    `MORT Group Measure Count` = readr::col_character(),
    `Count of Facility MORT Measures` = readr::col_character(),
    `Count of MORT Measures Better` = readr::col_character(),
    `Count of MORT Measures No Different` = readr::col_character(),
    `Count of MORT Measures Worse` = readr::col_character(),
    `MORT Group Footnote` = readr::col_double(),
    `Safety Group Measure Count` = readr::col_character(),
    `Count of Facility Safety Measures` = readr::col_character(),
    `Count of Safety Measures Better` = readr::col_character(),
    `Count of Safety Measures No Different` = readr::col_character(),
    `Count of Safety Measures Worse` = readr::col_character(),
    `Safety Group Footnote` = readr::col_double(),
    `READM Group Measure Count` = readr::col_character(),
    `Count of Facility READM Measures` = readr::col_character(),
    `Count of READM Measures Better` = readr::col_character(),
    `Count of READM Measures No Different` = readr::col_character(),
    `Count of READM Measures Worse` = readr::col_character(),
    `READM Group Footnote` = readr::col_double(),
    `Pt Exp Group Measure Count` = readr::col_character(),
    `Count of Facility Pt Exp Measures` = readr::col_character(),
    `Pt Exp Group Footnote` = readr::col_double(),
    `TE Group Measure Count` = readr::col_character(),
    `Count of Facility TE Measures` = readr::col_character(),
    `TE Group Footnote` = readr::col_double()
  )
) |>
  janitor::clean_names() |>
  collapse::mtt(
    emergency_services = cheapr::val_match(
      emergency_services,
      "Yes" ~ 1L,
      "No" ~ 0L,
      .default = NA_integer_
    ),
    meets_criteria_for_birthing_friendly_designation = cheapr::val_match(
      meets_criteria_for_birthing_friendly_designation,
      "Y" ~ 1L,
      "N" ~ 0L,
      .default = NA_integer_
    )
  ) |>
  collapse::slt(
    ccn = facility_id,
    facility_name,
    state,
    type = hospital_type,
    owner = hospital_ownership,
    emergency = emergency_services
  )

hosp_info <- get_pin("hosp_info")

# hosp_info === 5,381 × 6 [990.3 KB]
pin_update(
  hosp_info,
  name = "hosp_info",
  title = "Hospital Information",
  description = "Hospital General Information 2025"
)

# All states are correct
get_pin("hosp_info") |>
  # collapse::slt(ccn, state, type) |>
  collapse::mtt(
    # state_check = ccn:::state_abbr(substring(ccn, 1L, 2L)) == state,
    prov_type = ccn:::provider_type(ccn),
    code = data.table::fifelse(
      prov_type == "medicare",
      substring(ccn, 3L, 6L),
      substring(ccn, 6L, 6L)
    ),
    fac_type = data.table::fifelse(
      prov_type == "medicare",
      purrr::map(code, ccn:::medicare_range) |>
        purrr::pluck(1) |>
        ccn:::medicare_range_desc(),
      purrr::map(code, \(x) {
        ifelse(
          x == "E",
          "Non-Federal Emergency Hospital",
          "Federal Emergency Hospital"
        )
      }) |>
        purrr::pluck(1)
    )
  ) |>
  collapse::sbt(prov_type != "medicare") |>
  collapse::fcount(fac_type)
