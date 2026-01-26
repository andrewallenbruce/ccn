#' Parse CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns character vector of names associated with codes.
#' @examples
#' parse("670055")
#' parse("05P001")
#' parse("12345E")
#' parse("10C0001062")
#' parse("A5J508")
#' parse("21T101")
#' parse("02TA01")
#' parse("240019A")
#' parse("330125001")
#' parse("000000000")
#' parse("00000000000000")
#' @export
parse <- function(x) {
  if (!nzchar(x)) {
    check_arg(x, "cannot be an {.strong empty} string.")
  }
  if (!nchar_ccn(x)) {
    check_arg(x, "must be {.strong 6 - 14} characters.")
  }
  switch_ccn(clean(x))
}

#' @noRd
switch_provider <- function(x) {
  switch(
    provider_type(x),
    medicare = slice_medicare(x),
    organ = slice_organ(x),
    emergency = slice_emergency(x),
    medicaid = slice_medicaid(x),
    unit = slice_unit(x),
    subunit = slice_subunit(x),
    check_arg(x, "is an invalid Provider CCN: {.val {x}}.")
  )
}

#' @noRd
switch_ccn <- function(x) {
  switch(
    ccn_by_nchar(x),
    provider = switch_provider(x),
    provider_ext = slice_provider_ext(x),
    supplier = slice_supplier(x),
    supplier_ext = slice_supplier_ext(x),
    check_arg(x, "is an invalid CCN: {.val {x}}.") # TODO redundant?
  )
}

#' @noRd
is_parsed <- function(x) {
  rlang::inherits_any(
    x,
    c(
      "medicare",
      "organ",
      "emergency",
      "supplier",
      "medicaid",
      "unit",
      "subunit"
    )
  )
}
