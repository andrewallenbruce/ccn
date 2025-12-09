# asc        ===     5,536 ×  3  |=>   [983.1 m]
# aff        ===    39,130 ×  3  |=>     [2.8 m]
# esrd       ===     7,561 ×  8  |=>     [1.5 m]
# hha        ===    11,723 ×  5  |=>     [1.9 m]
# ltch       ===       324 ×  3  |=>    [66.5 m]
# irf        ===     1,221 ×  3  |=>   [213.7 M]
# hosp       ===     9,217 × 22  |=>     [2.1 m]
# hosp_info  ===     5,381 ×  6  |=>   [990.3 k]

# initial length == 81982
# unique length  == 52256
ccns <- vctrs::vec_c(
  get_pin("asc")$ccn,
  get_pin("aff")$fac$ccn,
  get_pin("aff")$sub$ccn,
  get_pin("aff")$sub$parent,
  get_pin("esrd")$ccn,
  get_pin("hha")$ccn,
  get_pin("hosp")$ccn,
  get_pin("hosp_info")$ccn,
  get_pin("irf")$ccn,
  get_pin("ltch")$ccn
) |>
  collapse::funique() |>
  kit::psort(nThread = 4L) |>
  stringfish::convert_to_sf()

pin_update(
  ccns,
  name = "ccn",
  title = "52k ccns",
  description = "A character vector of 52k unique CCNs"
)


ccns <- list(
  eipps_hosp_with_eipps_unit = c(
    "02TA01",
    "04SD38",
    "05TA46",
    "06TA09",
    "10TA09",
    "10TA10",
    "10TA15",
    "10TA20",
    "10TA24",
    "10TA25",
    "10TA27",
    "14TA13",
    "14TA15",
    "19SA08",
    "19SA10",
    "19TA10",
    "19TA28",
    "19TA35",
    "19TA43",
    "19TA48",
    "19TA57",
    "22TA00",
    "22TA47",
    "22TA48",
    "25SA13",
    "26TA16",
    "26TA17",
    "28TA03",
    "29TA02",
    "31SA24",
    "36SA33",
    "39TA27",
    "43TA03",
    "45SB14",
    "45TA23",
    "45TA34",
    "45TA38",
    "45TA39",
    "45TA62",
    "45TA80",
    "45TA83",
    "45TA94",
    "45TB06",
    "45TB08",
    "46TA05",
    "49SE01",
    "52TA05",
    "52TA08"
  ),
  extension = c(
    "24T019A",
    "30S020A",
    "31S032A",
    "31S069A",
    "39S006A",
    "39S142A",
    "39T142A",
    "39T204A",
    "05203900",
    "07001001",
    "07002201",
    "07003301",
    "10002900",
    "15403500",
    "22007401",
    "22007402",
    "23203900",
    "26014100",
    "30000301",
    "31202000",
    "31302500",
    "31302501",
    "33010301",
    "33019501",
    "33021401",
    "33023401",
    "33S19501",
    "33S23401",
    "33T23401",
    "39203900",
    "45003300",
    "45027200",
    "45063400",
    "45303600",
    "45303601",
    "51200500",
    "52000901",
    "52003001",
    "52018901",
    "52019801",
    "67303500",
    "78A005BP",
    "330027001",
    "330125001",
    "330195004",
    "330395002",
    "33S027001",
    "33S395002",
    "33T027001"
  ),
  supplier = c(
    c(
      "11X0009845",
      "11X0009814",
      "11X0009803",
      "11X0009840",
      "09X0000002",
      "21X0009807"
    ), # PXRF
    c("65C0001000", "65C0001001", "55C0001197"), # ASC
    c(
      "02D0873639", # Artic Envestigations Program Laboratory, Anchorage, AK
      "40D0869394", # Dengue Laboratory, San Juan, PR
      "11D1061576", # CDC/CGH/DGHA International Laboratory, Atlanta, GA
      "11D0668319", # Infectious Diseases Laboratory, Atlanta, GA
      "11D0668290", # National Center for Environmental Health, Division of Laboratory Science, Atlanta, GA
      "06D0880233", # Vector-Borne Diseases Laboratory, Fort Collins, CO
      "11D2306220"
    ) # Wiregrass Georgia Tech College Student Health Center, Valdosta, GA
  )
)
