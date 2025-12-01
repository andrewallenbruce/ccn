#' Medicare Provider
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicare_provider
#' @returns S7 object of class `Medicare`.
#' @examples
#' medicare_provider("670055")
#' medicare_provider("123456")
NULL

#' @noRd
medicare_range <- function(x) {
  ccn::medicare_ranges$range[
    data.table::between(
      as_int(x),
      ccn::medicare_ranges$start,
      ccn::medicare_ranges$end
      )
    ]
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
MedicareSequence <- S7::new_class(
  name       = "MedicareSequence",
  parent     = SequenceFull,
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
medicare_sequence <- function(x) {
  MedicareSequence(number = x)
}

#' @noRd
Medicare <- S7::new_class(
  name       = "Medicare",
  parent     = CCN,
  properties = list(extension = PropExtension)
)

#' @rdname medicare_provider
#' @export
medicare_provider <- function(x) {
  Medicare(
    ccn      = x,
    entity   = "Medicare Provider",
    state    = state(x),
    sequence = medicare_sequence(substr(x, 3L, 6L))
  )
}
