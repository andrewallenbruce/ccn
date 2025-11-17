#' @noRd
convert_provider <- function(x) {
  S7::convert(x, Provider, state_code = x@vec[1:2])
}

#' @noRd
convert_medicare <- function(x) {
  S7::convert(x, MedicareProvider, sequence_number = x@vec[3:6])
}

#' @noRd
convert_opo <- function(x) {
  S7::convert(x,
              MedicareOPO,
              type_code = x@vec[3],
              sequence_number = x@vec[4:6])
}

#' @noRd
convert_emergency <- function(x) {
  S7::convert(
    x,
    EmergencyHospital,
    sequence_number = x@vec[3:5],
    type_code = x@vec[6]
  )
}

#' @noRd
convert_medicaid <- function(x) {
  S7::convert(
    x,
    MedicaidOnlyProvider,
    type_code = x@vec[3],
    sequence_number = x@vec[4:6]
  )
}

#' @noRd
convert_excluded <- function(x) {
  S7::convert(
    x,
    IPPSExcludedProvider,
    type_code = x@vec[3],
    sequence_number = x@vec[4:6]
  )
}

#' @noRd
convert_parent <- function(x) {
  S7::convert(
    x,
    IPPSExcludedUnit,
    type_code = x@vec[3],
    parent_code = x@vec[4],
    sequence_number = c(get_parent_prefix(x@vec[4]), x@vec[5:6])
  )
}

#' @noRd
convert_supplier <- function(x) {
  S7::convert(
    x,
    Supplier,
    state_code = x@vec[1:2],
    type_code = x@vec[3],
    sequence_number = x@vec[4:10]
  )
}
