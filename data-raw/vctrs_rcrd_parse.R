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
