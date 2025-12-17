x <- get_pin("ccn")

x <- collapse::rsplit(x, collapse::vlengths(x))

# Subunits
two_alpha <- x$`6`[stringr::str_which(x$`6`, "[A-Z]{2}")] |>
  purrr::map(\(x) ccn::parse(x) |> as.data.frame()) |>
  collapse::rowbind(fill = TRUE) |>
  tibble::as_tibble()

# Units, Emergency, Organ, Medicaid
one_alpha <- x$`6`[stringr::str_which(x$`6`, "[A-Z]{1}")]

one_alpha <- one_alpha[!one_alpha %in% two_alpha$ccn]

one_alpha <- one_alpha |>
  purrr::map(\(x) ccn::parse(x) |> as.data.frame()) |>
  collapse::rowbind(fill = TRUE) |>
  tibble::as_tibble()

one_alpha |>
  collapse::fcount(type, parent) |>
  print(n = Inf)
