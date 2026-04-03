## code to prepare `opo` dataset goes here

usethis::use_data(opo, overwrite = TRUE)

x <- ccn:::get_pin("opo")

code_name <- x$opo_codes |>
  collapse::roworder(code) |>
  collapse::rnm(name = opo)

state_code <- x$opo_county |>
  collapse::slt(state, code) |>
  collapse::funique() |>
  collapse::roworder(state, code)

collapse::join(
  state_code,
  code_name
) |>
  print(n = Inf)

x$opo_active |>
  collapse::roworder(ccn) |>
  collapse::slt(-region, -orig_date) |>
  collapse::join(x$opo_county) |>
  print(n = Inf)

cnty <- x$opo_county |>
  collapse::slt(-code) |>
  collapse::roworder(state, county) |>
  collapse::fgroup_by(state) |>
  collapse::fsummarise(counties = length(county)) |>
  collapse::fungroup()
