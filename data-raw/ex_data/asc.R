
# PXRF
c("11X0009845", "11X0009814", "11X0009803", "11X0009840", "09X0000002", "21X0009807")

# ASC
c("65C0001000", "65C0001001", "55C0001197")

# CLIA
c("02D0873639", # Artic Envestigations Program Laboratory, Anchorage, AK
  "40D0869394", # Dengue Laboratory, San Juan, PR
  "11D1061576", # CDC/CGH/DGHA International Laboratory, Atlanta, GA
  "11D0668319", # Infectious Diseases Laboratory, Atlanta, GA
  "11D0668290", # National Center for Environmental Health, Division of Laboratory Science, Atlanta, GA
  "06D0880233", # Vector-Borne Diseases Laboratory, Fort Collins, CO
  "11D2306220") # Wiregrass Georgia Tech College Student Health Center, Valdosta, GA

library(collapse)

#-----Ambulatory Surgical Center Quality Measures - Facility-----
asc <- readr::read_csv(
  file                            = fs::path("C:/Users/Andrew/Downloads/ASC_Facility.csv"),
  num_threads                     = 4L,
  col_types                       = readr::cols(
    `Facility Name`               = readr::col_character(),
    `Facility ID`                 = readr::col_character(),
    NPI                           = readr::col_integer(),
    `City/Town`                   = readr::col_character(),
    State                         = readr::col_character(),
    `ZIP Code`                    = readr::col_character(),
    Year                          = readr::col_character(),
    `ASC-1 Rate*`                 = readr::col_character(),
    `ASC-1 Footnote`              = readr::col_double(),
    `ASC-2 Rate*`                 = readr::col_character(),
    `ASC-2 Footnote`              = readr::col_double(),
    `ASC-3 Rate*`                 = readr::col_character(),
    `ASC-3 Footnote`              = readr::col_double(),
    `ASC-4 Rate*`                 = readr::col_character(),
    `ASC-4 Footnote`              = readr::col_double(),
    `ASC-9 Rate*`                 = readr::col_character(),
    `ASC-9 Footnote`              = readr::col_double(),
    `ASC-11 Rate*`                = readr::col_character(),
    `ASC-11 Footnote`             = readr::col_double(),
    `ASC-12 Total Cases`          = readr::col_character(),
    `ASC-12 Performance Category` = readr::col_character(),
    `ASC-12 RSHV Rate`            = readr::col_character(),
    `ASC-12 Interval Lower Limit` = readr::col_character(),
    `ASC-12 Interval Upper Limit` = readr::col_character(),
    `ASC-12 Footnote`             = readr::col_double(),
    `ASC-13 Rate*`                = readr::col_character(),
    `ASC-13 Footnote`             = readr::col_double(),
    `ASC-14 Rate*`                = readr::col_character(),
    `ASC-14 Footnote`             = readr::col_double(),
    `ASC-17 Total Cases`          = readr::col_character(),
    `ASC-17 Performance Category` = readr::col_character(),
    `ASC-17 RSHV Rate`            = readr::col_character(),
    `ASC-17 Interval Lower Limit` = readr::col_character(),
    `ASC-17 Interval Upper Limit` = readr::col_character(),
    `ASC-17 Footnote`             = readr::col_double(),
    `ASC-18 Total Cases`          = readr::col_character(),
    `ASC-18 Performance Category` = readr::col_character(),
    `ASC-18 RSHV Rate`            = readr::col_character(),
    `ASC-18 Interval Lower Limit` = readr::col_character(),
    `ASC-18 Interval Upper Limit` = readr::col_character(),
    `ASC-18 Footnote`             = readr::col_double(),
    `ASC-19 Total Cases`          = readr::col_character(),
    `ASC-19 Performance Category` = readr::col_character(),
    `ASC-19 RSHV Rate`            = readr::col_character(),
    `ASC-19 Interval Lower Limit` = readr::col_character(),
    `ASC-19 Interval Upper Limit` = readr::col_character(),
    `ASC-19 Footnote`             = readr::col_double(),
    `ASC-20 Sample`               = readr::col_double(),
    `ASC-20 Rate*`                = readr::col_character(),
    `ASC-20 Footnote`             = readr::col_double())) |>
  janitor::clean_names() |>
  collapse::slt(
    ccn = facility_id,
    npi,
    facility_name,
    city = city_town,
    state) |>
  collapse::funique()

pin_update(
  asc,
  name = "asc",
  title = "Ambulatory Surgical Centers",
  description = "Ambulatory Surgical Center Quality Measures - Facility")
