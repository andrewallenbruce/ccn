#' @noRd
clean_ccn <- function(x) {
  remove_any_spaces(remove_non_alnums(toupper(x)))
}

#' @noRd
nchar_ccn <- function(x) {
  (nchar(x) - 6L) * (14L - nchar(x)) >= 0L
}

#' @noRd
nchar_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
nchar_provext <- function(x) {
  (nchar(x) - 7L) * (9L - nchar(x)) >= 0L
}

#' @noRd
nchar_supplier <- function(x) {
  nchar(x) == 10L
}

#' @noRd
nchar_suppext <- function(x) {
  (nchar(x) - 11L) * (14L - nchar(x)) >= 0L
}

# TYPES
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
type_moh__ <- function(x) {
  substr_(x, 3L) == "J"
}

#' @noRd
eipps_type__ <- function(x) {
  x %in% c("M", "R", "S", "T", "V")
}

#' @noRd
eipps_range__ <- function(x) {
  x %in% ccn::eipps_ranges$range
}

#' @noRd
is_erh <- function(x) {
  is_numeric(substring(x, 3L, 5L)) & type_erh(x)
}
