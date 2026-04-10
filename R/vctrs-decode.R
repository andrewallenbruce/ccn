# decode_state(c("00", "01", "A5", NA))
#' @noRd
decode_state <- function(x) {
  vec_recode_values(
    x,
    from = vec_c(ccn::states$code, NA_character_),
    to = vec_c(ccn::states$abbr, NA_character_)
  )
}

# decode_medicare_range(c(1L, 2099L, NA))
#' @noRd
decode_medicare_range <- function(x) {
  vec_slice(
    ccn::medicare_ranges$abbr,
    ivs::iv_locate_between(
      x,
      iv_medicare
    )$haystack
  )
}

# decode_medicaid_range(c(1L, 209L, NA))
#' @noRd
decode_medicaid_range <- function(x) {
  vec_slice(
    ccn::medicaid_ranges$abbr,
    ivs::iv_locate_between(
      x,
      iv_medicaid
    )$haystack
  )
}

#' @noRd
iv_medicaid <- ivs::iv(
  c(1L, 100L, 200L, 300L, 400L, 500L, 600L),
  c(99L, 199L, 299L, 399L, 499L, 599L, 999L) + 1L
)

#' @noRd
iv_medicare <- ivs::iv(
  c(
    1L,
    880L,
    900L,
    1000L,
    1200L,
    1225L,
    1300L,
    1400L,
    1500L,
    1800L,
    1990L,
    2000L,
    2300L,
    2500L,
    2900L,
    3000L,
    3025L,
    3100L,
    3200L,
    3300L,
    3400L,
    3500L,
    3700L,
    3800L,
    3975L,
    4000L,
    4500L,
    4600L,
    4800L,
    4900L,
    5000L,
    6500L,
    6990L,
    7000L,
    7300L,
    7400L,
    7800L,
    8000L,
    8500L,
    8900L,
    9000L,
    9800L,
    9900L
  ),
  c(
    879L,
    899L,
    999L,
    1199L,
    1224L,
    1299L,
    1399L,
    1499L,
    1799L,
    1989L,
    1999L,
    2299L,
    2499L,
    2899L,
    2999L,
    3024L,
    3099L,
    3199L,
    3299L,
    3399L,
    3499L,
    3699L,
    3799L,
    3974L,
    3999L,
    4499L,
    4599L,
    4799L,
    4899L,
    4999L,
    6499L,
    6989L,
    6999L,
    7299L,
    7399L,
    7799L,
    7999L,
    8499L,
    8899L,
    8999L,
    9799L,
    9899L,
    9999L
  ) +
    1L
)
