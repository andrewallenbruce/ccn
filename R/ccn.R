#' @noRd
convert_provider <- function(x) {
  convert(
    x,
    Provider,
    ccn        = x@std,
    state_code = x@vec[1:2])
}

#' @noRd
convert_medicare <- function(x) {
  convert(
    x,
    MedicareProvider,
    sequence_number = x@vec[3:6])
}

#' @noRd
convert_opo <- function(x) {
  convert(
    x,
    MedicareOPO,
    facility_type   = x@vec[3],
    sequence_number = x@vec[4:6])
}

#' @noRd
convert_emergency <- function(x) {
  convert(
    x,
    EmergencyHospital,
    sequence_number = x@vec[3:5],
    emergency_type  = x@vec[6]
  )
}

#' @noRd
convert_medicaid <- function(x) {
  convert(
    x,
    MedicaidOnlyProvider,
    facility_type   = x@vec[3],
    sequence_number = x@vec[4:6]
  )
}

#' @noRd
convert_excluded <- function(x) {
  convert(
    x,
    IPPSExcludedProvider,
    facility_type   = x@vec[3],
    parent_ccn      = c(x@vec[1:2], "0", x@vec[4:6]),
    sequence_number = x@vec[4:6]
  )
}

#' @noRd
convert_supplier <- function(x, cls, ...) {
  convert(
    x,
    Supplier,
    ccn             = x@std,
    state_code      = x@vec[1:2],
    supplier_type   = x@vec[3],
    sequence_number = x@vec[4:10]
  )
}

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
    x <- convert_provider(x)

    if (is_numeric(          x@std)) return(convert_medicare(x))
    if (is_opo_type(      x@vec[3])) return(convert_opo(x))
    if (is_emergency_type(x@vec[6])) return(convert_emergency(x))
    if (is_medicaid_type( x@vec[3])) return(convert_medicaid(x))
    if (is_excluded_type( x@vec[3])) return(convert_excluded(x))

    return(x)
  }

  if (x@chr == 10L && is_supplier_type(x@vec[3])) {
    return(convert_supplier(x))
  }
  x
}
