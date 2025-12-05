library(ccn)

list_pins()

ltch <- get_pin("ltch")

bench::mark(
  medicare = purrr::map(ltch$ccn, medicare))

x <- purrr::map(ltch$ccn, medicare)

x[1]

# supplier(5500 ccns)
# min,     5.56s
# med,     5.56s
# tot,     5.56s
# mem,     43.3KB
# itr/sec, 0.180
# gc/sec,  1.80
# n_itr,   1
# n_gc,    10

# medicare(324 ccns)
# min, 298ms
# med, 317ms
# itr/sec, 3.15
# mem_alloc, 2.58KB
# gc/sec, 3.15
# n_itr, 2
# n_gc, 2
# total_time, 635ms
