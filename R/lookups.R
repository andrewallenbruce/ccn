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
#' get_emergency_abbr(c("E", "F"))
#' get_supplier_abbr(c("C", "D", "X"))
#' get_state_abbr(ccn:::state_codes)
#'
#' get_emergency_name(get_emergency_abbr(c("E", "F")))
#' get_supplier_name(get_supplier_abbr(c("C", "D", "X")))
#' get_state_name(get_state_abbr(ccn:::state_codes))
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
