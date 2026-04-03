## code to prepare `txc` dataset goes here

usethis::use_data(txc, overwrite = TRUE)

# Procedures
ccn:::get_pin("txc") |>
  collapse::slt(txc = txc_code, description = txc_type) |>
  collapse::funique()

# Facilities
ccn:::get_pin("txc") |>
  collapse::slt(-txc_type) |>
  collapse::rnm(code = optn_code, txc = txc_code) |>
  collapse::funique() |>
  collapse::roworder(ccn, state, code) |>
  collapse::fgroup_by(ccn, state, code) |>
  collapse::fsummarise(txc = toString(txc)) |>
  collapse::fungroup()
