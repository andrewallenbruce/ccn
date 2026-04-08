#' @noRd
clean_ccn <- function(x) {
  remove_any_spaces(remove_non_alnums(toupper(x)))
}

#' @noRd
ccn_nchar <- function(x) {
  (nchar(x) - 6L) * (14L - nchar(x)) >= 0L
}

#' @noRd
provider_nchar <- function(x) {
  nchar(x) == 6L
}

#' @noRd
provext_nchar <- function(x) {
  (nchar(x) - 7L) * (9L - nchar(x)) >= 0L
}

#' @noRd
supplier_nchar <- function(x) {
  nchar(x) == 10L
}

#' @noRd
suppext_nchar <- function(x) {
  (nchar(x) - 11L) * (14L - nchar(x)) >= 0L
}

# TYPES
#' @noRd
medicare_ <- function(x) {
  is_numeric(substring(x, 3L, 6L))
}

#' @noRd
organ_ <- function(x) {
  substring(x, 3L, 3L) == "P"
}

#' @noRd
emergency_ <- function(x) {
  substring(x, 6L, 6L) %in% c("E", "F")
}

#' @noRd
medicaid_ <- function(x) {
  substring(x, 3L, 3L) %in% c("A", "B", "E", "F", "G", "H", "J", "K", "L")
}

#' @noRd
unit__ <- function(x) {
  substring(x, 3L, 3L) %in% c("M", "R", "S", "T", "U", "V", "W", "Y", "Z")
}


#' @noRd
unit_ <- function(x) {
  unit__(x) & is_numeric(substring(x, 4L, 4L))
}

#' @noRd
subunit_ <- function(x) {
  unit__(x) &
    substring(x, 4L, 4L) %in%
      c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K")
}

#' @noRd
supplier_ <- function(x) {
  x %in% c("C", "D", "X")
}

#' @noRd
moh_ <- function(x) {
  substring(x, 3L, 3L) == "J"
}

#' @noRd
eipps_type_ <- function(x) {
  x %in% c("M", "R", "S", "T", "V")
}

#' @noRd
eipps_range_ <- function(x) {
  x %in% ccn::eipps_ranges$range
}
