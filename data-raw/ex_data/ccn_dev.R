to_df <- \(x) {
  purrr::map(x, \(x) ccn::parse(x) |> as.data.frame()) |>
    collapse::rowbind(fill = TRUE) |>
    fastplyr::as_tbl()
}

x <- get_pin("ccn")

x <- collapse::rsplit(x, collapse::vlengths(x)) |>
  rlang::set_names("six", "seven", "eight", "nine", "ten")

# Medicare 43,198
CARE <- x$six[is_numeric(substring(x$six, 3L, 6L))]
ELSE <- x$six[!is_numeric(substring(x$six, 3L, 6L))]

# No OPOs
# ELSE[substr(ELSE, 3, 3)  == "P"]

# Emergency Hospitals
ERHS <- ELSE[substr(ELSE, 6, 6) %in% c("E", "F")]
ELSE <- ELSE[!ELSE %in% ERHS]

# No Medicaid
# ELSE[substring(ELSE, 3L, 3L) %in% c("A", "B", "E", "F", "G", "H", "J", "K", "L")]

# Hospital Units
UNIT <- ELSE[
  substr(ELSE, 3, 3) %in%
    c("M", "R", "S", "T", "U", "V", "W", "Y", "Z") &
    is_numeric(substring(ELSE, 4L, 4L))
]
ELSE <- ELSE[!ELSE %in% UNIT]

# Hospital Subunits
SUB <- ELSE[
  substr(ELSE, 3, 3) %in%
    c("M", "R", "S", "T", "U", "V", "W", "Y", "Z") &
    substr(ELSE, 4L, 4L) %in%
      c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K")
]
ELSE <- ELSE[!ELSE %in% SUB]

list(CARE, ERHS, UNIT, SUB)


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
