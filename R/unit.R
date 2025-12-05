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
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_unit$code,
    outputs = ccn::eipps_unit$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
eipps_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::eipps_unit$code,
    outputs = ccn::eipps_unit$desc,
    default = NA_character_,
    nThread = 4L
  )
}


#' @noRd
eipps_type <- function(x) {
  Type(code = x,
       abbr = eipps_abbr(x),
       desc = eipps_desc(x))
}

#' @noRd
Unit <- S7::new_class(
  name       = "Unit",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname unit
#' @export
unit <- function(x) {
  Unit(
    ccn      = x,
    entity   = "IPPS-Excluded Unit",
    state    = state(x),
    sequence = mof_sequence(substr(x, 4L, 6L)),
    type     = eipps_type(substr_(x, 3L))
  )
}
