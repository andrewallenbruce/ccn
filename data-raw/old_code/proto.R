#' @noRd
ccn_type <- function(x) {
  kit::nif(
    nchar_provider(x),
    "provider",
    nchar_provider_ext(x),
    "provider_ext",
    nchar_supplier(x),
    "supplier",
    nchar_supplier_ext(x),
    "supplier_ext",
    default = NA_character_
  )
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(substring(x, 3L, 6L)),
    "medicare",
    is_organ_type(substring(x, 3L, 3L)),
    "organ",
    is_emergency_type(substring(x, 6L, 6L)),
    "emergency",
    is_medicaid_type(substring(x, 3L, 3L)),
    "medicaid",
    is_unit_type(substring(x, 3L, 3L)) & is_numeric(substring(x, 4L, 4L)),
    "unit",
    is_unit_type(substring(x, 3L, 3L)) & is_subunit_type(substring(x, 4L, 4L)),
    "subunit",
    default = NA_character_
  )
}

identify_parser <- function(
  x = character(),
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  check_all_are_ccn(x, arg = arg, call = call)

  vctrs::new_vctr(
    x,
    subtype = provider_type(x),
    class = "ccn"
  )
}

switch(
  provider_type(x),
  medicare = slice_medicare(x),
  organ = slice_organ(x),
  emergency = slice_emergency(x),
  medicaid = slice_medicaid(x),
  unit = slice_unit(x),
  subunit = slice_subunit(x)
)
