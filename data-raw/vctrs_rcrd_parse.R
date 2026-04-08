# examples <- cheapr::na_insert(ccn:::get_pin("ccn"), prop = 0.25)
library(ccn)
x <- ccn:::get_pin("ccn")
x <- as_ccn(x)
i <- index_types(x)
x <- vec_data(x)

ccnr_care <- function(x) {
  ccnr(
    form = "care",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 6L),
    type = NA_character_,
    parent = NA_character_,
    ext = NA_character_
  )
}

df <- ccnr_care(x[i$medicare])

ccnr_supp <- function(x) {
  ccnr(
    form = "supp",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 10L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

df <- ccnr_supp(x[i$supplier])

ccnr_unit <- function(x) {
  ccnr(
    form = "unit",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

df <- ccnr_unit(x[i$unit])

ccnr_sub <- function(x) {
  ccnr(
    form = "sub",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 5L, 6L),
    type = substring(x, 3L, 3L),
    parent = substring(x, 4L, 4L),
    ext = NA_character_
  )
}

df <- ccnr_sub(x[i$subunit])

ccnr_erh <- function(x) {
  ccnr(
    form = "erh",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 5L),
    type = substring(x, 6L, 6L),
    parent = NA_character_,
    ext = NA_character_
  )
}

df <- ccnr_erh(x[i$emergency])

ccnr_unit_ext <- function(x) {
  ccnr(
    form = "unit",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = substring(x, first = 7L)
  )
}

df <- ccnr_unit_ext(x[i$unit_ext])

ccnr_caid <- function(x) {
  ccnr(
    form = "caid",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

df <- ccnr_caid(x[i$medicaid])

ccnr_caid_ext <- function(x) {
  ccnr(
    form = "caid",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = substring(x, first = 7L)
  )
}

df <- ccnr_caid_ext(x[i$medicaid])

ccnr_care_ext <- function(x) {
  ccnr(
    form = "care",
    ccn = substring(x, 1L, 6L),
    state = substring(x, 1L, 2L),
    number = substring(x, 3L, 6L),
    type = NA_character_,
    parent = NA_character_,
    ext = substring(x, first = 7L)
  )
}

df <- ccnr_care_ext(x[i$medicare_ext])

ccnr_opo <- function(x) {
  ccnr(
    form = "opo",
    ccn = x,
    state = substring(x, 1L, 2L),
    number = substring(x, 4L, 6L),
    type = substring(x, 3L, 3L),
    parent = NA_character_,
    ext = NA_character_
  )
}

df <- ccnr_opo(x[i$organ])
tibble::tibble(ccn = df)
vec_data(df)
