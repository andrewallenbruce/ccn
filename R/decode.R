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
  x <- RawCCN(raw = x)

  if (x@chr == 6L) {
    if (all_numeric(x@std) || x@vec[3] == "P") {
      return(decode(x, MedicareProviderCCN()))
    }
    if (is_emergency_hospital_type(x@vec[6])) {
      return(decode(x, EmergencyHospitalCCN()))
    }
    return(decode(x, ProviderCCN()))
  }

  if (x@chr == 10L && is_supplier_type(x@vec[3])) {
    return(decode(x, SupplierCCN()))
  }
  x
}

#' @noRd
#' @autoglobal
decode <- S7::new_generic("decode", c("x", "y"), function(x, y) {
  S7::S7_dispatch()
})

S7::method(decode, list(RawCCN, ProviderCCN)) <- function(x, y) {
  ProviderCCN(
    ccn = x@std,
    state_code = string(x@vec[1:2]),
    sequence_number = string(x@vec[3:6])
  )
}

S7::method(decode, list(RawCCN, SupplierCCN)) <- function(x, y) {
  SupplierCCN(
    ccn = x@std,
    state_code = string(x@vec[1:2]),
    sequence_number = string(x@vec[3:10])
  )
}

S7::method(decode, list(RawCCN, MedicareProviderCCN)) <- function(x, y) {
  MedicareProviderCCN(
    ccn = x@std,
    state_code = string(x@vec[1:2]),
    sequence_number = string(if (x@vec[3] == "P") {
      x@vec[4:6]
    } else {
      x@vec[3:6]
    })
  )
}

S7::method(decode, list(RawCCN, EmergencyHospitalCCN)) <- function(x, y) {
  EmergencyHospitalCCN(
    ccn = x@std,
    state_code = string(x@vec[1:2]),
    sequence_number = string(x@vec[3:5])
  )
}
