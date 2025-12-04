library(collapse)

hha <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/HHA_Enrollments_2025.10.01.csv"),
  col_types = readr::cols(
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
    `LOCATION OTHER TYPE TEXT`     = readr::col_logical()),
  num_threads = 4L) |>
  janitor::clean_names() |>
  collapse::mtt(
    inc_date = readr::parse_date(incorporation_date, format = "%m/%d/%Y"),
    inc_state = incorporation_state,
    address = providertwo:::make_address(address_line_1, address_line_2),
    multi_npi = cheapr::val_match(multiple_npi_flag, "Y" ~ 1L, "N" ~ 0L, .default = NA_integer_),
    organization_type_structure = data.table::fifelse(
      !is.na(organization_other_type_text),
      as.character(glue::glue("Other: {organization_other_type_text}")),
      organization_type_structure)) |>
  collapse::slt(
    ccn,
    state,
    org_type = organization_type_structure,
    prop_non = proprietary_nonprofit,
    org_name = organization_name)

# both enid and ccn are unique
collapse::fcount(hha, org_type)

# hha ===  11,723 × 5 [1.9 MB]
pin_update(
  hha,
  name        = "hha",
  title       = "Home Health Enrollments",
  description = "Home Health Enrollments 2025")
