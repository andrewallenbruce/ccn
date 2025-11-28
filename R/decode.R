#' @include as.R
NULL

#' @noRd
is_provider <- function(x) {
  nchar(x) == 6L || nchar(x) > 6L & nchar(x) < 10L
}

#' @noRd
provider_type <- function(x) {
  cheapr::case(
    is_numeric(x) ~ "medicare",
    is_type_opo(substr_(x, 3L)) ~ "opo",
    is_type_emergency(substr_(x, 6L)) ~ "emergency",
    is_type_medicaid_only(substr_(x, 3L)) ~ "medicaid",
    is_type_excluded(substr_(x, 3L)) ~ "excluded",
    .default = NA_character_
  )
}

#' @noRd
as_ccn <- function(x) {
  CCN(ccn = clean(x), state = state(x))
}

#' Decode CMS Certification Numbers (CCNs)
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#'
#' @return list of CCN components.
#'
#' @examples
#' decode("670055") # Medicare Provider
#' decode("05P001") # Medicare OPO
#' decode("12345E") # Emergency Hospital
#' decode("01L008") # Medicaid Only Provider
#'
#' decode("210101")
#' decode("21T101")
#' decode("21S101")
#' decode("21U101")
#'
#' decode("10C0001062") # Supplier ASC
#' decode("45D0634589") # Supplier CLIA
#' decode("21X0009807") # Supplier Portable X-Ray
#'
#' decode("02TA01") # IPPS Excluded Unit
#' decode("04SD38")
#' decode("52TA05")
#'
#' decode("212026") # Parent
#' decode("21SA26")
#' decode("21TA26")
#'
#' decode("24T019A")
#' decode("33S23401")
#' decode("330027001")
#' @export
decode <- function(x) {
  x <- as_ccn(x)

  if (is_provider(x@ccn)) {
    return(switch(
      provider_type(x@ccn),
      medicare  = as_medicare(x),
      opo       = as_medicare_opo(x),
      emergency = as_emergency(x),
      medicaid  = as_medicaid_only(x),
      excluded  = as_excluded(x),
      x
    ))
  }

  if (is_supplier(x@ccn)) {
    return(as_supplier(x))
  }
  return(x)
}
