# recode_state(c("00", "01", "A5", NA))
#' @noRd
recode_state <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c(ccn::states$code, NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::states$abbr, NA_character_),
      full = vctrs::vec_c(ccn::states$full, NA_character_)
    )
  )
}

# recode_region(c("00", "01", "A5", NA))
#' @noRd
recode_region <- function(x, as = c("number", "roman", "abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c(ccn::regions$state, NA_character_),
    to = switch(
      rlang::arg_match(as),
      number = vctrs::vec_c(ccn::regions$code, NA_character_),
      roman = vctrs::vec_c(ccn::regions$roman, NA_character_),
      abbr = vctrs::vec_c(ccn::regions$office_abbr, NA_character_),
      full = vctrs::vec_c(ccn::regions$office_full, NA_character_)
    )
  )
}

# recode_medicaid_type(c("A", "K", NA))
#' @noRd
recode_medicaid_type <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c(ccn::medicaid_types$code, NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::medicaid_types$abbr, NA_character_),
      full = vctrs::vec_c(ccn::medicaid_types$desc, NA_character_)
    )
  )
}

# recode_unit_type(c("M", "T", "Z", NA))
#' @noRd
recode_unit_type <- function(x, as = c("abbr", "full", "infix", "eipps")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c(ccn::unit_types$code, NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::unit_types$abbr, NA_character_),
      full = vctrs::vec_c(ccn::unit_types$desc, NA_character_),
      infix = vctrs::vec_c(ccn::unit_types$infix, NA_character_),
      eipps = vctrs::vec_c(ccn::unit_types$eipps, NA)
    )
  )
}

# recode_subunit_type(c("A", "K", NA))
#' @noRd
recode_subunit_type <- function(x, as = c("prefix", "abbr")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c(ccn::subunit_types$code, NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::subunit_types$abbr, NA_character_),
      prefix = vctrs::vec_c(ccn::subunit_types$prefix, NA_character_)
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
        "ERH-N",
        "ERH-F",
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
