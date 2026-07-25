#' Medicaid-Only Providers
#'
#' @description
#' CCNs assigned to Medicaid-only hospitals and facilities.
#'
#' @details
#' Title XIX-only providers are identified by a 6-position alphanumeric CCN.
#'
#' Positions one and two identify the state in which the provider is located.
#'
#' Position three, an alpha character, identifies the type of facility, by
#' either level or type of care being provided.
#'
#' Positions four, five and six represent a sequence beginning with `001`.
#'
#' @param x `<character>` 6-position alphanumeric code.
#' @name medicaid
#' @returns S7 object of class `<Medicaid>`.
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
  vs(x, ccn::medicaid_types$code, ccn::medicaid_types$abbr)
}

#' @noRd
mof_type_desc <- function(x) {
  vs(x, ccn::medicaid_types$code, ccn::medicaid_types$desc)
}

#' @param x `<character>` Medicaid range number.
#' @rdname medicaid
#' @examplesIf rlang::is_interactive()
#' purrr::map_chr(1:10, moh_range_series)
#' @noRd
moh_range_series <- function(x) {
  check_range(x, c(1L, 999L), "Medicaid")

  ccn::medicaid_ranges$range[
    data.table::between(
      as.integer(x),
      ccn::medicaid_ranges$start,
      ccn::medicaid_ranges$end
    )
  ]
}

#' @noRd
moh_range_abbr <- function(x) {
  vs(x, ccn::medicaid_ranges$range, ccn::medicaid_ranges$abbr)
}

#' @noRd
moh_range_desc <- function(x) {
  vs(x, ccn::medicaid_ranges$range, ccn::medicaid_ranges$desc)
}

#' @noRd
TypeMOF <- S7::new_class(
  name = "TypeMOF",
  parent = Type,
  constructor = function(code) {
    if (length(code) != 1L) {
      check_arg(code, "must be length {.strong 1}.")
    }
    if (nchar(code) != 1L) {
      check_arg(code, "must be {.strong 1} character.")
    }
    if (!is_medicaid_type(code)) {
      check_arg(code, "{.val {x}} is an invalid medicaid type.")
    }
    S7::new_object(
      S7::S7_object(),
      abbr = mof_type_abbr(code),
      desc = mof_type_desc(code)
    )
  }
)

#' @noRd
RangeMOH <- S7::new_class(
  name = "RangeMOH",
  parent = Range,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        moh_range_abbr(self@series)
      }
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        moh_range_desc(self@series)
      }
    )
  ),
  constructor = function(code) {
    if (length(code) != 1L) {
      check_arg(code, "must be length {.strong 1}.")
    }
    S7::new_object(
      S7::S7_object(),
      series = moh_range_series(code)
    )
  }
)

#' @rdname medicaid
#' @export
medicaid <- function(x) {
  Medicaid(
    ccn = x,
    state = state(x),
    range = if (is_moh_type(substring(x, 3L, 3L))) {
      RangeMOH(substring(x, 4L, 6L))
    } else {
      if_in(substring(x, 4L, 6L), c(1L, 999L), "001-999")
    },
    type = TypeMOF(substring(x, 3L, 3L))
  )
}
