# decode_medicare_range(c(1L, 2099L, NA))
#' @noRd
decode_medicare_range <- function(x, as = c("abbr", "range", "full")) {
  vctrs::vec_slice(
    switch(
      rlang::arg_match(as),
      abbr = ccn::medicare_ranges$abbr,
      full = ccn::medicare_ranges$desc,
      range = ccn::medicare_ranges$range
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
      abbr = ccn::medicaid_ranges$abbr,
      full = ccn::medicaid_ranges$desc,
      range = ccn::medicaid_ranges$range
    ),
    ivs::iv_locate_between(x, ccn::medicaid_ranges$iv)$haystack
  )
}
