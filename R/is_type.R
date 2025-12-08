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
is_sub_type <- function(x) {
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
