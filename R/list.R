#' @include supplier.R

#' Convert to a list
#'
#' Convert a ccn object to a list.
#'
#' @param x ccn object
#'
#' @param ... additional arguments
#'
#' @returns list or data.frame
#'
#' @examplesIf FALSE
#' as_list(decode("670055"))
#' as_list(decode("05P001"))
#' @noRd
as_list <- S7::new_generic("as_list", "x")

# S7::method(as_data_frame, S7::class_list) <- function(x) {
#   purrr::map(x, \(x) list2DF(as_list(x))) |>
#     purrr::list_rbind()
# }
#
# S7::method(as_list, Medicare) <- function(x) {
#   rlang::list2(
#     ccn = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     parent_code   = NA_character_,
#     parent_number = NA_character_,
#     extension     = prop_ext(x)
#   )
# }
#
# S7::method(as_list, OPO) <- function(x) {
#   rlang::list2(
#     ccn = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     parent_code   = NA_character_,
#     parent_number = NA_character_,
#     extension     = prop_ext(x)
#   )
# }
#
# S7::method(as_list, Supplier) <- function(x) {
#   rlang::list2(
#     ccn = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     parent_code   = NA_character_,
#     parent_number = NA_character_,
#     extension     = prop_ext(x)
#   )
# }
#
# S7::method(as_list, EmergencyHospital) <- function(x) {
#   rlang::list2(
#     ccn = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     parent_code = NA_character_,
#     parent_number = NA_character_,
#     extension = prop_ext(x)
#   )
# }
#
# S7::method(as_list, MedicaidOnly) <- function(x) {
#   rlang::list2(
#     ccn = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     parent_code = NA_character_,
#     parent_number = NA_character_,
#     extension = prop_ext(x)
#   )
# }
#
# S7::method(as_list, IppsExcluded) <- function(x) {
#   rlang::list2(
#     ccn = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     parent_code = NA_character_,
#     parent_number = NA_character_,
#     extension = prop_ext(x)
#   )
# }
#
# S7::method(as_list, IppsExcludedUnit) <- function(x) {
#   rlang::list2(
#     number = prop_ccn(x),
#     !!!props_sequence(x),
#     !!!props_state(x),
#     !!!props_type(x),
#     !!!props_parent(x),
#     extension = prop_ext(x)
#   )
# }
