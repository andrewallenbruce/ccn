#' @noRd
nchar_ccn <- function(x) {
  (nchar(x) - 6L) * (14L - nchar(x)) >= 0L
}

#' @noRd
nchar_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
nchar_provider_ext <- function(x) {
  (nchar(x) - 7L) * (9L - nchar(x)) >= 0L
}

#' @noRd
nchar_supplier <- function(x) {
  nchar(x) == 10L
}

#' @noRd
nchar_supplier_ext <- function(x) {
  (nchar(x) - 11L) * (14L - nchar(x)) >= 0L
}

#' @noRd
is_type_medicare <- function(x) {
  is_numeric(substring(x, 3L, 6L))
}

#' @noRd
is_type_medicaid <- function(x) {
  vctrs::vec_in(substring(x, 3L, 3L), ccn::medicaid_types[["code"]])
}

#' @noRd
is_type_medicaid_hospital <- function(x) {
  vctrs::vec_equal(substring(x, 3L, 3L), "J")
}

#' @noRd
is_type_emergency <- function(x) {
  vctrs::vec_in(substring(x, 6L, 6L), c("E", "F"))
}

#' @noRd
is_type_organ <- function(x) {
  vctrs::vec_equal(substring(x, 3L, 3L), "P")
}

#' @noRd
is_type_supplier <- function(x) {
  vctrs::vec_in(substring(x, 3L, 3L), c("C", "D", "X"))
}

#' @noRd
.is_unit <- function(x) {
  vctrs::vec_in(substring(x, 3L, 3L), ccn::unit_types[["code"]])
}

#' @noRd
is_type_unit <- function(x) {
  .is_unit(x) & is_numeric(substring(x, 4L, 4L))
}

#' @noRd
is_type_subunit <- function(x) {
  .is_unit(x) & vctrs::vec_in(substring(x, 4L, 4L), ccn::subunit_types[["code"]])
}

#' @noRd
is_type_eipps <- function(x) {
  vctrs::vec_in(x, ccn::eipps_types[["code"]])
}

#' @noRd
is_eipps_range <- function(x) {
  ivs::iv_between(x, ccn::eipps_ranges[["iv"]])
}
