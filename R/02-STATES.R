#' @include utils.R
NULL

STATE_CODE_LIST <- list(
  "AZ"   = c("00", "03"),
  "AL"   = c("01"),
  "AK"   = c("02"),
  "AR"   = c("04", "89"),
  "CO"   = c("06", "91"),
  "NH"   = c("30"),
  "NJ"   = c("31", "83"),
  "NM"   = c("32", "96"),
  "NY"   = c("33", "57"),
  "CA"   = c("05", "55", "75", "92", "A0", "A1", "B2"),
  "NC"   = c("34", "86"),
  "ND"   = c("35"),
  "CT"   = c("07", "81"),
  "OH"   = c("36", "72", "A6"),
  "DE"   = c("08"),
  "OK"   = c("37", "90"),
  "DC"   = c("09"),
  "OR"   = c("38", "93"),
  "FL"   = c("10", "68", "69", "A2"),
  "PA"   = c("39", "73", "A7"),
  "GA"   = c("11", "85"),
  "PR"   = c("40", "84"),
  "HI"   = c("12"),
  "RI"   = c("41"),
  "ID"   = c("13", "54"),
  "SC"   = c("42", "87"),
  "IL"   = c("14", "78"),
  "SD"   = c("43"),
  "IN"   = c("15"),
  "TN"   = c("44", "88", "A8"),
  "IA"   = c("16", "76"),
  "TX"   = c("45", "67", "74", "97", "A9"),
  "KS"   = c("17", "70"),
  "UT"   = c("46"),
  "KY"   = c("18", "B0"),
  "VT"   = c("47"),
  "LA"   = c("19", "71", "95", "A3"),
  "VI"   = c("48"),
  "ME"   = c("20"),
  "VA"   = c("49"),
  "MD"   = c("21", "80"),
  "WA"   = c("50", "94"),
  "MA"   = c("22", "82"),
  "WV"   = c("51", "58", "B1"),
  "MI"   = c("23", "A4"),
  "WI"   = c("52"),
  "MN"   = c("24", "77"),
  "WY"   = c("53"),
  "MS"   = c("25", "A5"),
  "CN"   = c("56"),
  "MO"   = c("26", "79"),
  "MX"   = c("59"),
  "MT"   = c("27"),
  "AS"   = c("64"),
  "NE"   = c("28"),
  "GU"   = c("65"),
  "NV"   = c("29"),
  "CNMI" = c("66"),
  "FC"   = c("99"))


STATE_NAME_LIST <- rlang::set_names(
  as.list(c(
    state.abb, "DC", "PR", "VI", "CN", "MX", "AS", "GU", "CNMI", "FC")),
  c(state.name,
    "District of Columbia",
    "Puerto Rico",
    "Virgin Islands",
    "Canada",
    "Mexico",
    "American Samoa",
    "Guam",
    "Commonwealth of the Northern Marianas Islands",
    "Foreign Countries (exceptions: Canada and Mexico)"
  )
)

#' @autoglobal
#' @noRd
state_codes <- kit::psort(unlist_(STATE_CODE_LIST), nThread = 4L)
