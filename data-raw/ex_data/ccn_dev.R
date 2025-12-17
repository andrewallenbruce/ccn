to_df <- \(x) {
  purrr::map(x, \(x) ccn::parse(x) |> as.data.frame()) |>
    collapse::rowbind(fill = TRUE) |>
    fastplyr::as_tbl()
}

x <- get_pin("ccn")

x <- collapse::rsplit(x, collapse::vlengths(x)) |>
  rlang::set_names("six", "seven", "eight", "nine", "ten")

# Medicare
x_medicare <- x$six[is_numeric(substring(x$six, 3L, 6L))]

# Units
x_unit <- x$six[
  is_unit_type(substring(x$six, 3L, 3L)) &
    is_numeric(substring(x$six, 4L, 6L))
]

# Emergency
x_emergency <- x$six[is_emergency_type(substring(x$six, 6L, 6L))]

# Subunit
x_subunit <- x$six[is_subunit_type(substring(x$six, 4L, 4L))]

x_medicare |> to_df()
x_unit |> to_df()
x_emergency |> to_df()
x_subunit |> to_df()

purrr::map(x$seven, ccn::parse)
purrr::map(x$eight, ccn::parse)
purrr::map(x$nine, ccn::parse)
# purrr::map(x$ten, ccn::parse)
