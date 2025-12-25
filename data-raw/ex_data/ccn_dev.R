to_df <- \(x) {
  purrr::map(x, \(x) ccn::parse(x) |> as.data.frame()) |>
    collapse::rowbind(fill = TRUE) |>
    fastplyr::as_tbl()
}

x <- get_pin("ccn")

x <- collapse::rsplit(x, collapse::vlengths(x)) |>
  rlang::set_names("six", "seven", "eight", "nine", "ten")

# Medicare 43,198
x_medicare <- x$six[is_numeric(substring(x$six, 3L, 6L))]

# Units 3199
x_unit <- x$six[
  is_unit_type(substring(x$six, 3L, 3L)) &
    is_numeric(substring(x$six, 4L, 6L))
]

# 1676
x_unit[!substring(x_unit, 3L, 3L) %in% c("S", "T", "V")]

# Emergency 166
x_emergency <- x$six[is_emergency_type(substring(x$six, 6L, 6L))]

# Subunit 49
x_subunit <- x$six[is_subunit_type(substring(x$six, 4L, 4L))]

to_df(x_medicare)
to_df(x_unit)
to_df(x_emergency)
to_df(x_subunit)

bench::mark(
  to_df(x$six)
)

purrr::map(x$seven, ccn::parse)
purrr::map(x$eight, ccn::parse)
purrr::map(x$nine, ccn::parse)
# purrr::map(x$ten, ccn::parse)

irf <- get_pin("irf")

unit_parent_incomplete <- purrr::map(irf$ccn, data_frame) |>
  data.table::rbindlist() |>
  collapse::sbt(entity == "unit" & substring(parent, 3L, 3L) == "_") |>
  _$parent

purrr::map(c(unit_parent, irf$ccn), data_frame) |>
  data.table::rbindlist() |>
  fastplyr::as_tbl()

# language to_df(x$six) [46609]
# min       : 'bench_time' num 24.6s
# median    : 'bench_time' num 24.6s
# itr/sec   : num 0.0407
# mem_alloc : 'bench_bytes' num 3.75MB
# gc/sec    : num 2.15
# n_itr     : int 1
# n_gc      : num 53
# total_time: 'bench_time' num 24.6s
