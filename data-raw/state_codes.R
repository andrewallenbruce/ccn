## code to prepare `state_codes` dataset goes here

state_codes <- tibble::tibble(
  code = c(
    "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",
    "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25",
    "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38",
    "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51",
    "52", "53", "54", "55", "56", "57", "58", "59", "64", "65", "66", "67", "68",
    "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81",
    "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94",
    "95", "96", "97", "99", "A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8",
    "A9", "B0", "B1", "B2"
  ),
  abbr = c(
    "AZ", "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI",
    "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS",
    "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR",
    "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV",
    "WI", "WY", "ID", "CA", "CN", "NY", "WV", "MX", "AS", "GU", "CNMI", "TX",
    "FL", "FL", "KS", "LA", "OH", "PA", "TX", "CA", "IA", "MN", "IL", "MO", "MD",
    "CT", "MA", "NJ", "PR", "GA", "NC", "SC", "TN", "AR", "OK", "CO", "CA", "OR",
    "WA", "LA", "NM", "TX", "FC", "CA", "CA", "FL", "LA", "MI", "MS", "OH", "PA",
    "TN", "TX", "KY", "WV", "CA"
  ),
  name = c(
    "Arizona", "Alabama", "Alaska", "Arizona", "Arkansas", "California",
    "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida",
    "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
    "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
    "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
    "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
    "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico",
    "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
    "Utah", "Vermont", "Virgin Islands", "Virginia", "Washington",
    "West Virginia", "Wisconsin", "Wyoming", "Idaho", "California", "Canada",
    "New York", "West Virginia", "Mexico", "American Samoa", "Guam",
    "Commonwealth of the Northern Marianas Islands", "Texas", "Florida",
    "Florida", "Kansas", "Louisiana", "Ohio", "Pennsylvania", "Texas",
    "California", "Iowa", "Minnesota", "Illinois", "Missouri", "Maryland",
    "Connecticut", "Massachusetts", "New Jersey", "Puerto Rico", "Georgia",
    "North Carolina", "South Carolina", "Tennessee", "Arkansas", "Oklahoma",
    "Colorado", "California", "Oregon", "Washington", "Louisiana", "New Mexico",
    "Texas", "Foreign Countries (exceptions: Canada and Mexico)", "California",
    "California", "Florida", "Louisiana", "Michigan", "Mississippi", "Ohio",
    "Pennsylvania", "Tennessee", "Texas", "Kentucky", "West Virginia",
    "California"
  )
)

usethis::use_data(state_codes, overwrite = TRUE)
