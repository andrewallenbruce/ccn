#' Recode CMS State/Region Codes
#'
#' @param x `<chr>` vector of CCN state codes.
#' @param as `<chr>` format to return; one of:
#'
#'    ### for `recode_state()`:
#'
#'    * `"abbr"`: state abbreviation (default)
#'    * `"full"`: state name
#'
#'    ### for `recode_region()`:
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
#'   x = c("00", "01", "A5", "B3", "B4", "B5", "D6"),
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

#' Recode Medicaid Facility Types
#'
#' @param x `<chr>` vector of CCN Medicaid facility type characters.
#' @param as `<chr>` format to return; one of:
#'    * `"abbr"`: facility type abbreviation (default)
#'    * `"full"`: facility type name
#' @returns `<chr>` vector of Medicaid facility type names/abbreviations
#' @examples
#' tibble::tibble(
#'   x = c("A", "K"),
#'   abbr = recode_medicaid_type(x, "abbr"),
#'   full = recode_medicaid_type(x, "full")
#' )
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

#' Recode Unit Facility Types
#'
#' @param x `<chr>` vector of CCN Unit facility type characters.
#' @param as `<chr>` format to return; one of:
#'    * `"abbr"`: unit abbreviation (default)
#'    * `"full"`: unit name
#'    * `"infix"`: unit parent ccn infix
#'    * `"eipps"`: is type IPPS-excluded?
#' @returns `<chr>` vector of Unit facility type names/abbreviations/parent infixes/IPPS exclusion statuses
#' @examples
#' tibble::tibble(
#'   x = c("M", "T", "Z"),
#'   abbr = recode_unit_type(x, "abbr"),
#'   full = recode_unit_type(x, "full"),
#'   infix = recode_unit_type(x, "infix"),
#'   eipps = recode_unit_type(x, "eipps"),
#' )
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

# recode_subunit_type(c("A", "K", NA))
#' @noRd
recode_subunit_type <- function(x, as = c("prefix", "abbr")) {
  vctrs::vec_recode_values(
    vctrs::vec_if_else(nchar(x) >= 2L, substring(x, 1L, 1L), x),
    from = ccn::subunit_types[["code"]],
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::subunit_types[["abbr"]],
      prefix = ccn::subunit_types[["prefix"]]
    )
  )
}

# recode_other_type(c("C", "D", "E", "F", "P", "X", NA))
#' @noRd
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

# decode_medicare_range(c(1L, 2099L, NA))
#' @noRd
decode_medicare_range <- function(x, as = c("abbr", "range", "full")) {
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

# decode_medicaid_range(c(1L, 209L, NA, 1000))
#' @noRd
decode_medicaid_range <- function(x, as = c("abbr", "range", "full")) {
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
