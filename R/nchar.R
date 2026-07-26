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
