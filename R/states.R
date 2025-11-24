#' State Codes
#'
#' @description
#' Convert state codes to their abbreviations or full names.
#'
#' @param x character vector of state codes to look up.
#' @name states
#' @returns character vector of names associated with codes.
#' @examples
#' state("A5XXX")
#' state_code(c("A5XXX", "14XXXXX"))
#'
#'
#' (x <- sample(ccn::ccn_state_codes$state_code, 5L))
#'
#' is_state_code(x)
#'
#' state_code_to_abbr(x)
#'
#' (x <- state_abbr(x))
#'
#' state_name(x)
NULL

#' @rdname states
#' @export
is_state_code <- function(x) {
  x %in_% ccn::ccn_state_codes$state_code
}

#' @rdname states
#' @export
state_code <- function(x) {
  substr_(x, c(1L, 2L))
}

#' @rdname states
#' @export
state_code_to_abbr <- function(x) {
  vctrs::vec_recode_values(
    x,
    from    = ccn::ccn_state_codes$state_code,
    to      = ccn::ccn_state_codes$state_abbr,
    default = NA_character_)
}

#' @rdname states
#' @export
state_abbr_to_name <- function(x) {
  vctrs::vec_recode_values(
    x,
    from    = ccn::ccn_state_codes$state_abbr,
    to      = ccn::ccn_state_codes$state_name,
    default = NA_character_)
}

#' @rdname states
#' @export
state_abbr <- function(x) {
  cheapr::case(
    x == "01"                                           ~ "AL",
    x == "02"                                           ~ "AK",
    x == "08"                                           ~ "DE",
    x == "09"                                           ~ "DC",
    x == "12"                                           ~ "HI",
    x == "15"                                           ~ "IN",
    x == "20"                                           ~ "ME",
    x == "27"                                           ~ "MT",
    x == "28"                                           ~ "NE",
    x == "29"                                           ~ "NV",
    x == "30"                                           ~ "NH",
    x == "35"                                           ~ "ND",
    x == "41"                                           ~ "RI",
    x == "43"                                           ~ "SD",
    x == "46"                                           ~ "UT",
    x == "47"                                           ~ "VT",
    x == "48"                                           ~ "VI",
    x == "49"                                           ~ "VA",
    x == "52"                                           ~ "WI",
    x == "53"                                           ~ "WY",
    x == "56"                                           ~ "CN",
    x == "59"                                           ~ "MX",
    x == "64"                                           ~ "AS",
    x == "65"                                           ~ "GU",
    x == "66"                                           ~ "CNMI",
    x == "99"                                           ~ "FC",
    x %in_% c("00", "03")                               ~ "AZ",
    x %in_% c("04", "89")                               ~ "AR",
    x %in_% c("06", "91")                               ~ "CO",
    x %in_% c("07", "81")                               ~ "CT",
    x %in_% c("11", "85")                               ~ "GA",
    x %in_% c("13", "54")                               ~ "ID",
    x %in_% c("14", "78")                               ~ "IL",
    x %in_% c("16", "76")                               ~ "IA",
    x %in_% c("17", "70")                               ~ "KS",
    x %in_% c("18", "B0")                               ~ "KY",
    x %in_% c("21", "80")                               ~ "MD",
    x %in_% c("22", "82")                               ~ "MA",
    x %in_% c("23", "A4")                               ~ "MI",
    x %in_% c("24", "77")                               ~ "MN",
    x %in_% c("25", "A5")                               ~ "MS",
    x %in_% c("26", "79")                               ~ "MO",
    x %in_% c("31", "83")                               ~ "NJ",
    x %in_% c("32", "96")                               ~ "NM",
    x %in_% c("33", "57")                               ~ "NY",
    x %in_% c("34", "86")                               ~ "NC",
    x %in_% c("37", "90")                               ~ "OK",
    x %in_% c("38", "93")                               ~ "OR",
    x %in_% c("40", "84")                               ~ "PR",
    x %in_% c("42", "87")                               ~ "SC",
    x %in_% c("50", "94")                               ~ "WA",
    x %in_% c("36", "72", "A6")                         ~ "OH",
    x %in_% c("39", "73", "A7")                         ~ "PA",
    x %in_% c("44", "88", "A8")                         ~ "TN",
    x %in_% c("51", "58", "B1")                         ~ "WV",
    x %in_% c("10", "68", "69", "A2")                   ~ "FL",
    x %in_% c("19", "71", "95", "A3")                   ~ "LA",
    x %in_% c("45", "67", "74", "97", "A9")             ~ "TX",
    x %in_% c("05", "55", "75", "92", "A0", "A1", "B2") ~ "CA",
    .default = NA_character_
  )
}

#' @rdname states
#' @export
state_name <- function(x) {
  cheapr::val_match(
    x,
    "AK"   ~ "Alaska",
    "AL"   ~ "Alabama",
    "AR"   ~ "Arkansas",
    "AS"   ~ "American Samoa",
    "AZ"   ~ "Arizona",
    "CA"   ~ "California",
    "CN"   ~ "Canada",
    "CNMI" ~ "Commonwealth of the Northern Marianas Islands",
    "CO"   ~ "Colorado",
    "CT"   ~ "Connecticut",
    "DC"   ~ "District of Columbia",
    "DE"   ~ "Delaware",
    "FC"   ~ "Foreign Country (except: Canada & Mexico)",
    "FL"   ~ "Florida",
    "GA"   ~ "Georgia",
    "GU"   ~ "Guam",
    "HI"   ~ "Hawaii",
    "IA"   ~ "Iowa",
    "ID"   ~ "Idaho",
    "IL"   ~ "Illinois",
    "IN"   ~ "Indiana",
    "KS"   ~ "Kansas",
    "KY"   ~ "Kentucky",
    "LA"   ~ "Louisiana",
    "MA"   ~ "Maine",
    "MD"   ~ "Maryland",
    "ME"   ~ "Massachusetts",
    "MI"   ~ "Minnesota",
    "MN"   ~ "Michigan",
    "MO"   ~ "Missouri",
    "MS"   ~ "Mississippi",
    "MT"   ~ "Montana",
    "MX"   ~ "Mexico",
    "NC"   ~ "North Carolina",
    "ND"   ~ "North Dakota",
    "NE"   ~ "Nebraska",
    "NH"   ~ "New Hampshire",
    "NJ"   ~ "New Jersey",
    "NM"   ~ "New Mexico",
    "NV"   ~ "Nevada",
    "NY"   ~ "New York",
    "OH"   ~ "Ohio",
    "OK"   ~ "Oklahoma",
    "OR"   ~ "Oregon",
    "PA"   ~ "Pennsylvania",
    "PR"   ~ "Puerto Rico",
    "RI"   ~ "Rhode Island",
    "SC"   ~ "South Carolina",
    "SD"   ~ "South Dakota",
    "TN"   ~ "Tennessee",
    "TX"   ~ "Texas",
    "UT"   ~ "Utah",
    "VA"   ~ "Virginia",
    "VI"   ~ "Virgin Islands",
    "VT"   ~ "Vermont",
    "WA"   ~ "Washington",
    "WI"   ~ "Wisconsin",
    "WV"   ~ "West Virginia",
    "WY"   ~ "Wyoming",
    .default = NA_character_
  )
}

#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        state_code_to_abbr(self@code)
    ),
    name = S7::new_property(
      S7::class_character,
      getter = function(self)
        state_abbr_to_name(self@abbr)
    )
  )
)

#' @rdname states
#' @export
state <- function(x) {
  State(code = state_code(x))
}
