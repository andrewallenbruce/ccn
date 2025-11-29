library(collapse)
# list_pins()
ccn_asc  <- get_pin("asc_facility")$facility_id |> collapse::funique()
ccn_hha  <- get_pin("hha_enrollment")$ccn |> collapse::funique()
ccn_esrd <- get_pin("dialysis_facility")$ccn |> collapse::funique()
ccn_irf  <- get_pin("irf_facility")$ccn |> collapse::funique()
ccn_ltch <- get_pin("ltch")$ccn |> collapse::funique()
ccn_aff  <- c(get_pin("fac_aff")$parent$ccn_facility, get_pin("fac_aff")$subunit$ccn_facility, get_pin("fac_aff")$subunit$ccn_facility) |> collapse::funique()
ccn_hsp  <- c(get_pin("hospital_enrollment")$alphanumeric_ccn$ccn, get_pin("hospital_enrollment")$numeric_ccn$ccn, get_pin("hospital_enrollment")$other_ccn$ccn) |> collapse::funique()

ccn_vec <- vctrs::vec_c(
  ccn_asc,
  ccn_aff,
  ccn_hha,
  ccn_hsp,
  ccn_esrd,
  ccn_irf,
  ccn_ltch
) |>
  collapse::funique() |>
  kit::psort(nThread = 4L) |>
  stringfish::convert_to_sf()

pin_update(
  ccn_vec,
  name = "ccn_vec",
  title = "Vector of CCNs",
  description = "Vector of 52,041 Unique CCNs")
