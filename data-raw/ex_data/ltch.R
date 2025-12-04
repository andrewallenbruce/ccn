#-----Long-Term Care Hospital - Provider Data-----
ltch <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/Long-Term_Care_Hospital-Provider_Data_Sep2025.csv"),
  num_threads = 4L,
  col_types = readr::cols(
    `CMS Certification Number (CCN)` = readr::col_character(),
    `Provider Name`                  = readr::col_character(),
    `Address Line 1`                 = readr::col_character(),
    `Address Line 2`                 = readr::col_character(),
    `City/Town`                      = readr::col_character(),
    State                            = readr::col_character(),
    `ZIP Code`                       = readr::col_character(),
    `County/Parish`                  = readr::col_character(),
    `Telephone Number`               = readr::col_character(),
    `CMS Region`                     = readr::col_double(),
    `Measure Code`                   = readr::col_character(),
    Score                            = readr::col_character(),
    Footnote                         = readr::col_character(),
    `Start Date`                     = readr::col_character(),
    `End Date`                       = readr::col_character(),
    `Measure Date Range`             = readr::col_character())) |>
  janitor::clean_names() |>
  collapse::mtt(address = providertwo:::make_address(address_line_1, address_line_2)) |>
  collapse::slt(
    ccn = cms_certification_number_ccn,
    provider_name,
    # city = city_town,
    state) |>
  collapse::funique()

# 324 × 3
pin_update(
  ltch,
  name = "ltch",
  title = "Long-Term Care Hospitals",
  description = "Long-Term Care Hospital - Provider Data")
