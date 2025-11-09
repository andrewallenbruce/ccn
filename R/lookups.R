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
NULL

#' @rdname lookups
#' @examples
#' emergency_hospital_name(LETTERS)
#' @autoglobal
#' @export
emergency_hospital_name <- make_switch(EMERGENCY_HOSPITAL_CODE_LIST)

#' @rdname lookups
#' @examples
#' supplier_name(LETTERS)
#' @autoglobal
#' @export
supplier_name <- make_switch(SUPPLIER_CODE_LIST)

#' @rdname lookups
#' @examples
#' state_name(c("00", "01", "83", "A0"))
#' @autoglobal
#' @export
state_name <- make_switch(STATE_CODE_LIST)
