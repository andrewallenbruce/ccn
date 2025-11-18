#' @noRd
as_unknown <- function(x) {
  Unknown(number = clean(x))
}

#' @noRd
as_provider <- function(x) {
  S7::convert(
    x,
    Provider,
    number = if (is_extended(x)) substr_(x@number, c(1L, 6L)) else x@number,
    state = State(code = substr_(x@number, c(1L, 2L))),
    extension = if (is_extended(x)) substr_(x@number, c(7L, nchar(x@number))) else character(0)
  )
}

#' @noRd
as_medicare <- function(x) {
  S7::convert(
    x,
    MedicareProvider,
    sequence = substr_(x@number, c(3L, 6L))
  )
}

#' @noRd
as_care_opo <- function(x) {
  S7::convert(
    x,
    MedicareOPO,
    type_code = substr_(x@number, 3L),
    sequence  = substr_(x@number, c(4L, 6L))
  )
}

#' @noRd
as_emergency <- function(x) {
  S7::convert(
    x,
    EmergencyHospital,
    sequence  = substr_(x@number, c(3L, 5L)),
    type_code = substr_(x@number, 6L)
  )
}

#' @noRd
as_medicaid <- function(x) {
  S7::convert(
    x,
    MedicaidOnlyProvider,
    type_code = substr_(x@number, 3L),
    sequence  = substr_(x@number, c(4L, 6L))
  )
}

#' @noRd
as_excluded <- function(x) {
  S7::convert(
    x,
    IPPSExcludedProvider,
    type_code = substr_(x@number, 3L),
    sequence  = substr_(x@number, c(4L, 6L))
  )
}

#' @noRd
get_unit_sequence <- function(x) {
  string(c(get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))))
}

#' @noRd
as_unit <- function(x) {
  S7::convert(
    x,
    IPPSExcludedUnit,
    type_code   = substr_(x@number, 3L),
    parent_code = substr_(x@number, 4L),
    sequence    = get_unit_sequence(x@number)
  )
}

#' @noRd
as_excluded_type <- function(x) {
  if (type_unit(substr_(x@number, 4L))) {
    as_unit(x)
  } else {
    as_excluded(x)
  }
}

#' @noRd
as_supplier <- function(x) {
  S7::convert(
    x,
    Supplier,
    state     = State(code = substr_(x@number, c(1L, 2L))),
    type_code = substr_(x@number, 3L),
    sequence  = substr_(x@number, c(4L, 10L))
  )
}
