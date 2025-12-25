irf <- readr::read_csv(
  file = fs::path(
    "C:/Users/Andrew/Downloads/Inpatient_Rehabilitation_Facility-Provider_Data_Sep2025.csv"
  ),
  num_threads = 4L,
  col_types = readr::cols(
    `CMS Certification Number (CCN)` = readr::col_character(),
    `Provider Name` = readr::col_character(),
    `Address Line 1` = readr::col_character(),
    `Address Line 2` = readr::col_character(),
    `City/Town` = readr::col_character(),
    State = readr::col_character(),
    `ZIP Code` = readr::col_character(),
    `County/Parish` = readr::col_character(),
    `Telephone Number` = readr::col_character(),
    `CMS Region` = readr::col_integer(),
    `Measure Code` = readr::col_character(),
    Score = readr::col_character(),
    Footnote = readr::col_character(),
    `Start Date` = readr::col_character(),
    `End Date` = readr::col_character(),
    `Measure Date Range` = readr::col_character()
  )
) |>
  janitor::clean_names() |>
  collapse::mtt(
    address = providertwo:::make_address(address_line_1, address_line_2)
  ) |>
  collapse::slt(
    ccn = cms_certification_number_ccn,
    provider_name,
    state
  ) |>
  collapse::funique()

# irf === 1,221 × 3  [213.7 KB]
pin_update(
  irf,
  name = "irf",
  title = "Inpatient Rehabilitation Facility",
  description = "Inpatient Rehabilitation Facility - Provider Data"
)

x <- get_pin("irf")

x

x_decode <- purrr::map(x$ccn, \(x) ccn::data_frame(x)) |>
  collapse::rowbind(fill = TRUE)

x_decode |>
  collapse::descr()
