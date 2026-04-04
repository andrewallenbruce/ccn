# Medicare


SS_NNNN <- \(x) substring(x, c(1L, 3L), c(2L, 6L))
SS_NNNT <- \(x) substring(x, c(1L, 3L, 6L), c(2L, 5L, 6L))
SS_TNNN <- \(x) substring(x, c(1L, 3L, 4L),  c(2L, 3L, 6L))
SS_TPNN <- \(x) substring(x, c(1L, 3L, 4L, 5L), c(2L, 3L, 4L, 6L))

purrr::map(c("670055", "670056"), form1) |>
  purrr::list_transpose() |>
  rlang::set_names(c("S", "N"))

# Provider: 670055 => 67 0055
c("670055", "670056") |>
  substring(
    c(1L, 3L),
    c(2L, 6L))
# SS|NNNN

# Emergency: 12345E => 12 345 E
"12345E" |>
  substring(
    c(1L, 3L, 6L),
    c(2L, 5L, 6L)
  )
# SS|NNN|T

# Organ: 05P001 => 05 P 001
"05P001" |>
  substring(
    c(1L, 3L, 4L),
    c(2L, 3L, 6L)
  )
# SS|T|NNN

# Medicaid-Only: 01L008 => 01 L 008
"01L008"
# SS|T|NNN

# Unit: 21T101 => 21 T 101
"21T101"
# SS|T|NNN

# Subunit: 02TA01 => 02 T A 01
"02TA01" |>
  substring(
    c(1L, 3L, 4L, 5L),
    c(2L, 3L, 4L, 6L)
  )
# SS|T|P|NN

# Supplier: 10C0001062 => 10 C 0001062
"10C0001062" |>
  substring(
    c(1L, 3L, 4L),
    c(2L, 3L, 10L)
  )
# SS|T|NNNNNNN


new_ccn_rcrd <- function(
    state = character(),
    type = character(),
    parent = character(),
    number = character(),
    extension = character()) {
  new_rcrd(
    list(
      S = state,
      T = type,
      P = parent,
      N = number,
      X = extension
      ),
    class = "ccn_rcrd")
}

format.ccn_rcrd <- function(x, ...) {
  state <- field(x, "S")
  type <- field(x, "T")
  parent <- field(x, "P")
  number <- field(x, "N")
  ext <- field(x, "X")

  out <- paste0(
    state,
    "/",
    vec_if_else(vec_detect_missing(type), "", paste0(type, "/")),
    vec_if_else(vec_detect_missing(parent), "", paste0(parent, "/")),
    number,
    vec_if_else(vec_detect_missing(ext), "", paste0("+", ext))
    )

  out[is.na(state) | is.na(number)] <- NA

  out
}


new_ccn_rcrd(
  state = c("67", "12", NA, "05", "21", "02", "10", "00"),
  type = c(NA, "E", NA, "P", "T", "T", "C", NA),
  number = c("0005", "345", NA, "001", "101", "01", "0001062", "0000"),
  parent = c(NA, NA, NA, NA, NA, "A", NA, NA),
  extension = c(NA, NA, NA, NA, NA, NA, NA, "A001")
)
