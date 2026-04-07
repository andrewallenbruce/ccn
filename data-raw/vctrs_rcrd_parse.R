# examples <- cheapr::na_insert(ccn:::get_pin("ccn"), prop = 0.25)
library(ccn)
x <- ccn:::get_pin("ccn")
x <- as_ccn(x)
i <- infer_form(x)
x <- vec_data(x)


df <- ccnr(
  ccn = x[i$medicare],
  form = vec_rep("medicare", vec_size(x[i$medicare])),
  state = substring(x[i$medicare], 1L, 2L),
  number = substring(x[i$medicare], 3L, 6L),
  type = vec_rep(NA_character_, vec_size(x[i$medicare])),
  parent = vec_rep(NA_character_, vec_size(x[i$medicare])),
  ext = vec_rep(NA_character_, vec_size(x[i$medicare]))
  )

tibble::tibble(ccn = df)

df <- ccnr(
  ccn = x[i$supplier],
  form = vec_rep("supplier", vec_size(x[i$supplier])),
  state = substring(x[i$supplier], 1L, 2L),
  number = substring(x[i$supplier], 4L, 10L),
  type = substring(x[i$supplier], 3L, 3L),
  parent = vec_rep(NA_character_, vec_size(x[i$supplier])),
  ext = vec_rep(NA_character_, vec_size(x[i$supplier]))
)

tibble::tibble(ccn = df)

df <- ccnr(
  ccn = x[i$unit],
  form = vec_rep("unit", vec_size(x[i$unit])),
  state = substring(x[i$unit], 1L, 2L),
  number = substring(x[i$unit], 4L, 6L),
  type = substring(x[i$unit], 3L, 3L),
  parent = vec_rep(NA_character_, vec_size(x[i$unit])),
  ext = vec_rep(NA_character_, vec_size(x[i$unit]))
)

tibble::tibble(ccn = df)

df <- ccnr(
  ccn = x[i$subunit],
  form = vec_rep("subunit", vec_size(x[i$subunit])),
  state = substring(x[i$subunit], 1L, 2L),
  number = substring(x[i$subunit], 5L, 6L),
  type = substring(x[i$subunit], 3L, 3L),
  parent = substring(x[i$subunit], 4L, 4L),
  ext = vec_rep(NA_character_, vec_size(x[i$subunit]))
)

vec_proxy(df)

tibble::tibble(ccn = df)

df <- ccnr(
  ccn = x[i$emergency],
  form = vec_rep("emergency", vec_size(x[i$emergency])),
  state = substring(x[i$emergency], 1L, 2L),
  number = substring(x[i$emergency], 3L, 5L),
  type = substring(x[i$emergency], 6L, 6L),
  parent = vec_rep(NA_character_, vec_size(x[i$emergency])),
  ext = vec_rep(NA_character_, vec_size(x[i$emergency]))
)

tibble::tibble(ccn = df)

df <- ccnr(
  ccn = substring(x[i$unit_ext], 1L, 6L),
  form = vec_rep("unit", vec_size(x[i$unit_ext])),
  state = substring(x[i$unit_ext], 1L, 2L),
  number = substring(x[i$unit_ext], 4L, 6L),
  type = substring(x[i$unit_ext], 3L, 3L),
  parent = vec_rep(NA_character_, vec_size(x[i$unit_ext])),
  ext = substring(text = x[i$unit_ext], first = 7L)
)

tibble::tibble(ccn = df)

x[i$medicaid_ext]

x <- collapse::gsplit(
  x,
  nchar(x[i$medicare_ext]),
  use.g.names = TRUE
  )

x$`7` <- substr(
  x$`7`,
  vctrs::vec_c(1L, 3L, 7L),
  vctrs::vec_c(2L, 6L, 7L)
)

mx$`8` <- substring(
  mx$`8`,
  vctrs::vec_c(1L, 3L, 7L),
  vctrs::vec_c(2L, 6L, 8L)
)

mx$`9` <- substring(
  mx$`9`,
  c(1L, 3L, 7L),
  c(2L, 6L, 9L)
)

ix <- seq_along(mx$`7`) %% 3L
mx$`7`[ix == 1L]
mx$`7`[ix == 2L]
mx <- collapse::gsplit(mx$`7`, seq_along(mx$`7`) %% 3L) |>
  rlang::set_names(c("ext", "state", "number"))

vctrs::list_sizes(i)
