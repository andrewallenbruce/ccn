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
#' @autoglobal
ccn <- function(x) {

  x <- Unknown(x)

  if (x@chr == 6L) {
    x <- S7::convert(x, to = Provider)

    if (is_numeric(          x@std)) return(decode(x, MedicareProvider()))
    if (is_opo_type(      x@vec[3])) return(decode(x, MedicareProviderOPO()))
    if (is_emergency_type(x@vec[6])) return(decode(x, EmergencyHospital()))
    if (is_medicaid_type( x@vec[3])) return(decode(x, MedicaidOnlyProvider()))
    if (is_excluded_type( x@vec[3])) return(decode(x, IPPSExcludedProvider()))

    return(decode(x, Provider()))
  }

  if (x@chr == 10L && is_supplier_type(x@vec[3])) {
    return(decode(x, Supplier()))
  }
  x
}

#' @noRd
#' @autoglobal
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
    parent_type     = x@vec[4:5],
    sequence_number = x@vec[4:6]
  )
}

# S7::method(decode, list(Unknown, Provider)) <- function(x, y) {
#   Provider(
#     ccn             = x@std,
#     state_code      = x@vec[1:2],
#     sequence_number = x@vec[3:6]
#   )
# }
