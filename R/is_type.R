#' @noRd
is_state_code <- function(x) {
  x %in% ccn::state_codes$code
}

#' @noRd
is_provider_nchar <- function(x) {
  nchar(x) == 6L
}

#' @noRd
is_provider_ext_nchar <- function(x) {
  nchar(x) > 6L & nchar(x) < 10L
}

#' @noRd
is_supplier_nchar <- function(x) {
  nchar(x) == 10L
}

#' @noRd
is_supplier_type <- function(x) {
  x %in% c("C", "D", "X")
}

#' @noRd
is_supplier_ext_nchar <- function(x) {
  nchar(x) > 10L & nchar(x) < 15L
}

#' @noRd
is_opo_type <- function(x) {
  x == "P"
}

#' @noRd
is_emergency_type <- function(x) {
  x %in% c("E", "F")
}

#' @noRd
is_mo_hospital_type <- function(x) {
  x == "J"
}

#' @noRd
is_mo_facility_type <- function(x) {
  x %in% ccn::medicaid_only_facility_types$code
}

#' @noRd
is_ipps_excluded_unit_type <- function(x) {
  x %in% c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K")
}

#' @noRd
is_ipps_excluded_type <- function(x) {
  x %in% c("M", "R", "S", "T", "U", "W", "Y", "Z")
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(x), "medicare",
    is_opo_type(substr_(x, 3L)), "opo",
    is_emergency_type(substr_(x, 6L)), "emergency",
    is_mo_facility_type(substr_(x, 3L)), "medicaid_facility",
    is_mo_hospital_type(substr_(x, 3L)), "medicaid_hospital",
    is_ipps_excluded_type(substr_(x, 3L)), "excluded",
    default = NA_character_
  )
}
