#' @include as.R
NULL

#' @noRd
is_provider <- function(x) {
  collapse::vlengths(x) == 6L ||
    collapse::vlengths(x) > 6L & collapse::vlengths(x) < 10L
}

#' @noRd
is_supplier <- function(x) {
  is_type_supplier(substr_(x, 3L)) &
    (
      collapse::vlengths(x) == 10L ||
        collapse::vlengths(x) > 10L & collapse::vlengths(x) < 15L
    )
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(x), "medicare",
    is_type_opo(substr_(x, 3L)), "opo",
    is_type_emergency(substr_(x, 6L)), "emergency",
    is_type_medicaid_only(substr_(x, 3L)), "medicaid",
    is_type_ipps_excluded(substr_(x, 3L)), "excluded",
    default = NA_character_
  )
}

#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#'
#' @return list of CCN components.
#'
#' @examples
#' ccn("670055") # Medicare Provider
#' ccn("05P001") # Medicare OPO
#' ccn("12345E") # Emergency Hospital
#' ccn("01L008") # Medicaid Only Provider
#'
#' ccn("210101")
#' ccn("21T101")
#' ccn("21S101")
#' ccn("21U101")
#'
#' ccn("10C0001062") # Supplier ASC
#' ccn("45D0634589") # Supplier CLIA
#' ccn("21X0009807") # Supplier Portable X-Ray
#'
#' ccn("02TA01") # IPPS Excluded Unit
#' ccn("04SD38")
#' ccn("52TA05")
#'
#' ccn("212026") # Parent
#' ccn("21SA26")
#' ccn("21TA26")
#'
#' ccn("24T019A")
#' ccn("33S23401")
#' ccn("330027001")
#' @export
ccn <- function(x) {
  x <- as_ccn(x)

  if (is_provider(x@number)) {
    return(switch(
      provider_type(x@number),
      medicare  = medicare_provider(x),
      opo       = medicare_opo(x),
      emergency = emergency_hospital(x),
      medicaid  = medicaid_only(x),
      excluded  = ipps_excluded(x),
      x
    ))
  }

  if (is_supplier(x@number)) {
    return(medicare_supplier(x))
  }
  return(x)
}
