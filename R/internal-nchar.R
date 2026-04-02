#' @noRd
nchar_ccn <- function(x) {
  nchar(x) %between% c(6L, 14L)
}

#' @noRd
nchar_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
nchar_provider_ext <- function(x) {
  nchar(x) %between% c(7L, 9L)
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
ccn_by_nchar <- function(x) {
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
