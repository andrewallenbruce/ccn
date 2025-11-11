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
#' get_medicare_range(c("0055", "5232", "9999"))
#' get_medicaid_range(c("055", "232", "599"))
#'
#' get_emergency_name(get_emergency_abbr(c("E", "F")))
#' get_supplier_name(get_supplier_abbr(c("C", "D", "X")))
#' get_state_name(get_state_abbr(ccn:::state_codes))
#' get_medicare_range_name(get_medicare_range(c("0055", "5232", "9999")))
#' get_medicaid_range_name(get_medicaid_range(c("055", "232", "599")))
NULL

#' @rdname lookups
#' @autoglobal
#' @export
get_emergency_abbr <- make_switch(EMERGENCY$CODE)

#' @rdname lookups
#' @autoglobal
#' @export
get_supplier_abbr <- make_switch(SUPPLIER$CODE)

#' @rdname lookups
#' @autoglobal
#' @export
get_state_abbr <- make_switch(STATE_CODE_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
get_emergency_name <- make_switch(EMERGENCY$NAME)

#' @rdname lookups
#' @autoglobal
#' @export
get_supplier_name <- make_switch(SUPPLIER$NAME)

#' @rdname lookups
#' @autoglobal
#' @export
get_state_name <- make_switch(STATE_NAME_LIST)

#' @rdname lookups
#' @autoglobal
#' @export
get_medicare_range <- make_switch(MEDICARE$RANGES)

#' @rdname lookups
#' @autoglobal
#' @export
get_medicare_range_name <- make_switch(MEDICARE$NAMES)

#' @rdname lookups
#' @autoglobal
#' @export
get_medicaid_range <- make_switch(MEDICAID$RANGES)

#' @rdname lookups
#' @autoglobal
#' @export
get_medicaid_range_name <- make_switch(MEDICAID$NAMES)
