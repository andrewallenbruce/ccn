library(collapse)

txc <- readr::read_csv(
  file = fs::path(
    "C:/Users/Andrew/Downloads/Approved_Transplant_Programs_20251203.csv"
  ),
  num_threads = 4L
) |>
  janitor::clean_names() |>
  collapse::roworder(ccn, state) |>
  collapse::slt(
    ccn,
    state,
    txc_code = transplant_program_type_code,
    txc_type = transplant_program_type,
    optn_code
  ) |>
  collapse::funique()

lobstr::obj_size(txc)

# txc === 883 × 13 [70.24 kB]
pin_update(
  txc,
  name = "txc",
  title = "Approved_Transplant_Programs_20251203",
  description = "Approved_Transplant_Programs_20251203"
)
