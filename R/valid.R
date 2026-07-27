#' @noRd
is_valid_state <- function(x) {
  vctrs::vec_in(substring(x, 1L, 2L), ccn::states$code)
}

#' @noRd
is_valid_medicare <- function(x) {
  is_valid_state(x) & is_type_medicare(x)
}

#' @noRd
is_valid_medicaid <- function(x) {
  is_valid_state(x) & is_type_medicaid(x) & is_numeric(substring(x, 4L, 6L))
}

#' @noRd
is_valid_emergency <- function(x) {
  is_valid_state(x) & is_numeric(substring(x, 3L, 5L)) & is_type_emergency(x)
}

#' @noRd
is_valid_organ <- function(x) {
  is_valid_state(x) & is_type_organ(x) & is_numeric(substring(x, 4L, 6L))
}

#' @noRd
is_valid_supplier <- function(x) {
  is_valid_state(x) & is_type_supplier(x) & is_numeric(substring(x, 4L, 10L))
}

#' @noRd
is_valid_unit <- function(x) {
  is_valid_state(x) & is_type_unit(x) & is_numeric(substring(x, 5L, 6L))
}

#' @noRd
is_valid_subunit <- function(x) {
  is_valid_state(x) & is_type_subunit(x) & is_numeric(substring(x, 5L, 6L))
}
