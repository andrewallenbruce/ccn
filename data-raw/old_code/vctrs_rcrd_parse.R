# examples <- cheapr::na_insert(ccn:::get_pin("ccn"), prop = 0.25)
library(ccn)

i <- index_types(x)
tibble::tibble(
  x = x,
  ccn = as_ccn(x)
)
x[i$unit]
vctrs::vec_slice(x, i$unit)
collapse::ss(x, i$unit)

x <- get_pin("ccn")
x <- as_ccnr(x)
x <- tibble::as_tibble(vctrs::vec_data(x))
x$state <- decode_state(x$state)
x$number <- as.integer(x$number)
x
ccn::medicare_ranges

n <- ivs::new_iv(1L, 880L, abbr = "ACUTE", class = "care")
unclass(n)
attr(n, "abbr")
ivs::iv_between(as.integer(vctrs::vec_slice(x, x$form == "care")$number), n)
#' @noRd
medicare_range <- function(x) {
  check_range(x, c(1L, 9999L), "Medicare")

  ccn::medicare_ranges$range[
    data.table::between(
      as.integer(x),
      ccn::medicare_ranges$start,
      ccn::medicare_ranges$end
    )
  ]
}

#' @noRd
medicare_range_abbr <- function(x) {
  vs(x, ccn::medicare_ranges$range, ccn::medicare_ranges$abbr)
}
