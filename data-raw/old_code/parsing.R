list_pins()

asc <- get_pin("asc")


length(asc$ccn)

sum(
  stringr::str_count(asc$ccn, "([0-9A-B][0-9])([CDX])([0-9]{7})"),
  na.rm = TRUE
)

asc$ccn[stringr::str_detect(asc$ccn, "([0-9A-B][0-9])([CDX])([0-9]{7})", negate = TRUE)]


supp_ex <- function(x) {
  c(
    ccn = x,
    entity = "Supplier",
    X = strsplit(gsub(pattern = "([0-9A-B][0-9])([CDX])([0-9]{7})", replacement = "\\1 \\2 \\3", x = x, perl = TRUE), split = " ", fixed = TRUE)
  ) |>
    unlist_()
}

x <- purrr::map(asc$ccn, supp_ex)
head(x, 20)

x <- collapse::unlist2d(x) |>
  fastplyr::as_tbl() |>
  collapse::slt(
    .id,
    ccn = V1,
    entity = V2,
    state_code = V3,
    type_code = V4,
    sequence = V5
  )

purrr::map_chr(x, ~ purrr::pluck(.x, "ccn"))
purrr::map_chr(x, ~ purrr::pluck(.x, "entity"))
purrr::map_chr(x, ~ purrr::pluck(.x, "X1"))
purrr::map_chr(x, ~ purrr::pluck(.x, "X2"))
purrr::map_chr(x, ~ purrr::pluck(.x, "X3"))
