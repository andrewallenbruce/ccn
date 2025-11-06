library(collapse)

#-----HOME HEALTH AGENCY ENROLLMENT-----
hha <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/HHA_Enrollments_2025.10.01.csv"),
  col_types = readr::cols(
    `ENROLLMENT ID`                = readr::col_character(),
    `ENROLLMENT STATE`             = readr::col_character(),
    `PROVIDER TYPE CODE`           = readr::col_character(),
    `PROVIDER TYPE TEXT`           = readr::col_character(),
    NPI                            = readr::col_integer(),
    `MULTIPLE NPI FLAG`            = readr::col_character(),
    CCN                            = readr::col_character(),
    `ASSOCIATE ID`                 = readr::col_character(),
    `ORGANIZATION NAME`            = readr::col_character(),
    `DOING BUSINESS AS NAME`       = readr::col_character(),
    `INCORPORATION DATE`           = readr::col_character(),
    `INCORPORATION STATE`          = readr::col_character(),
    `ORGANIZATION TYPE STRUCTURE`  = readr::col_character(),
    `ORGANIZATION OTHER TYPE TEXT` = readr::col_character(),
    PROPRIETARY_NONPROFIT          = readr::col_character(),
    `ADDRESS LINE 1`               = readr::col_character(),
    `ADDRESS LINE 2`               = readr::col_character(),
    CITY                           = readr::col_character(),
    STATE                          = readr::col_character(),
    `ZIP CODE`                     = readr::col_character(),
    `PRACTICE LOCATION TYPE`       = readr::col_character(),
    `LOCATION OTHER TYPE TEXT`     = readr::col_logical()),
  num_threads = 4L) |>
  janitor::clean_names() |>
  collapse::mtt(
    inc_date = readr::parse_date(incorporation_date, format = "%m/%d/%Y"),
    inc_state = incorporation_state,
    address = providertwo:::make_address(address_line_1, address_line_2),
    multi_npi = cheapr::val_match(multiple_npi_flag, "Y" ~ 1L, "N" ~ 0L, .default = NA_integer_)) |>
  collapse::slt(
    npi,
    ccn,
    enid = enrollment_id,
    multi_npi,
    pac = associate_id,
    org_name = organization_name,
    dba_name = doing_business_as_name,
    prop_non = proprietary_nonprofit,
    org_type = organization_type_structure,
    org_other = organization_other_type_text,
    address,
    city,
    zip = zip_code,
    inc_date,
    enid_state = enrollment_state,
    inc_state,
    loc_state = state)



# both enid and ccn are unique
pin_update(
  hha,
  name = "hha_enrollment",
  title = "Home Health Enrollments",
  description = "Home Health Enrollments 2025")

exemplar::exemplar(hha)

