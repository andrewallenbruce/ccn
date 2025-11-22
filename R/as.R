#' @noRd
as_ccn <- function(x) {
  CCN(number = clean(x), state = state(x))
}

#' @noRd
ext_provider <- function(x) {
  x <- substr_(x, c(7L, nchar(x)))
  if (x == "") NA_character_ else x
}

#' @noRd
ext_supplier <- function(x) {
  x <- substr_(x, c(11L, nchar(x)))
  if (x == "") NA_character_ else x
}

#' @noRd
medicare_provider <- function(x) {
  S7::convert(
    x,
    MedicareProvider,
    sequence = sequence_medicare(substr_(x@number, c(3L, 6L))),
    extension = ext_provider(x@number)
  )
}

#' @noRd
medicare_opo <- function(x) {
  S7::convert(
    x,
    MedicareOPO,
    sequence = sequence_opo(substr_(x@number, c(4L, 6L))),
    type = type_opo(substr_(x@number, 3L)),
    extension = ext_provider(x@number)
  )
}

#' @noRd
emergency_hospital <- function(x) {
  S7::convert(
    x,
    EmergencyHospital,
    sequence = sequence_emergency(substr_(x@number, c(3L, 5L))),
    type = type_emergency(substr_(x@number, 6L)),
    extension = ext_provider(x@number)
  )
}

#' @noRd
medicaid_only <- function(x) {
  S7::convert(
    x,
    MedicaidOnly,
    sequence = sequence_medicaid_only(substr_(x@number, c(4L, 6L))),
    type = type_medicaid_only(substr_(x@number, 3L)),
    extension = ext_provider(x@number)
  )
}

#' @noRd
ipps_excluded_provider <- function(x) {
  S7::convert(
    x,
    IppsExcludedProvider,
    sequence = sequence_medicaid_only(substr_(x@number, c(4L, 6L))),
    type = type_ipps_excluded(substr_(x@number, 3L)),
    extension = ext_provider(x@number)
  )
}

#' @noRd
ipps_excluded_unit <- function(x) {
  S7::convert(
    x,
    IppsExcludedUnit,
    sequence = sequence_medicare(get_unit_sequence(x@number)),
    type = type_ipps_excluded(substr_(x@number, 3L)),
    parent = IppsExcludedParent(substr_(x@number, 4L), get_parent_ccn(x@number)),
    extension = ext_provider(x@number)
  )
}

#' @noRd
ipps_excluded <- function(x) {
  if (is_type_ipps_excluded_unit(substr_(x@number, 4L))) {
    return(ipps_excluded_unit(x))
  }
  ipps_excluded_provider(x)
}

#' @noRd
medicare_supplier <- function(x) {
  S7::convert(
    x,
    MedicareSupplier,
    state = state(x@number),
    sequence = sequence_supplier(substr_(x@number, c(4L, 10L))),
    type = type_supplier(substr_(x@number, 3L)),
    extension = ext_supplier(x@number)
  )
}
