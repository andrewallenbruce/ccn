#' @noRd
type_care <- function(x) {
  is_numeric(substring(x, 3L, 6L))
}

#' @noRd
type_opo <- function(x) {
  substr_(x, 3L) == "P"
}

#' @noRd
type_erh <- function(x) {
  grepl("[EF]", substr_(x, 6L), perl = TRUE)
}

#' @noRd
type_caid <- function(x) {
  grepl("[ABEFGHJKL]", substr_(x, 3L), perl = TRUE)
}

#' @noRd
unit__ <- function(x) {
  grepl("[MRSTUVWYZ]", substr_(x, 3L), perl = TRUE)
}

#' @noRd
type_unit <- function(x) {
  unit__(x) & is_numeric(substr_(x, 4L))
}

#' @noRd
type_sub <- function(x) {
  unit__(x) & grepl("[ABCDEFGHJK]", substr_(x, 4L), perl = TRUE)
}

#' @noRd
type_supplier <- function(x) {
  grepl("[CDX]", substr_(x, 3L), perl = TRUE)
}

#' @noRd
is_type_moh <- function(x) {
  substr_(x, 3L) == "J"
}

#' @noRd
is_eipps_type <- function(x) {
  vctrs::vec_in(x, ccn::eipps_types$code)
}

#' @noRd
is_eipps_range <- function(x) {
  ivs::iv_between(x, ccn::eipps_ranges$iv)
}

#' @noRd
is_erh <- function(x) {
  is_numeric(substring(x, 3L, 5L)) & type_erh(x)
}