validate_hha <- function(data) {
  stopifnot(exprs = {
    is.data.frame(data)
    identical(
      colnames(data),
      c(
        "npi",
        "ccn",
        "enid",
        "multi_npi",
        "pac",
        "org_name",
        "dba_name",
        "prop_non",
        "org_type",
        "org_other",
        "address",
        "city",
        "zip",
        "inc_date",
        "enid_state",
        "inc_state",
        "loc_state"
      )
    )
    nrow(data) > 0

    "npi" %in% colnames(data)
    is.integer(data[["npi"]])
    ! any(is.na(data[["npi"]]) | is.null(data[["npi"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["npi"]]))
    min(data[["npi"]], na.rm = TRUE) > 0 # all positive
    # (Un)comment or modify the below range assertions if needed:
    max(data[["npi"]], na.rm = TRUE) <= 1992993810
    1003020306 <= min(data[["npi"]], na.rm = TRUE)
    # (Un)comment or modify the below deviance assertions if needed.
    # The mean is 1501198369.45 and the standard deviation is 288276578.59:
    max(data[["npi"]], na.rm = TRUE) <= 1501198369.45 + 4 * 288276578.59
    1501198369.45 - 4 * 288276578.59 <= max(data[["npi"]], na.rm = TRUE)
    nrow(data) > 0

    "ccn" %in% colnames(data)
    is.character(data[["ccn"]])
    ! any(is.na(data[["ccn"]]) | is.null(data[["ccn"]]))
    ! any(duplicated(data[["ccn"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["ccn"]], nchar), na.rm = TRUE) <= 7
    # 6 <= min(sapply(data[["ccn"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "enid" %in% colnames(data)
    is.character(data[["enid"]])
    ! any(is.na(data[["enid"]]) | is.null(data[["enid"]]))
    ! any(duplicated(data[["enid"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["enid"]], nchar), na.rm = TRUE) <= 15
    # 15 <= min(sapply(data[["enid"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "multi_npi" %in% colnames(data)
    is.integer(data[["multi_npi"]])
    ! any(is.na(data[["multi_npi"]]) | is.null(data[["multi_npi"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["multi_npi"]]))
    min(data[["multi_npi"]], na.rm = TRUE) >= 0 # all non-negative
    # (Un)comment or modify the below range assertions if needed:
    max(data[["multi_npi"]], na.rm = TRUE) <= 1
    0 <= min(data[["multi_npi"]], na.rm = TRUE)
    # Data is outside of mean (0.01) +/- (4 * 0.11), so Standard Deviation
    # assertions have been disabled.
    # max(data[["multi_npi"]], na.rm = TRUE) <= 0.01 + 4 * 0.11
    # 0.01 - 4 * 0.11 <= max(data[["multi_npi"]], na.rm = TRUE)
    nrow(data) > 0

    "pac" %in% colnames(data)
    is.character(data[["pac"]])
    ! any(is.na(data[["pac"]]) | is.null(data[["pac"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["pac"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["pac"]], nchar), na.rm = TRUE) <= 10
    # 10 <= min(sapply(data[["pac"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "org_name" %in% colnames(data)
    is.character(data[["org_name"]])
    ! any(is.na(data[["org_name"]]) | is.null(data[["org_name"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["org_name"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["org_name"]], nchar), na.rm = TRUE) <= 70
    # 6 <= min(sapply(data[["org_name"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "dba_name" %in% colnames(data)
    is.character(data[["dba_name"]])
    # This character vector is not valid UTF-8, so further assertionshave been skipped
    nrow(data) > 0

    "prop_non" %in% colnames(data)
    is.character(data[["prop_non"]])
    ! any(is.na(data[["prop_non"]]) | is.null(data[["prop_non"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["prop_non"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["prop_non"]], nchar), na.rm = TRUE) <= 1
    # 1 <= min(sapply(data[["prop_non"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "org_type" %in% colnames(data)
    is.character(data[["org_type"]])
    ! any(is.na(data[["org_type"]]) | is.null(data[["org_type"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["org_type"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["org_type"]], nchar), na.rm = TRUE) <= 15
    # 3 <= min(sapply(data[["org_type"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "org_other" %in% colnames(data)
    is.character(data[["org_other"]])
    # Missing values were detected so this assertion has been disabled:
    # !any(is.na(data[["org_other"]]) | is.null(data[["org_other"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["org_other"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["org_other"]], nchar), na.rm = TRUE) <= 60
    # 2 <= min(sapply(data[["org_other"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "address" %in% colnames(data)
    is.character(data[["address"]])
    ! any(is.na(data[["address"]]) | is.null(data[["address"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["address"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["address"]], nchar), na.rm = TRUE) <= 78
    # 8 <= min(sapply(data[["address"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "city" %in% colnames(data)
    is.character(data[["city"]])
    ! any(is.na(data[["city"]]) | is.null(data[["city"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["city"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["city"]], nchar), na.rm = TRUE) <= 25
    # 3 <= min(sapply(data[["city"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "zip" %in% colnames(data)
    is.character(data[["zip"]])
    ! any(is.na(data[["zip"]]) | is.null(data[["zip"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["zip"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["zip"]], nchar), na.rm = TRUE) <= 9
    # 5 <= min(sapply(data[["zip"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "inc_date" %in% colnames(data)
    class(data[["inc_date"]]) == c("Date")
    nrow(data) > 0

    "enid_state" %in% colnames(data)
    is.character(data[["enid_state"]])
    ! any(is.na(data[["enid_state"]]) |
            is.null(data[["enid_state"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["enid_state"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["enid_state"]], nchar), na.rm = TRUE) <= 2
    # 2 <= min(sapply(data[["enid_state"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "inc_state" %in% colnames(data)
    is.character(data[["inc_state"]])
    # Missing values were detected so this assertion has been disabled:
    # !any(is.na(data[["inc_state"]]) | is.null(data[["inc_state"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["inc_state"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["inc_state"]], nchar), na.rm = TRUE) <= 2
    # 2 <= min(sapply(data[["inc_state"]], nchar), na.rm = TRUE)
    nrow(data) > 0

    "loc_state" %in% colnames(data)
    is.character(data[["loc_state"]])
    ! any(is.na(data[["loc_state"]]) | is.null(data[["loc_state"]]))
    # Duplicate values were detected so this assertion has been disabled:
    # !any(duplicated(data[["loc_state"]]))
    # Uncomment or modify the below range assertions if needed:
    # max(sapply(data[["loc_state"]], nchar), na.rm = TRUE) <= 2
    # 2 <= min(sapply(data[["loc_state"]], nchar), na.rm = TRUE)
  })
  invisible(TRUE)
}
