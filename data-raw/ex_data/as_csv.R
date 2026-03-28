x <- list_pins()

get_pin(x[1])

x <- purrr::map(x, get_pin) |>
  rlang::set_names(x)

as_csv <- function(root, name = "asc") {
  readr::write_csv(
    x = root[[name]],
    file = fs::path(
      fs::path_home("Desktop/Repositories/HRSA/CCN/"),
      name,
      ext = "csv")
    )
}

x$ccn <- cheapr::fast_df(ccn = x$ccn)

as_csv(x, "ccn")
