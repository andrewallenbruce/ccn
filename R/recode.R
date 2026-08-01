#' Recode CMS State/Region Codes
#'
#' @param x `<chr>` vector of CCN state codes.
#' @param as `<chr>` format to return; one of:
#'
#'    For `recode_state()`:
#'
#'    * `"abbr"`: state abbreviation (default)
#'    * `"full"`: state name
#'
#'    For `recode_region()`:
#'
#'    * `"code"`: CMS region code (default)
#'    * `"roman"`: CMS region code as a roman numeral
#'    * `"abbr"`: CMS region's office location abbreviation
#'    * `"full"`: CMS region's office location name
#'
#' @returns `<chr>` vector of CMS state/region/office names/abbreviations
#'
#' @examples
#' tibble::tibble(
#'   x = ccn::states[["code"]],
#'   state = recode_state(x, "abbr"),
#'   region = recode_region(state, "code"),
#'   office = recode_region(state, "full")
#' )
#' @name recode-location
NULL

#' @rdname recode-location
#' @export
recode_state <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::states[["code"]],
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::states[["abbr"]],
      full = ccn::states[["full"]]
    )
  )
}

#' @rdname recode-location
#' @export
recode_region <- function(x, as = c("code", "roman", "abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::regions[["state"]],
    to = switch(
      rlang::arg_match(as),
      code = ccn::regions[["code"]],
      roman = ccn::regions[["roman"]],
      abbr = ccn::regions[["abbr"]],
      full = ccn::regions[["full"]]
    )
  )
}

#' Recode CMS Facility Types
#'
#' @param x `<chr>` vector of CCN facility type characters.
#'
#' @param as `<chr>` format to return; one of:
#'
#'    For `recode_medicaid_type()`:
#'
#'    * `"abbr"`: facility type abbreviation (default)
#'    * `"full"`: facility type name
#'
#'    For `recode_unit_type()`:
#'
#'    * `"abbr"`: unit abbreviation (default)
#'    * `"full"`: unit name
#'    * `"infix"`: unit parent ccn infix
#'    * `"eipps"`: is type IPPS-excluded?
#'
#'    For `recode_subunit_type()`:
#'
#'    * `"prefix"`: subunit parent ccn infix (default)
#'    * `"abbr"`: subunit abbreviation
#'
#'    For `recode_other_type()`:
#'
#'    * `"abbr"`: facility type abbreviation (default)
#'    * `"full"`: facility type name
#'
#' @returns `<chr>` vector of facility type names/abbreviations
#'
#' @examples
#' tibble::tibble(
#'   x = ccn::medicaid_types[["code"]],
#'   abbr = recode_medicaid_type(x, "abbr"),
#'   full = recode_medicaid_type(x, "full")
#' )
#'
#' tibble::tibble(
#'   x = ccn::unit_types[["code"]],
#'   abbr = recode_unit_type(x, "abbr"),
#'   full = recode_unit_type(x, "full"),
#'   infix = recode_unit_type(x, "infix"),
#'   eipps = recode_unit_type(x, "eipps"),
#' )
#'
#' tibble::tibble(
#'   x = ccn::subunit_types[["code"]],
#'   prefix = recode_subunit_type(x, "prefix"),
#'   abbr = recode_subunit_type(x, "abbr")
#' )
#'
#' tibble::tibble(
#'   x = c("C", "D", "E", "F", "P", "X"),
#'   abbr = recode_other_type(x, "abbr"),
#'   full = recode_other_type(x, "full")
#' )
#' @name recode-types
NULL

#' @rdname recode-types
#' @export
recode_medicaid_type <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::medicaid_types[["code"]],
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::medicaid_types[["abbr"]],
      full = ccn::medicaid_types[["desc"]]
    )
  )
}

#' @rdname recode-types
#' @export
recode_unit_type <- function(x, as = c("abbr", "full", "infix", "eipps")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::unit_types[["code"]],
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::unit_types[["abbr"]],
      full = ccn::unit_types[["desc"]],
      infix = ccn::unit_types[["infix"]],
      eipps = ccn::unit_types[["eipps"]]
    )
  )
}

#' @rdname recode-types
#' @export
recode_subunit_type <- function(x, as = c("prefix", "abbr")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::subunit_types[["code"]],
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::subunit_types[["abbr"]],
      prefix = ccn::subunit_types[["prefix"]]
    )
  )
}

#' @rdname recode-types
#' @export
recode_other_type <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c("C", "D", "E", "F", "P", "X", NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(
        "ASC",
        "CLIA",
        "ERN",
        "ERF",
        "OPO",
        "PXRF",
        NA_character_
      ),
      full = vctrs::vec_c(
        "Ambulatory Surgical Center",
        "Clinical Laboratory",
        "Emergency Hospital (Non-Federal)",
        "Emergency Hospital (Federal)",
        "Organ Procurement Organization",
        "Portable X-Ray Facility",
        NA_character_
      )
    )
  )
}

#' Recode CMS Facility Ranges
#'
#' @param x `<int>` vector of CCN facility sequence numbers.
#'
#' @param as `<chr>` format to return; one of:
#'
#'    * `"abbr"`: facility abbreviation (default)
#'    * `"full"`: facility full description
#'    * `"range"`: facility range
#'
#' @returns `<chr>` vector of CMS facility range information
#'
#' @examples
#' tibble::tibble(
#'   x = ccn::medicare_ranges[["start"]],
#'   abbr = recode_medicare_range(x, "abbr"),
#'   range = recode_medicare_range(x, "range"),
#'   facility = recode_medicare_range(x, "full")
#' )
#'
#' tibble::tibble(
#'   x = ccn::medicaid_ranges[["start"]],
#'   abbr = recode_medicaid_range(x, "abbr"),
#'   range = recode_medicaid_range(x, "range"),
#'   facility = recode_medicaid_range(x, "full")
#' )
#' @name recode-ranges
NULL

#' @rdname recode-ranges
#' @export
recode_medicare_range <- function(x, as = c("abbr", "full", "range")) {
  vctrs::vec_slice(
    switch(
      rlang::arg_match(as),
      abbr = ccn::medicare_ranges[["abbr"]],
      full = ccn::medicare_ranges[["desc"]],
      range = ccn::medicare_ranges[["range"]]
    ),
    ivs::iv_locate_between(x, ccn::medicare_ranges[["iv"]])$haystack
  )
}

#' @rdname recode-ranges
#' @export
recode_medicaid_range <- function(x, as = c("abbr", "full", "range")) {
  vctrs::vec_slice(
    switch(
      rlang::arg_match(as),
      abbr = ccn::medicaid_ranges[["abbr"]],
      full = ccn::medicaid_ranges[["desc"]],
      range = ccn::medicaid_ranges[["range"]]
    ),
    ivs::iv_locate_between(x, ccn::medicaid_ranges[["iv"]])$haystack
  )
}
