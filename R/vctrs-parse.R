# Provider: 670055 => 67 0055
#' @noRd
ccnr_care <- function(x, ext = FALSE) {
  ccnr(
    form = "care",
    ccn = if (ext) substring(x, 1L, 6L) else x,
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 6L),
    type = NA_character_,
    parent = NA_character_,
    ext = if (ext) substring(x, first = 7L) else NA_character_
  )
}

# Medicaid: 01L008 => 01 L 008
#' @noRd
ccnr_caid <- function(x, ext = FALSE) {
  ccnr(
    form = "caid",
    ccn = if (ext) substring(x, 1L, 6L) else x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substr_(x, 3L),
    parent = NA_character_,
    ext = if (ext) substring(x, first = 7L) else NA_character_
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
    type = substr_(x, 6L),
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
    type = substr_(x, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

# Unit: 21T101 => 21 T 101
#' @noRd
ccnr_unit <- function(x, ext = FALSE) {
  ccnr(
    form = "unit",
    ccn = if (ext) substring(x, 1L, 6L) else x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substr_(x, 3L),
    parent = NA_character_,
    ext = if (ext) substring(x, first = 7L) else NA_character_
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
    type = substr_(x, 3L),
    parent = substr_(x, 4L),
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
    type = substr_(x, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}
