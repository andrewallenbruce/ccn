#' IPPS-Excluded Hospital Units
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name unit
#' @returns character vector of names associated with codes.
#' @examples
#' medicare("210101")
#' unit("21T101")
#' unit("21S101")
#' unit("21U101")
NULL

#' @noRd
eipps_abbr <- function(x) {
  vs(x, ccn::eipps_unit[["code"]], ccn::eipps_unit[["abbr"]])
}

#' @noRd
eipps_desc <- function(x) {
  vs(x, ccn::eipps_unit[["code"]], ccn::eipps_unit[["desc"]])
}

#' @noRd
eipps_type <- function(x) {
  Type(
    code = x,
    abbr = eipps_abbr(x),
    desc = eipps_desc(x)
  )
}

#' @rdname unit
#' @export
unit <- function(x) {
  Unit(
    ccn = x,
    state = state(x),
    sequence = substr(x, 4L, 6L),
    range = range_mof(x),
    type = eipps_type(str3(x))
  )
}
