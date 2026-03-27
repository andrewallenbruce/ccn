library(collapse)

snf <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/SNF_Enrollments_Dec_2025.csv"),
  col_select = c(1:2),
  num_threads = 4L
) |>
  janitor::clean_names() |>
  collapse::roworder(ccn, state)

lobstr::obj_size(snf)

snf <- ccn:::get_pin("snf")

# snf === 14,437 × 2 [1.05 MB]
pin_update(
  snf,
  name = "snf",
  title = "SNF Enrollments Dec 2025",
  description = "SNF Enrollments Dec 2025"
)

# ================================================
# 04 - Skilled Nursing Facility
# 01 - Title 18 Only
# No Medicaid Beds
# ================================================
snf_all_cols <- c(
  name = "FACILITY_NM",
  ccn = "CMS_PROVIDER_NUM",
  city = "CMS_PROVIDER_CITY",
  state = "CMS_PROVIDER_STATE_ABBR",
  # beds_mcd = "MEDICAID_SNF_BED_CT", # ALL NA
  beds_mcr = "MEDICARE_SNF_BED_CT",
  beds_dual = "MEDICARE_MEDICAID_SNF_BED_CT",
  beds_cert = "CERTIFIED_BED_CT",
  beds_tot = "TOT_BED_CT"
)

snf_all <- vroom::vroom(
  files["snf_all"],
  col_types = strrep("c", 18),
  num_threads = 4L,
  show_col_types = FALSE
) |>
  collapse::rnm(snf_all_cols) |>
  collapse::gv(names(snf_all_cols)) |>
  collapse::mtt(
    beds_cert = as.integer(beds_cert),
    # beds_mcd = as.integer(beds_mcd),
    beds_dual = as.integer(beds_dual),
    beds_mcr = as.integer(beds_mcr),
    beds_tot = as.integer(beds_tot)
  )

snf_all
# ================================================
# 03 - Skilled Nursing Facilities/Nursing Facility (Distinct Part)
# 03 - Title 18/19
# No Medicaid Beds
# ================================================
snf_dual <- vroom::vroom(
  files["snf_dual"],
  col_types = strrep("c", 18),
  num_threads = 4L,
  show_col_types = FALSE
) |>
  collapse::rnm(snf_all_cols) |>
  collapse::gv(names(snf_all_cols)) |>
  collapse::mtt(
    beds_cert = as.integer(beds_cert),
    # beds_mcd = as.integer(beds_mcd),
    beds_dual = as.integer(beds_dual),
    beds_mcr = as.integer(beds_mcr),
    beds_tot = as.integer(beds_tot)
  )

snf_dual
# ================================================
# 03 - Skilled Nursing Facilities/Nursing Facility (Distinct Part)
# 03 - Title 18/19
# No Medicaid Beds
# ================================================
snf_dist <- vroom::vroom(
  files["snf_dist"],
  col_types = strrep("c", 18),
  num_threads = 4L,
  show_col_types = FALSE
) |>
  collapse::rnm(snf_all_cols) |>
  collapse::gv(names(snf_all_cols)) |>
  collapse::mtt(
    beds_cert = as.integer(beds_cert),
    # beds_mcd = as.integer(beds_mcd),
    beds_dual = as.integer(beds_dual),
    beds_mcr = as.integer(beds_mcr),
    beds_tot = as.integer(beds_tot)
  )

snf_dist |> collapse::fcount(beds_mcd)
