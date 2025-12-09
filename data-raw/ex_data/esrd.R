library(collapse)

esrd <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/DFC_FACILITY.csv"),
  num_threads = 4L,
  col_types = readr::cols(
    `CMS Certification Number (CCN)` = readr::col_character(),
    Network = readr::col_integer(),
    `Facility Name` = readr::col_character(),
    `Five Star Date` = readr::col_character(),
    `Five Star` = readr::col_double(),
    `Five Star Data Availability Code` = readr::col_character(),
    `Address Line 1` = readr::col_character(),
    `Address Line 2` = readr::col_character(),
    `City/Town` = readr::col_character(),
    State = readr::col_character(),
    `ZIP Code` = readr::col_character(),
    `County/Parish` = readr::col_character(),
    `Telephone Number` = readr::col_character(),
    `Profit or Non-Profit` = readr::col_character(),
    `Chain Owned` = readr::col_character(),
    `Chain Organization` = readr::col_character(),
    `Late Shift` = readr::col_character(),
    `# of Dialysis Stations` = readr::col_double(),
    `Offers in-center hemodialysis` = readr::col_character(),
    `Offers peritoneal dialysis` = readr::col_character(),
    `Offers home hemodialysis training` = readr::col_character(),
    `Certification Date` = readr::col_character()
  )
) |>
  janitor::clean_names() |>
  collapse::mtt(
    cert_year = substr(certification_date, 6, 9) |> as.integer(),
    address = providertwo:::make_address(address_line_1, address_line_2),
    chain_owned = cheapr::val_match(
      chain_owned,
      "Yes" ~ 1L,
      "No" ~ 0L,
      .default = NA_integer_
    ),
    profit_non = cheapr::val_match(
      profit_or_non_profit,
      "Non-profit" ~ "N",
      "Profit" ~ "P",
      .default = NA_character_
    ),
    five_star = as.integer(five_star),
    stations = as.integer(number_of_dialysis_stations),
    offers_in_center_hemodialysis = cheapr::val_match(
      offers_in_center_hemodialysis,
      "Yes" ~ 1L,
      "No" ~ 0L,
      .default = NA_integer_
    ),
    offers_peritoneal_dialysis = cheapr::val_match(
      offers_peritoneal_dialysis,
      "Yes" ~ 1L,
      "No" ~ 0L,
      .default = NA_integer_
    ),
    offers_home_hemodialysis_training = cheapr::val_match(
      offers_home_hemodialysis_training,
      "Yes" ~ 1L,
      "No" ~ 0L,
      .default = NA_integer_
    )
  ) |>
  collapse::slt(
    ccn = cms_certification_number_ccn,
    state,
    facility_name,
    chain = chain_organization,
    profit = profit_non,
    office = offers_in_center_hemodialysis,
    peri = offers_peritoneal_dialysis,
    home = offers_home_hemodialysis_training
  )

# esrd === 7,561 × 8 [1.500 MB]
pin_update(
  esrd,
  name = "esrd",
  title = "Dialysis Facilities",
  description = "Dialysis Facility - Listing by Facility 2025"
)
