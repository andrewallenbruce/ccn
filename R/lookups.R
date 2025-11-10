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
#' emergency_hospital_name(LETTERS)
#' supplier_name(LETTERS)
#' state_abbr(ccn:::state_ccn_codes)
#' state_name(ccn:::state_abbreviations)
NULL

#' @rdname lookups
#' @autoglobal
#' @export
emergency_hospital_name <- make_switch(EMERGENCY_HOSPITAL_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
supplier_name <- make_switch(SUPPLIER_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
state_abbr <- make_switch(STATE_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
state_name <- function(x) {
  unlist_(STATE_NAME_ABBR)[collapse::fmatch(x, STATE_NAME_ABBR)]
}
