#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#' @return list of CCN components.
#' @examples
#' decode("67P055")
#' decode("670055")
#' decode("21-0101")
#' decode("21-T101")
#' decode("12345E")
#' decode("12C4567890")
#' decode("0-12C4567890")
#' @export
#' @autoglobal
decode <- S7::new_generic("decode", "x", function(x) {
  S7::S7_dispatch()
})

#' @autoglobal
S7::method(convert, list(RawCCN, ProviderCCN)) <- function(from, to) {
  ProviderCCN(
    ccn = from@std,
    state_code = string(from@vec[1:2]),
    sequence_number = string(from@vec[3:6])
  )
}

#' @autoglobal
S7::method(convert, list(RawCCN, SupplierCCN)) <- function(from, to) {
  SupplierCCN(
    ccn = from@std,
    state_code = string(from@vec[1:2]),
    sequence_number = string(from@vec[3:10])
  )
}

#' @autoglobal
S7::method(convert, list(RawCCN, MedicareProviderCCN)) <- function(from, to) {
  MedicareProviderCCN(
    ccn = from@std,
    state_code = string(from@vec[1:2]),
    sequence_number = string(if (from@vec[3] == "P") {
      from@vec[4:6]
    } else {
      from@vec[3:6]
    })
  )
}

#' @autoglobal
S7::method(convert, list(RawCCN, EmergencyHospitalCCN)) <- function(from, to) {
  EmergencyHospitalCCN(
    ccn = from@std,
    state_code = string(from@vec[1:2]),
    sequence_number = string(from@vec[3:5])
  )
}

#' @autoglobal
S7::method(decode, S7::class_character) <- function(x) {
  x <- RawCCN(raw = x)

  if (x@chr == 6L) {
    if (all_numeric(x@std) || x@vec[3] == "P") {
      return(S7::convert(x, MedicareProviderCCN))
    }
    if (is_emergency_hospital_type(x@vec[6])) {
      return(S7::convert(x, EmergencyHospitalCCN))
    }
    return(S7::convert(x, ProviderCCN))
  }

  if (x@chr == 10L && is_supplier_type(x@vec[3])) {
    return(S7::convert(x, SupplierCCN))
  }
  x
}
