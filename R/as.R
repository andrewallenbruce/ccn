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
as_medicare <- function(x) {
  S7::convert(
    x,
    Medicare,
    ccn = substr_(x@ccn, c(1L, 6L)),
    entity = "Medicare Provider",
    sequence = medicare_sequence(substr_(x@ccn, c(3L, 6L))),
    extension = ext_provider(x@ccn)
  )
}

#' @noRd
as_medicare_opo <- function(x) {
  S7::convert(
    x,
    MedicareOPO,
    ccn = substr_(x@ccn, c(1L, 6L)),
    entity = "Medicare Provider",
    sequence = opo_sequence(substr_(x@ccn, c(4L, 6L))),
    type = opo_type(substr_(x@ccn, 3L)),
    extension = ext_provider(x@ccn)
  )
}

#' @noRd
as_medicaid_only <- function(x) {
  S7::convert(
    x,
    MedicaidOnly,
    ccn = substr_(x@ccn, c(1L, 6L)),
    entity = "Medicaid Only Provider",
    sequence = medicaid_only_sequence(substr_(x@ccn, c(4L, 6L))),
    type = medicaid_only_type(substr_(x@ccn, 3L)),
    extension = ext_provider(x@ccn)
  )
}

#' @noRd
as_excluded_prov <- function(x) {
  S7::convert(
    x,
    IppsExcluded,
    ccn = substr_(x@ccn, c(1L, 6L)),
    entity = "IPPS Excluded Provider",
    sequence = medicaid_only_sequence(substr_(x@ccn, c(4L, 6L))),
    type = excluded_type(substr_(x@ccn, 3L)),
    extension = ext_provider(x@ccn)
  )
}

#' @noRd
as_excluded_unit <- function(x) {
  S7::convert(
    x,
    IppsExcludedUnit,
    ccn = substr_(x@ccn, c(1L, 6L)),
    entity = "IPPS Excluded Unit",
    sequence = medicare_sequence(get_unit_sequence(x@ccn)),
    type = excluded_type(substr_(x@ccn, 3L)),
    parent = IppsExcludedParent(substr_(x@ccn, 4L), get_parent_ccn(x@ccn)),
    extension = ext_provider(x@ccn)
  )
}

#' @noRd
as_excluded <- function(x) {
  if (is_type_ipps_excluded_unit(substr_(x@ccn, 4L))) {
    return(as_excluded_unit(x))
  }
  as_excluded_prov(x)
}

#' @noRd
as_emergency <- function(x) {
  S7::convert(
    x,
    EmergencyHospital,
    ccn = substr_(x@ccn, c(1L, 6L)),
    entity = "Emergency Hospital",
    sequence = emergency_sequence(substr_(x@ccn, c(3L, 5L))),
    type = emergency_type(substr_(x@ccn, 6L)),
    extension = ext_provider(x@ccn)
  )
}

#' @noRd
as_supplier <- function(x) {
  S7::convert(
    x,
    Supplier,
    ccn = substr_(x@ccn, c(1L, 10L)),
    entity = "Medicare Supplier",
    sequence = supplier_sequence(substr_(x@ccn, c(4L, 10L))),
    type = supplier_type(x@ccn),
    extension = ext_supplier(x@ccn)
  )
}
