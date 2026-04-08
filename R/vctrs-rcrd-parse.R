# Provider: 670055 => 67 0055
#' @noRd
ccnr_care <- function(x) {
  ccnr(
    form = "care",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 6L),
    type = NA_character_,
    parent = NA_character_,
    ext = NA_character_
  )
}

#' @noRd
ccnr_care_ext <- function(x) {
  ccnr(
    form = "care",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 6L),
    type = NA_character_,
    parent = NA_character_,
    ext = substring(x, first = 7L)
  )
}

# Emergency: 12345E => 12 345 E
#' @noRd
ccnr_erh <- function(x) {
  ccnr(
    form = "erh",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 5L),
    type = substring(x, 6L, 6L),
    parent = NA_character_,
    ext = NA_character_
  )
}

# Organ: 05P001 => 05 P 001
#' @noRd
ccnr_opo <- function(x) {
  ccnr(
    form = "opo",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

# Medicaid: 01L008 => 01 L 008
#' @noRd
ccnr_caid <- function(x) {
  ccnr(
    form = "caid",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

#' @noRd
ccnr_caid_ext <- function(x) {
  ccnr(
    form = "caid",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = substring(x, first = 7L)
  )
}

# Unit: 21T101 => 21 T 101
#' @noRd
ccnr_unit <- function(x) {
  ccnr(
    form = "unit",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

#' @noRd
ccnr_unit_ext <- function(x) {
  ccnr(
    form = "unit",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = substring(x, first = 7L)
  )
}

# Subunit: 02TA01 => 02 T A 01
#' @noRd
ccnr_sub <- function(x) {
  ccnr(
    form = "sub",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 5L, 6L),
    type = substring(x, 3L, 3L),
    parent = substring(x, 4L, 4L),
    ext = NA_character_
  )
}

# Supplier: 10C0001062 => 10 C 0001062
#' @noRd
ccnr_supp <- function(x) {
  ccnr(
    form = "supp",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 10L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}
