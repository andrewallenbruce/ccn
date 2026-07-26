#' @noRd
infer_ccn_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      nchar_provider(x),
      nchar_provider_ext(x),
      nchar_supplier(x),
      nchar_supplier_ext(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "prov",
      "ext_prov",
      "supp",
      "ext_supp",
      NA_character_
    ),
    default = "ccn"
  )
}

#' @noRd
infer_provider_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      type_care(x),
      type_opo(x),
      type_erh(x),
      type_caid(x),
      type_unit(x),
      type_sub(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "care",
      "opo",
      "erh",
      "caid",
      "unit",
      "sub",
      NA_character_
    ),
    default = "prov"
  )
}

#' @noRd
infer_provider_ext <- function(x) {
  x <- substring(x, 1L, 6L)
  vctrs::vec_case_when(
    conditions = list(
      type_care(x),
      type_opo(x),
      type_erh(x),
      type_caid(x),
      type_unit(x),
      type_sub(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "ext_care",
      "ext_opo",
      "ext_erh",
      "ext_caid",
      "ext_unit",
      "ext_sub",
      NA_character_
    ),
    default = "ext_prov"
  )
}
