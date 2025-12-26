library(ccn)

hha <- ccn:::get_pin("hha")$ccn

substring(hha, 3L, 6L) |>
  ccn:::is_numeric() |>
  all()

ltch <- get_pin("ltch")

scramble <- sample(hha, 100000, replace = TRUE)

bench::mark(
  medicare = purrr::map(scramble, medicare_),
  medicare2 = purrr::map(scramble, medicare_2),
  check = FALSE
)

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

medicare_ <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L), c(2L, 6L)) |>
        `names<-`(c("state", "sequence"))
    ) |>
      as.list(),
    class = "medicare"
  )
}

medicare_2 <- function(x) {
  structure(
    c(
      ccn = x,
      substring(x, c(1L, 3L), c(2L, 6L)) |>
        `names<-`(c("state", "sequence"))
    ),
    class = "medicare"
  )
}

bench::mark(
  medicare = purrr::map(ltch$ccn, medicare_)
)
