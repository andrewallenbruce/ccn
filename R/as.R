#' @noRd
get_unit_sequence <- function(x) {
  string(c(get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))))
}

#' @noRd
as_unknown <- function(x) {
  Unknown(number = clean(x))
}

#' @noRd
as_provider <- function(x) {
  if (has_extension(x@number)) {
    return(S7::convert(
      x,
      Provider,
      number = substr_(x@number, c(1L, 6L)),
      state = as_State(x@number),
      extension = substr_(x@number, c(7L, nchar(x@number)))
    ))
  }
  S7::convert(
    x,
    Provider,
    number = x@number,
    state = as_State(x@number)
  )
}

#' @noRd
as_medicare <- function(x) {
  S7::convert(
    x,
    MedicareProvider,
    sequence = MedicareSequence(substr_(x@number, c(3L, 6L)))
  )
}

#' @noRd
as_care_opo <- function(x) {
  S7::convert(
    x,
    MedicareOPO,
    type = OPOType(substr_(x@number, 3L)),
    sequence = OPOSequence(substr_(x@number, c(4L, 6L)))
  )
}

#' @noRd
as_emergency <- function(x) {
  S7::convert(
    x,
    EmergencyHospital,
    type = EmergencyType(substr_(x@number, 6L)),
    sequence = substr_(x@number, c(3L, 5L))
  )
}

#' @noRd
as_medicaid <- function(x) {
  S7::convert(
    x,
    MedicaidOnlyProvider,
    type = MedicaidOnlyType(substr_(x@number, 3L)),
    sequence = MedicaidOnlySequence(substr_(x@number, c(4L, 6L)))
  )
}

#' @noRd
as_excluded_provider <- function(x) {
  S7::convert(
    x,
    IPPSExcludedProvider,
    type = IPPSExcludedType(substr_(x@number, 3L)),
    sequence = MedicaidOnlySequence(substr_(x@number, c(4L, 6L)))
  )
}

#' @noRd
as_excluded_unit <- function(x) {
  S7::convert(
    x,
    IPPSExcludedUnit,
    type_code   = substr_(x@number, 3L),
    parent_code = substr_(x@number, 4L),
    sequence    = get_unit_sequence(x@number)
  )
}

#' @noRd
as_excluded <- function(x) {
  if (type_unit(substr_(x@number, 4L))) {
    as_excluded_unit(x)
  } else {
    as_excluded_provider(x)
  }
}

#' @noRd
as_supplier <- function(x) {
  S7::convert(
    x,
    Supplier,
    state = as_State(x@number),
    type = SupplierType(substr_(x@number, 3L)),
    sequence = SupplierSequence(substr_(x@number, c(4L, 10L)))
  )
}
