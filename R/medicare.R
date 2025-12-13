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
  ccn::medicare_ranges[["range"]][
    data.table::between(
      as_int(x),
      ccn::medicare_ranges[["start"]],
      ccn::medicare_ranges[["end"]]
    )
  ]
}

#' @noRd
medicare_range_abbr <- function(x) {
  vs(x, ccn::medicare_ranges[["range"]], ccn::medicare_ranges[["abbr"]])
}

#' @noRd
medicare_range_desc <- function(x) {
  vs(x, ccn::medicare_ranges[["range"]], ccn::medicare_ranges[["desc"]])
}

#' @noRd
RangeMCR <- S7::new_class(
  name = "RangeMCR",
  parent = Range,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        medicare_range_abbr(self@series)
      }
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        medicare_range_desc(self@series)
      }
    )
  ),
  constructor = function(code) {
    if (length(code) != 1L) {
      check_arg(code, "must be length {.strong 1}.")
    }
    S7::new_object(
      S7::S7_object(),
      series = medicare_range(code)
    )
  }
)

#' @rdname medicare
#' @export
medicare <- function(x) {
  Medicare(
    ccn = x,
    state = state(x),
    range = RangeMCR(code = substring(x, 3L, 6L))
  )
}
