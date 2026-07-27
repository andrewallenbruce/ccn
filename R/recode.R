#' Recode State Codes
#'
#' @param x `<chr>` vector
#' @param as `<chr>` "abbr", "full"
#' @examples
#' recode_state(c("00", "01", "A5", NA))
#' recode_state(c("00", "01", "A5", NA), "full")
#' @noRd
recode_state <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::states$code,
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::states$abbr,
      full = ccn::states$full
    )
  )
}

#' Recode Region Codes
#'
#' @param x `<chr>` vector
#' @param as `<chr>` "number", "roman", "abbr", "full"
#' @examples
#' recode_region(c("00", "01", "A5", NA))
#' recode_region(c("00", "01", "A5", NA), "full")
#' @noRd
recode_region <- function(x, as = c("number", "roman", "abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::regions$state,
    to = switch(
      rlang::arg_match(as),
      number = ccn::regions$code,
      roman = ccn::regions$roman,
      abbr = ccn::regions$office_abbr,
      full = ccn::regions$office_full
    )
  )
}

# recode_medicaid_type(c("A", "K", NA))
#' @noRd
recode_medicaid_type <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::medicaid_types$code,
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::medicaid_types$abbr,
      full = ccn::medicaid_types$desc
    )
  )
}

# recode_unit_type(c("M", "T", "Z", NA))
#' @noRd
recode_unit_type <- function(x, as = c("abbr", "full", "infix", "eipps")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::unit_types$code,
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::unit_types$abbr,
      full = ccn::unit_types$desc,
      infix = ccn::unit_types$infix,
      eipps = ccn::unit_types$eipps
    )
  )
}

# recode_subunit_type(c("A", "K", NA))
#' @noRd
recode_subunit_type <- function(x, as = c("prefix", "abbr")) {
  vctrs::vec_recode_values(
    x,
    from = ccn::subunit_types$code,
    to = switch(
      rlang::arg_match(as),
      abbr = ccn::subunit_types$abbr,
      prefix = ccn::subunit_types$prefix
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
