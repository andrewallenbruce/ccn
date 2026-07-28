# Medicare: 670055 => 67 0055
#' @noRd
ccnr_Medicare <- function(x) {
  ccnr(
    entity = "Medicare",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 6L),
    type = NA_character_
  )
}

# Medicaid: 01L008 => 01 L 008
# Hospital: 01J008 => 01 J 008
#' @noRd
ccnr_Medicaid <- function(x) {
  ccnr(
    entity = "Medicaid",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L)
  )
}

# Emergency: 12345E => 12 345 E
#' @noRd
ccnr_Emergency <- function(x) {
  ccnr(
    entity = "Emergency",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 5L),
    type = substring(x, 6L, 6L)
  )
}

# Organ: 05P001 => 05 P 001
#' @noRd
ccnr_Organ <- function(x) {
  ccnr(
    entity = "Organ",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L)
  )
}

# Hospital Unit: 21T101 => 21 T 101
#' @noRd
ccnr_Unit <- function(x) {
  ccnr(
    entity = "Unit",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L)
  )
}

# Hospital Subunit: 02TA01 => 02 T A 01
#' @noRd
ccnr_Subunit <- function(x, ext = FALSE) {
  ccnr(
    entity = "Subunit",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 5L, 6L),
    type = substring(x, 3L, 4L)
  )
}

# Supplier: 10C0001062 => 10 C 0001062
#' @noRd
ccnr_Supplier <- function(x, ext = FALSE) {
  ccnr(
    entity = "Supplier",
    ccn = substring(x, 1L, 10L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 10L),
    type = substring(x, 3L, 3L)
  )
}
