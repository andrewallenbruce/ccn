ccn_dataset_info |>
  collapse::sbt(catalog == "prov") |>
  collapse::fcount(alias) |>
  collapse::roworder(alias) |>
  print(n = Inf)
  collapse::sbt(title == "Medicare Durable Medical Equipment, Devices & Supplies - by Supplier") |>
  collapse::fcount(alias, field) |>
  print(n = Inf)

ccn_dataset_info <- providertwo:::field_table() |>
  collapse::sbt(
    catalog != "open" &
      point == "temporal" &
      stringr::str_detect(field, "ccn|CCN|Ccn|certification_number") &
      stringr::str_detect(alias, "_chow$", negate = TRUE)
  ) |>
  collapse::funique(cols = "alias") |>
  collapse::roworder(catalog, point, alias) |>
  collapse::slt(catalog, alias, title)


ccn_dataset_info |>
  collapse::sbt(catalog == "care") |>
  _$alias |>
  cat(sep = "\n")

c("fqhc_enroll",
  "hha_enroll",
  "hosp_enroll",
  "rhc_enroll",
  "snf_enroll",
  "spice_enroll")

# "dial_facility"
# "hha_cost"
# "hosp_cost"
"in_prov"
"in_serv"
"mds_nh_fac"
"out_serv"
# "snf_cost"
