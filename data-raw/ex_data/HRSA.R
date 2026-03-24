"C:/Users/Andrew/Desktop/HRSA/asc.csv"
path <- fs::path_home("Desktop/HRSA")
files <- fs::dir_ls(path)
files <- rlang::set_names(files, tools::file_path_sans_ext(basename(files)))

names(files)

asc |>
  names() |>
  fuimus::create_vec()

asc_cols <- c(
  name_1 = "FACILITY_NM",
  ccn = "CMS_PROVIDER_NUM",
  opr_ct = "OPERATING_ROOM_CT",
  city = "CMS_PROVIDER_CITY",
  state = "CMS_PROVIDER_STATE_ABBR"
  # address = "CMS_PROVIDER_ADDRESS",
  # zip = "CMS_PROVIDER_ZIP_CD"
  # fax = "FAX_NUM",
  # phone = "PHONE_NUM",
  # cat = "CMS_PROVIDER_CAT_CD", # ALL "15"
  # cat_desc = "CMS_PROVIDER_CAT_DESC", # ALL "Ambulatory Surgical Center"
  # sub = "CMS_PROVIDER_CAT_SUB_TYP_CD", # ALL "01"
  # sub_desc = "CMS_PROVIDER_CAT_SUB_TYP_DESC", # ALL "Ambulatory Surgical Center"
  # free_ind = "FREE_STANDING_IND", # ALL NA
  # hosp_ind = "HOSPITAL_BASED_IND", # ALL NA
  # obj_id = "OBJECTID", # ???
)

asc <- vroom::vroom(
  files["asc"],
  col_types = strrep("c", 16),
  num_threads = 4L,
  show_col_types = FALSE
) |>
  collapse::rnm(asc_cols) |>
  collapse::gv(names(asc_cols)) |>
  collapse::join(get_pin("asc"), how = "f") |>
  collapse::rnm(name_2 = "facility_name") |>
  collapse::colorder(name_1, name_2) |>
  collapse::mtt(opr_ct = as.integer(opr_ct), same = name_1 == name_2) |>
  collapse::fcount(ccn, add = TRUE)

asc |> cheapr::overview()

collapse::sbt(asc, !same)
collapse::sbt(asc, N > 1)

provider::provider_type_code[
  provider::provider_type_code$spec_description == "AMBULATORY SURGICAL CENTER",
] |>
  print(n = Inf)
