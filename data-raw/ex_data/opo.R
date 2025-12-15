library(collapse)

opo_codes <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/opo_codes.csv"),
  col_select = c(1:2),
  col_names = FALSE,
  num_threads = 4L
) |>
  collapse::slt(code = X2, opo = X1) |>
  collapse::roworder(code, opo) |>
  print(n = Inf)

opo_county <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/opo_state_county.csv"),
  col_select = c(1:3),
  num_threads = 4L,
  col_types = readr::cols(
    State = readr::col_character(),
    County = readr::col_character(),
    `CMS OPO Assignment` = readr::col_character()
  )
) |>
  janitor::clean_names() |>
  collapse::mtt(
    county = stringr::str_remove(county, " County") |>
      stringr::str_to_sentence(),
    state_abbr = vs(
      state,
      ccn::state_codes[["name"]],
      ccn::state_codes[["abbr"]]
    ),
    state = NULL
  ) |>
  collapse::slt(code = cms_opo_assignment, state = state_abbr, county) |>
  collapse::funique() |>
  collapse::roworder(code, state)

opo <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/active_opo_accounts.csv"),
  num_threads = 4L,
  col_types = readr::cols(
    CCN = readr::col_character(),
    `Provider Name` = readr::col_character(),
    Address = readr::col_character(),
    City = readr::col_character(),
    State = readr::col_character(),
    `Zip Code` = readr::col_character(),
    County = readr::col_character(),
    Region = readr::col_character(),
    `Phone Number` = readr::col_character(),
    `Provider Type` = readr::col_character(),
    `Original Participation Date` = readr::col_character(),
    `Termination Date` = readr::col_character(),
    `Number of Certified Beds` = readr::col_character(),
    `Hospital Based` = readr::col_character(),
    `Chain Name` = readr::col_character(),
    `Ownership Type` = readr::col_character()
  )
) |>
  janitor::clean_names() |>
  collapse::mtt(
    original_participation_date = readr::parse_date(
      original_participation_date,
      format = "%m/%d/%Y"
    ),
    termination_date = readr::parse_date(termination_date, format = "%m/%d/%Y"),
    county = stringr::str_to_sentence(county)
  ) |>
  collapse::slt(
    ccn,
    opo = provider_name,
    state,
    county,
    region,
    orig_date = original_participation_date
  ) |>
  collapse::roworder(state, ccn)

collapse::fcount(opo, region) |>
  collapse::roworder(-N) |>
  print(n = Inf)

vctrs::vec_split(opo$state, opo$region)

opo_current <- collapse::join(opo, opo_county, on = c("state", "county")) |>
  print(n = Inf)

opo_current |>
  collapse::sbt(is.na(code))

opo_county |>
  collapse::sbt(state %in% c("IL", "LA", "PR")) |>
  print(n = 50)


opo_code_state <- opo_code_state |>
  collapse::mtt(
    opo = toupper(opo),
    opo = stringr::str_remove(opo, " INC|, INC|'|  "),
    opo = stringr::str_replace(opo, "&", "AND")
  ) |>
  collapse::roworder(opo) |>
  print(n = Inf)

opo_current <- opo |>
  collapse::mtt(
    opo = stringr::str_remove(opo, " INC|, INC|'|//s+"),
    opo = stringr::str_replace_all(
      opo,
      c(
        "&" = "AND",
        "VERSITI WISCONSIN" = "VERSITI BLOOD CENTER OF WISCONSIN",
        "MID AMERICA" = "MID-AMERICA",
        "LIFEQUEST ORGAN RECOVERY SERVI" = "LIFEQUEST ORGAN RECOVERY SERVICES",
        "UPPER MIDWEST OPO  LIFESOU" = "LIFESOURCE UPPER MIDWEST ORGAN PROCUREMENT ORGANIZATION",
        "DCI NEW MEXICO DONOR SERVICES" = "NEW MEXICO DONOR SERVICES",
        "GIFT OF HOPE" = "GIFT OF HOPE ORGAN AND TISSUE DONOR NETWORK",
        "GIFT OF LIFE" = "GIFT OF LIFE DONOR PROGRAM",
        "LIFE LINK OF PUERTO RICO" = "LIFELINK OF PUERTO RICO",
        "LIFEGIFT ORGAN DONATION CENTER" = "LIFEGIFT",
        "LIFELINE OF OHIO ORGAN PROCURE" = "LIFELINE OF OHIO",
        "LIFESHARE TRANSPLANT DONOR SERVICES OF OKLAHOMA" = "LIFESHARE OF OKLAHOMA",
        "LIFELINE OF OHIO ORGAN PROCURE" = "LIFELINE OF OHIO",
        "MID-AMERICA TRANSPLANT SERVICE" = "MID-AMERICA TRANSPLANT",
        "NEW JERSEY ORGAN AND TISSUE SHARING NETWORK" = "NJ SHARING NETWORK",
        "UNIVERSITY OF WISCONSIN OPO" = "UW ORGAN AND TISSUE DONATION",
        "GIFT OF LIFE DONOR PROGRAM MICHIGAN" = "GIFT OF LIFE MICHIGAN"
      )
    )
  ) |>
  collapse::roworder(opo) |>
  print(n = Inf)

state_miss <- collapse::join(
  opo_current,
  opo_code_state,
  on = c("opo", "state")
) |>
  collapse::sbt(is.na(code)) |>
  _$state

opo_code_state |>
  collapse::sbt(state %in% state_miss) |>
  print(n = Inf)

collapse::join(opo_current, opo_code_state, on = c("opo", "state")) |>
  collapse::sbt(is.na(code))

# aff === 39,130 × 3 [2.8 MB]
pin_update(
  aff,
  name = "aff",
  title = "Facility Affiliations",
  description = "CCNs Facility Affiliation"
)
