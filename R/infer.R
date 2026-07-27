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
      "Provider",
      "Provider_Ext",
      "Supplier",
      "Supplier_Ext",
      NA_character_
    ),
    default = "<UNKNOWN> Type"
  )
}

#' @noRd
infer_provider_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      is_type_medicare(x),
      is_type_organ(x),
      is_type_emergency(x),
      is_type_medicaid(x),
      is_type_unit(x),
      is_type_subunit(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "Medicare",
      "Organ",
      "Emergency",
      "Medicaid",
      "Unit",
      "Subunit",
      NA_character_
    ),
    default = "<UNKNOWN> Provider"
  )
}

#' @noRd
infer_provider_ext <- function(x) {
  x <- substring(x, 1L, 6L)
  vctrs::vec_case_when(
    conditions = list(
      is_type_medicare(x),
      is_type_organ(x),
      is_type_emergency(x),
      is_type_medicaid(x),
      is_type_unit(x),
      is_type_subunit(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "Medicare_Ext",
      "Organ_Ext",
      "Emergency_Ext",
      "Medicaid_Ext",
      "Unit_Ext",
      "Subunit_Ext",
      NA_character_
    ),
    default = "<UNKNOWN> Provider Ext>"
  )
}
