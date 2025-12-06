#' Medicare Provider
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicare
#' @returns S7 object of class `Medicare`.
#' @examples
#' medicare("670055")
#' medicare("123456")
NULL

#' @noRd
medicare_range <- function(x) {
  ccn::medicare_ranges$range[
    data.table::between(
      as_int(x),
      ccn::medicare_ranges$start,
      ccn::medicare_ranges$end)]
}

#' @noRd
medicare_range_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicare_ranges$range,
    outputs = ccn::medicare_ranges$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
medicare_range_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicare_ranges$range,
    outputs = ccn::medicare_ranges$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
RangeMDC <- S7::new_class(
  name       = "RangeMDC",
  parent     = Range,
  properties = list(
    range    = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicare_range(self@number)
    ),
    abbr     = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicare_range_abbr(self@range)
    ),
    desc     = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicare_range_desc(self@range)
    )
  )
)

#' @noRd
range_mdc <- function(x) {
  RangeMDC(number = x)
}

#' @rdname medicare
#' @export
medicare <- function(x) {
  Medicare(
    ccn      = x,
    state    = state(x),
    sequence = substr(x, 3L, 6L),
    range = range_mdc(substr(x, 3L, 6L))
  )
}
