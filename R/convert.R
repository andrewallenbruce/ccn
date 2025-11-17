#' @noRd
as_unknown <- function(x) {
  Unknown(number = clean(x))
}

#' @noRd
as_provider <- function(x) {
  S7::convert(
    x,
    Provider,
    state_code = substr_(x@number, c(1L, 2L))
  )
}

#' @noRd
as_medicare <- function(x) {
  S7::convert(x, MedicareProvider, sequence = substr_(x@number, c(3L, 6L)))
}

#' @noRd
as_opo <- function(x) {
  S7::convert(
    x,
    MedicareOPO,
    type_code = substr_(x@number, 3L),
    sequence = substr_(x@number, c(4L, 6L))
  )
}

#' @noRd
as_emergency <- function(x) {
  S7::convert(
    x,
    EmergencyHospital,
    sequence = substr_(x@number, c(3L, 5L)),
    type_code = substr_(x@number, 6L)
  )
}

#' @noRd
as_medicaid <- function(x) {
  S7::convert(
    x,
    MedicaidOnlyProvider,
    type_code = substr_(x@number, 3L),
    sequence = substr_(x@number, c(4L, 6L))
  )
}

#' @noRd
as_excluded <- function(x) {
  S7::convert(
    x,
    IPPSExcludedProvider,
    type_code = substr_(x@number, 3L),
    sequence = substr_(x@number, c(4L, 6L))
  )
}

#' @noRd
as_parent <- function(x) {
  S7::convert(
    x,
    IPPSExcludedUnit,
    type_code = substr_(x@number, 3L),
    parent_code = substr_(x@number, 4L),
    sequence = c(get_parent_prefix(substr_(x@number, 4L)),
                 substr_(x@number, c(5L, 6L)))
  )
}

#' @noRd
as_supplier <- function(x) {
  S7::convert(
    x,
    Supplier,
    state_code = substr_(x@number, c(1L, 2L)),
    type_code = substr_(x@number, 3L),
    sequence = substr_(x@number, c(4L, 10L))
  )
}
