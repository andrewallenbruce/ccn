#' @noRd
nchar_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
nchar_provider_ext <- function(x) {
  nchar(x) %between% c(7L, 9L)
}

#' @noRd
is_organ_type <- function(x) {
  x == "P"
}

#' @noRd
is_emergency_type <- function(x) {
  x %chin% c("E", "F")
}

#' @noRd
is_moh_type <- function(x) {
  x == "J"
}

#' @noRd
is_medicaid_type <- function(x) {
  x %chin% ccn::medicaid_types[["code"]]
}

#' @noRd
is_unit_type <- function(x) {
  x %chin% ccn::eipps_unit[["code"]]
}

#' @noRd
is_subunit_type <- function(x) {
  x %chin% ccn::eipps_subunit[["code"]]
}

#' @noRd
nchar_supplier <- function(x) {
  nchar(x) == 10L
}

#' @noRd
nchar_supplier_ext <- function(x) {
  nchar(x) %between% c(11L, 14L)
}

#' @noRd
is_supplier_type <- function(x) {
  x %chin% c("C", "D", "X")
}

#' @noRd
is_state_code <- function(x) {
  x %chin% ccn::state_codes[["code"]]
}

#' @noRd
ccn_type <- function(x) {
  kit::nif(
    nchar_provider(x),
    "provider",
    nchar_provider_ext(x),
    "provider_ext",
    nchar_supplier(x),
    "supplier",
    nchar_supplier_ext(x),
    "supplier_ext",
    default = NA_character_
  )
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(substring(x, 1L, 6L)),
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
