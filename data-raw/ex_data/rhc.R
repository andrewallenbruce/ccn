library(collapse)

rhc <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/RHC_Enrollments_Q4_2025.csv"),
  col_select = c(4, 7, 9:10, 19),
  num_threads = 4L
) |>
  janitor::clean_names() |>
  collapse::roworder(ccn, state) |>
  collapse::slt(
    ccn,
    state,
    org_name = organization_name,
    dba_name = doing_business_as_name
  ) |>
  collapse::funique()

lobstr::obj_size(rhc)

rhc <- ccn:::get_pin("rhc")

# rhc === 5461 × 5 [1.05 MB]
pin_update(
  rhc,
  name = "rhc",
  title = "RHC_Enrollments_Q4_2025",
  description = "RHC_Enrollments_Q4_2025"
)
