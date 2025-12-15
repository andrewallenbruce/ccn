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

# purrr::map_chr(1:10, moh_range)
#' @noRd
moh_range_series <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (as.integer(x) < 1L) {
    cli::cli_abort(
      "{.arg {arg}} must be greater than 0",
      arg = arg,
      call = call
    )
  }

  if (as.integer(x) > max(ccn::medicaid_ranges[["end"]])) {
    cli::cli_abort(
      "{.arg {arg}} must be less than {max(ccn::medicaid_ranges$end)}",
      arg = arg,
      call = call
    )
  }
  ccn::medicaid_ranges[["range"]][
    data.table::between(
      as.integer(x),
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
