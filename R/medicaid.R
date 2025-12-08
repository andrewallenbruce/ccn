#' Medicaid-Only Facilities
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicaid
#' @returns S7 object of class `Medicaid`.
#' @examples
#' medicaid("01L008")
#' medicaid("22B201")
#' medicaid("23E301")
#' medicaid("34F401")
#' medicaid("01J008")
#' medicaid("A5J508")
NULL

#' @noRd
mof_type_abbr <- function(x) {
  vs(x, ccn::medicaid_types[["code"]], ccn::medicaid_types[["abbr"]])
}

#' @noRd
mof_type_desc <- function(x) {
  vs(x, ccn::medicaid_types[["code"]], ccn::medicaid_types[["desc"]])
}

#' @noRd
moh_range <- function(x) {
  ccn::medicaid_ranges[["range"]][
    data.table::between(
      as_int(x),
      ccn::medicaid_ranges[["start"]],
      ccn::medicaid_ranges[["end"]]
    )
  ]
}

#' @noRd
moh_range_abbr <- function(x) {
  vs(x, ccn::medicaid_ranges[["range"]], ccn::medicaid_ranges[["abbr"]])
}

#' @noRd
moh_range_desc <- function(x) {
  vs(x, ccn::medicaid_ranges[["range"]], ccn::medicaid_ranges[["desc"]])
}

#' @noRd
TypeMOF <- S7::new_class(
  name = "TypeMOF",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        mof_type_abbr(self@code)
      }
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        mof_type_desc(self@code)
      }
    )
  )
)

#' @noRd
mof_type <- function(x) {
  TypeMOF(code = x)
}

#' @noRd
RangeMOH <- S7::new_class(
  name = "RangeMOH",
  parent = Range,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self) {
        moh_range(self@number)
      }
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        moh_range_abbr(self@range)
      }
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        moh_range_desc(self@range)
      }
    )
  )
)

#' @noRd
range_moh <- function(x) {
  RangeMOH(number = substr(x, 4L, 6L))
}


#' @noRd
range_mof <- function(x) {
  if_in(substr(x, 4L, 6L), c(1L, 999L), "0001-0009")
}

#' @rdname medicaid
#' @export
medicaid <- function(x) {
  Medicaid(
    ccn      = x,
    state    = state(x),
    sequence = substr(x, 4L, 6L),
    range    = if (is_moh_type(str3(x))) range_moh(x) else range_mof(x),
    type     = mof_type(str3(x))
  )
}
