#' @include utils.R
NULL

#' Lookups for Various Codes
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name lookups
#' @returns character vector of names associated with codes.
#' @examples
#' get_emergency_abbr(c("E", "F")) |>
#' print() |>
#' get_emergency_name()
#'
#' get_supplier_abbr(c("C", "D", "X")) |>
#' print() |>
#' get_supplier_name()
#'
#' get_state_abbr(ccn:::state_codes) |>
#' print() |>
#' get_state_name()
#'
#' get_caid_abbr(LETTERS[1:12]) |>
#' print() |>
#' get_caid_name()
NULL

#' @rdname lookups
#' @export
get_emergency_abbr <- make_switch(EMERGENCY$CODE)

#' @rdname lookups
#' @export
get_emergency_name <- make_switch(EMERGENCY$NAME)

#' @rdname lookups
#' @export
get_supplier_abbr <- make_switch(SUPPLIER$CODE)

#' @rdname lookups
#' @export
get_supplier_name <- make_switch(SUPPLIER$NAME)

#' @rdname lookups
#' @export
get_state_abbr <- make_switch(STATE$CODE)

#' @rdname lookups
#' @export
get_state_name <- make_switch(STATE$NAME)

#' @rdname lookups
#' @export
get_caid_abbr <- make_switch(MEDICAID$CODE)

#' @rdname lookups
#' @export
get_caid_name <- make_switch(MEDICAID$LONG)
