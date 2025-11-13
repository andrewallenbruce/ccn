#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#' @return list of CCN components.
#' @examples
#' ccn("67P055")
#' ccn("670055")
#' ccn("21-0101")
#' ccn("21-T101")
#' ccn("12345E")
#' ccn("12C4567890")
#' ccn("0-12C4567890")
#' @export
ccn <- function(x) {

  x <- new_unknown(x)

  if (x@chr == 6L) {
    x <- convert(x, to = Provider, ccn = x@std, state_code = x@vec[1:2])

    if (is_numeric(          x@std)) return(convert(x, MedicareProvider, sequence_number = x@vec[3:6]))
    if (is_opo_type(      x@vec[3])) return(convert(x, MedicareProviderOPO, sequence_number = x@vec[4:6]))
    if (is_emergency_type(x@vec[6])) return(convert(x, EmergencyHospital, sequence_number = x@vec[3:5], emergency_type = x@vec[6]))
    if (is_medicaid_type( x@vec[3])) return(convert(x, MedicaidOnlyProvider, facility_type = x@vec[3], sequence_number = x@vec[4:6]))
    if (is_excluded_type( x@vec[3])) return(convert(x, IPPSExcludedProvider, facility_type = x@vec[3], sequence_number = x@vec[4:6]))

    return(x)
  }

  if (x@chr == 10L && is_supplier_type(x@vec[3])) {
    return(convert(x, Supplier, state_code = x@vec[1:2], supplier_type = x@vec[3], sequence_number = x@vec[4:10]))
  }
  x
}

#' @noRd
decode <- S7::new_generic("decode", c("x", "y"), function(x, y) {
  S7::S7_dispatch()
})

S7::method(decode, list(Unknown, Supplier)) <- function(x, y) {
  Supplier(
    ccn             = x@std,
    state_code      = x@vec[1:2],
    sequence_number = x@vec[4:10],
    supplier_type   = x@vec[3]
  )
}

S7::method(decode, list(Provider, MedicareProvider)) <- function(x, y) {
  MedicareProvider(
    ccn             = x@std,
    state_code      = x@vec[1:2],
    sequence_number = x@vec[3:6]
  )
}

S7::method(decode, list(Provider, MedicareProviderOPO)) <- function(x, y) {
  MedicareProviderOPO(
    ccn             = x@std,
    state_code      = x@vec[1:2],
    sequence_number = x@vec[4:6]
  )
}

S7::method(decode, list(Provider, EmergencyHospital)) <- function(x, y) {
  EmergencyHospital(
    ccn             = x@std,
    state_code      = x@vec[1:2],
    sequence_number = x@vec[3:5],
    emergency_type  = x@vec[6]
  )
}

S7::method(decode, list(Provider, MedicaidOnlyProvider)) <- function(x, y) {
  MedicaidOnlyProvider(
    ccn             = x@std,
    state_code      = x@vec[1:2],
    facility_type   = x@vec[3],
    sequence_number = x@vec[4:6]
  )
}

S7::method(decode, list(Provider, IPPSExcludedProvider)) <- function(x, y) {
  IPPSExcludedProvider(
    ccn             = x@std,
    state_code      = x@vec[1:2],
    facility_type   = x@vec[3],
    parent_ccn      = c(x@vec[1:2], "0", x@vec[4:6]),
    sequence_number = x@vec[4:6]
  )
}
