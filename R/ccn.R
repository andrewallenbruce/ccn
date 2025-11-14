#' @noRd
convert_provider <- function(x) {
  convert(x, Provider, state_code = x@vec[1:2])
}

#' @noRd
convert_medicare <- function(x) {
  convert(x, MedicareProvider, sequence_number = x@vec[3:6])
}

#' @noRd
convert_opo <- function(x) {
  convert(x,
          MedicareOPO,
          type_code = x@vec[3],
          sequence_number = x@vec[4:6])
}

#' @noRd
convert_emergency <- function(x) {
  convert(
    x,
    EmergencyHospital,
    sequence_number = x@vec[3:5],
    type_code = x@vec[6]
  )
}

#' @noRd
convert_medicaid <- function(x) {
  convert(
    x,
    MedicaidOnlyProvider,
    type_code = x@vec[3],
    sequence_number = x@vec[4:6]
  )
}

#' @noRd
convert_excluded <- function(x) {
  convert(
    x,
    IPPSExcludedProvider,
    type_code = x@vec[3],
    sequence_number = x@vec[4:6]
  )
}

#' @noRd
convert_parent <- function(x) {
  convert(
    x,
    IPPSExcludedUnit,
    type_code = x@vec[3],
    parent_code = x@vec[4],
    sequence_number = c(get_parent_prefix(x@vec[4]), x@vec[5:6])
  )
}

#' @noRd
convert_supplier <- function(x) {
  convert(
    x,
    Supplier,
    state_code = x@vec[1:2],
    type_code = x@vec[3],
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
#' ccn("01P001") # OPO
#' ccn("05P001") # OPO
#' ccn("670055")
#'
#' ccn("210101")
#' ccn("21T101")
#' ccn("21S101")
#' ccn("21U101")
#'
#' ccn("212026")
#' ccn("21SA26")
#' ccn("21TA26")
#'
#' ccn("01L008") # Medicaid Only Provider
#' ccn("12345E") # Emergency Hospital
#' ccn("10C0001062") # Supplier ASC
#' ccn("45D0634589") # Supplier CLIA
#' ccn("21X0009807") # Supplier Portable X-Ray
#'
#' # IPPS Excluded Units
#' ccn("02TA01")
#' ccn("04SD38")
#' ccn("52TA05")
#' @export
ccn <- function(x) {

  x <- new_unknown(x)

  if (x@chr == 6L) {
    x <- convert_provider(x)

    if (is_numeric(       x@ccn)) return(convert_medicare(x))
    if (type_opo(      x@vec[3])) return(convert_opo(x))
    if (type_emergency(x@vec[6])) return(convert_emergency(x))
    if (type_medicaid( x@vec[3])) return(convert_medicaid(x))

    if (type_excluded( x@vec[3])) {
      if (type_parent( x@vec[4])) return(convert_parent(x))
      return(convert_excluded(x))
    }

    return(x)
  }

  if (x@chr == 10L && type_supplier(x@vec[3])) {
    return(convert_supplier(x))
  }
  x
}
