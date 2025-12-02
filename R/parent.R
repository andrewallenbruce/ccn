#' IPPS Excluded Unit Codes
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name parent
#' @returns character vector of names associated with codes.
#' @examples
#' x <- c("02TA01", "04SD38", "52TA05")
#' get_unit_sequence(x)
#' get_parent_ccn(x)
NULL

#' @rdname parent
#' @export
ipps_excluded_unit_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_hospital_units_types$code,
    outputs = ccn::eipps_hospital_units_types$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname parent
#' @export
ipps_excluded_unit_prefix <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_hospital_units_types$code,
    outputs = ccn::eipps_hospital_units_types$prefix,
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname parent
#' @export
get_unit_sequence <- function(x) {
  paste0(ipps_excluded_unit_prefix(substr_(x, 4L)), substr(x, 5L, 6L))
}

#' @rdname parent
#' @export
get_parent_ccn <- function(x) {
  paste0(substr(x, 1L, 2L), get_unit_sequence(x))
}
