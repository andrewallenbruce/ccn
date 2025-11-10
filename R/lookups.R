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
#' get_emergency_hospital_name(c("E", "F"))
#' get_supplier_name(c("C", "D", "X"))
#' get_state_abbr(ccn:::state_ccn_codes)
#' get_state_name(ccn:::state_abbreviations)
NULL

#' @rdname lookups
#' @autoglobal
#' @export
get_emergency_hospital_name <- make_switch(EMERGENCY_HOSPITAL_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
get_supplier_name <- make_switch(SUPPLIER_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
get_state_abbr <- make_switch(STATE_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
get_state_name <- make_switch(STATE_NAME_LIST)
# unlist_(STATE_NAME_ABBR)[collapse::fmatch(x, rlang::names2(STATE_NAME_ABBR))]
