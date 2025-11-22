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
  cheapr::case(
    is_numeric(x) ~ "medicare",
    is_type_opo(substr_(x, 3L)) ~ "opo",
    is_type_emergency(substr_(x, 6L)) ~ "emergency",
    is_type_medicaid_only(substr_(x, 3L)) ~ "medicaid",
    is_type_ipps_excluded(substr_(x, 3L)) ~ "excluded",
    .default = NA_character_
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
