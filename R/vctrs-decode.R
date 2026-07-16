# decode_state(c("00", "01", "A5", NA))
#' @noRd
decode_state <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c(ccn::states$code, NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::states$abbr, NA_character_),
      full = vctrs::vec_c(ccn::states$name, NA_character_)
    )
  )
}

# decode_medicaid_type(c("A", "K", NA))
#' @noRd
decode_medicaid_type <- function(x, as = c("abbr", "full")) {
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

# decode_medicare_range(c(1L, 2099L, NA))
#' @noRd
decode_medicare_range <- function(x, as = c("abbr", "range", "full")) {
  vctrs::vec_slice(
    switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::medicare_ranges$abbr, NA_character_),
      full = vctrs::vec_c(ccn::medicare_ranges$desc, NA_character_),
      range = vctrs::vec_c(ccn::medicare_ranges$range, NA_character_)
    ),
    ivs::iv_locate_between(x, ccn::medicare_ranges$iv)$haystack
  )
}

# decode_medicaid_range(c(1L, 209L, NA, 1000))
#' @noRd
decode_medicaid_range <- function(x, as = c("abbr", "range", "full")) {
  vctrs::vec_slice(
    switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(ccn::medicaid_ranges$abbr, NA_character_),
      full = vctrs::vec_c(ccn::medicaid_ranges$desc, NA_character_),
      range = vctrs::vec_c(ccn::medicaid_ranges$range, NA_character_)
    ),
    ivs::iv_locate_between(x, ccn::medicaid_ranges$iv)$haystack
  )
}

# decode_unit_type(c("M", "T", "Z", NA))
#' @noRd
decode_unit_type <- function(x, as = c("abbr", "full", "infix", "eipps")) {
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

# decode_subunit_type(c("A", "K", NA))
#' @noRd
decode_subunit_type <- function(x, as = c("prefix", "abbr")) {
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

# decode_other_type(c("C", "D", "E", "F", "P", "X", NA))
#' @noRd
decode_other_type <- function(x, as = c("abbr", "full")) {
  vctrs::vec_recode_values(
    x,
    from = vctrs::vec_c("C", "D", "E", "F", "P", "X", NA_character_),
    to = switch(
      rlang::arg_match(as),
      abbr = vctrs::vec_c(
        "ASC",
        "CLIA",
        "NON",
        "FED",
        "OPO",
        "PXRF",
        NA_character_
      ),
      full = vctrs::vec_c(
        "Ambulatory Surgical Center",
        "Clinical Laboratory",
        "Non-Federal",
        "Federal",
        "Organ Procurement Organization",
        "Portable X-Ray Facility",
        NA_character_
      )
    )
  )
}
