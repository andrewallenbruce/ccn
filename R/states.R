#' @include utils.R
NULL

#' State Lookups
#'
#' @description
#' Convert state codes to their abbreviations or full names.
#'
#' @param x character vector of state codes to look up.
#' @name states
#' @returns character vector of names associated with codes.
#' @examples
#' all(is_state_code(ccn:::state_codes))
#'
#' get_state_abbr(ccn:::state_codes) |>
#' print() |>
#' get_state_name()
NULL

#' @rdname states
#' @export
get_state_abbr <- make_switch(STATE$CODE)

#' @rdname states
#' @export
get_state_name <- make_switch(STATE$NAME)

#' @rdname states
#' @export
is_state_code <- make_test(STATE$CODE)
