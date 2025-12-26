library(collapse)

snf <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/SNF_Enrollments_Dec_2025.csv"),
  col_select = c(1:2),
  num_threads = 4L
) |>
  janitor::clean_names() |>
  collapse::roworder(ccn, state)

lobstr::obj_size(snf)

# snf === 14,437 × 2 [1.05 MB]
pin_update(
  snf,
  name = "snf",
  title = "SNF Enrollments Dec 2025",
  description = "SNF Enrollments Dec 2025"
)
