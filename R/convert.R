#' @noRd
as_unknown <- function(x) {
  xc <- clean(x)
  Unknown(
    number = xc,
    # chr = nchar_(xc),
    vec = split_(xc)
  )
}

#' @noRd
as_provider <- function(x) {
  S7::convert(x, Provider, state_code = x@vec[1:2])
}

#' @noRd
as_medicare <- function(x) {
  S7::convert(x, MedicareProvider, sequence = x@vec[3:6])
}

#' @noRd
as_opo <- function(x) {
  S7::convert(x,
              MedicareOPO,
              type_code = x@vec[3],
              sequence = x@vec[4:6])
}

#' @noRd
as_emergency <- function(x) {
  S7::convert(x,
              EmergencyHospital,
              sequence = x@vec[3:5],
              type_code = x@vec[6])
}

#' @noRd
as_medicaid <- function(x) {
  S7::convert(x,
              MedicaidOnlyProvider,
              type_code = x@vec[3],
              sequence = x@vec[4:6])
}

#' @noRd
as_excluded <- function(x) {
  S7::convert(x,
              IPPSExcludedProvider,
              type_code = x@vec[3],
              sequence = x@vec[4:6])
}

#' @noRd
as_parent <- function(x) {
  S7::convert(
    x,
    IPPSExcludedUnit,
    type_code = x@vec[3],
    parent_code = x@vec[4],
    sequence = c(get_parent_prefix(x@vec[4]), x@vec[5:6])
  )
}

#' @noRd
as_supplier <- function(x) {
  S7::convert(
    x,
    Supplier,
    state_code = x@vec[1:2],
    type_code = x@vec[3],
    sequence = x@vec[4:10]
  )
}
