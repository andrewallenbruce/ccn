#' @include as-convert.R
NULL

#' @noRd
is_state_code <- function(x) {
  x %in% ccn::state_codes$code
}

#' @noRd
is_provider_nchar <- function(x) {
  nchar(x) == 6L
}

#' @noRd
is_provider_ext_nchar <- function(x) {
  nchar(x) > 6L & nchar(x) < 10L
}

#' @noRd
is_supplier_nchar <- function(x) {
  nchar(x) == 10L
}

#' @noRd
is_supplier_type <- function(x) {
  x %in% c("C", "D", "X")
}

#' @noRd
is_supplier_ext_nchar <- function(x) {
  nchar(x) > 10L & nchar(x) < 15L
}

#' @noRd
is_opo_type <- function(x) {
  x == "P"
}

#' @noRd
is_emergency_type <- function(x) {
  x %in% c("E", "F")
}

#' @noRd
is_mo_hospital_type <- function(x) {
  x == "J"
}

#' @noRd
is_mo_facility_type <- function(x) {
  x %in% ccn::medicaid_only_facility_types$code
}

#' @noRd
is_ipps_excluded_unit_type <- function(x) {
  x %in% c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K")
}

#' @noRd
is_ipps_excluded_type <- function(x) {
  x %in% c("M", "R", "S", "T", "U", "W", "Y", "Z")
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(x), "medicare",
    is_opo_type(substr_(x, 3L)), "opo",
    is_emergency_type(substr_(x, 6L)), "emergency",
    is_mo_facility_type(substr_(x, 3L)), "medicaid_facility",
    is_mo_hospital_type(substr_(x, 3L)), "medicaid_hospital",
    is_ipps_excluded_type(substr_(x, 3L)), "excluded",
    default = NA_character_
  )
}

# @noRd
# as_ccn_provider <- function(x) {
#   CCN(ccn = substr_(x, c(1L, 6L)),
#       state = State(code = substr_(x, c(1L, 2L))),
#       extension = substr_(x, c(7L, nchar(x)))
#       )
# }

# @noRd
# as_ccn_supplier <- function(x) {
#   CCN(ccn = substr_(x, c(1L, 10L)),
#       state = State(code = substr_(x, c(1L, 2L))),
#       extension = substr_(x, c(11L, nchar(x))))
# }

#' Decode CMS Certification Numbers (CCNs)
#'
#' Decode a CCN into its component parts.
#'
# @param x character vector of CCNs.
#'
# @return list of CCN components.
#'
# @examplesIf FALSE
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
# @noRd
# decode <- function(x) {
#   x <- clean(x)
#
#   if (is_provider_nchar(x)) {
#     return(switch(
#       provider_type(x@ccn),
#       medicare  = as_medicare(x),
#       opo       = as_medicare_opo(x),
#       emergency = as_emergency(x),
#       medicaid  = as_medicaid_only(x),
#       excluded  = as_excluded(x),
#       x
#     ))
#   }
#
#   if (is_supplier_nchar(x) & is_supplier_type(x)) {
#     return(as_supplier(x))
#   }
#   return(x)
# }
