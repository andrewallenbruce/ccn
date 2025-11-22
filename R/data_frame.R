#' Convert to list/data.frame
#'
#' @param x ccn object
#'
#' @param ... additional arguments
#'
#' @returns list or data.frame
#'
#' @examples
#' as_list(ccn("670055"))
#' as_list(ccn("05P001"))
#'
#' c("670055", "05P001", "210101", "21T101", "21S101", "21U101",
#'   "01L008", "12345E", "10C0001062", "45D0634589", "21X0009807",
#'   "02TA01", "04SD38", "52TA05", "212026", "21SA26", "21TA26",
#'   "24T019A", "33S23401", "330027001") |>
#' purrr::map(ccn) |>
#' as_data_frame()
#' @name data_frame
NULL

#' @rdname data_frame
#' @export
as_list <- S7::new_generic("as_list", "x")

S7::method(as_list, MedicareProvider) <- function(x) {
  rlang::list2(
    category      = "Medicare Provider",
    number        = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    parent_code   = NA_character_,
    parent_number = NA_character_,
    extension     = prop_ext(x)
  )
}

S7::method(as_list, MedicareOPO) <- function(x) {
  rlang::list2(
    category      = "Medicare Provider",
    number        = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    parent_code   = NA_character_,
    parent_number = NA_character_,
    extension     = prop_ext(x)
  )
}

S7::method(as_list, MedicareSupplier) <- function(x) {
  rlang::list2(
    category      = "Medicare Supplier",
    number        = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    parent_code   = NA_character_,
    parent_number = NA_character_,
    extension     = prop_ext(x)
  )
}

S7::method(as_list, EmergencyHospital) <- function(x) {
  rlang::list2(
    category      = "Emergency Hospital",
    number        = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    parent_code   = NA_character_,
    parent_number = NA_character_,
    extension     = prop_ext(x)
  )
}

S7::method(as_list, MedicaidOnly) <- function(x) {
  rlang::list2(
    category      = "Medicaid-Only Provider",
    number        = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    parent_code   = NA_character_,
    parent_number = NA_character_,
    extension     = prop_ext(x)
  )
}

S7::method(as_list, IppsExcludedProvider) <- function(x) {
  rlang::list2(
    category      = "IPPS-Excluded Provider",
    number        = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    parent_code   = NA_character_,
    parent_number = NA_character_,
    extension     = prop_ext(x)
  )
}

S7::method(as_list, IppsExcludedUnit) <- function(x) {
  rlang::list2(
    category  = "IPPS-Excluded Unit",
    number    = prop_number(x),
    !!!props_sequence(x),
    !!!props_state(x),
    !!!props_type(x),
    !!!props_parent(x),
    extension = prop_ext(x)
  )
}

#' @rdname data_frame
#' @export
as_data_frame <- S7::new_generic("as_data_frame", "x")

S7::method(as_data_frame, S7::class_list) <- function(x) {
  purrr::map(x, \(x) list2DF(as_list(x))) |>
    purrr::list_rbind()
}
