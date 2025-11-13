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
#' c("E", "F") |>
#' get_emergency_abbr() |>
#' print() |>
#' get_emergency_name()
#'
#' c("C", "D", "X") |>
#' get_supplier_abbr() |>
#' print() |>
#' get_supplier_name()
#'
#' c("A", "B", "E", "F", "G", "H", "J", "K", "L") |>
#' get_caid_abbr() |>
#' print() |>
#' get_caid_name()
#'
#' c("M", "R", "S", "T", "U", "W", "Y", "Z") |>
#' get_ipps_abbr() |>
#' print() |>
#' get_ipps_name()
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
get_caid_abbr <- make_switch(MEDICAID$CODE)

#' @rdname lookups
#' @export
get_caid_name <- make_switch(MEDICAID$LONG)

#' @rdname lookups
#' @export
get_ipps_abbr <- make_switch(EXCLUDED$CODE)

#' @rdname lookups
#' @export
get_ipps_name <- make_switch(EXCLUDED$NAME)
