#' @noRd
is_organ_type <- function(x) {
  x == "P"
}

#' @noRd
is_emergency_type <- function(x) {
  x %in% c("E", "F")
}

#' @noRd
is_moh_type <- function(x) {
  x == "J"
}

#' @noRd
is_medicaid_type <- function(x) {
  x %in% ccn::medicaid_types$code
}

#' @noRd
is_unit_type <- function(x) {
  x %in% ccn::unit_types$code
}

#' @noRd
is_subunit_type <- function(x) {
  x %in% ccn::subunit_types$code
}

#' @noRd
is_eipps_type <- function(x) {
  x %in% ccn::eipps_types$code
}

#' @noRd
is_eipps_range <- function(x) {
  x %in% ccn::eipps_ranges$range
}

#' @noRd
is_supplier_type <- function(x) {
  x %in% c("C", "D", "X")
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(substring(x, 3L, 6L)),
    "medicare",
    is_organ_type(substring(x, 3L, 3L)),
    "organ",
    is_emergency_type(substring(x, 6L, 6L)),
    "emergency",
    is_medicaid_type(substring(x, 3L, 3L)),
    "medicaid",
    is_unit_type(substring(x, 3L, 3L)) & is_numeric(substring(x, 4L, 4L)),
    "unit",
    is_unit_type(substring(x, 3L, 3L)) & is_subunit_type(substring(x, 4L, 4L)),
    "subunit",
    default = NA_character_
  )
}
