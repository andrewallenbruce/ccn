#' @include as.R
NULL

#' @noRd
as_Unknown <- function(x) {
  Unknown(number = clean(x))
}

#' @noRd
get_provider_type <- function(x) {
  kit::nif(
    is_numeric(x), "medicare",
    type_opo(substr_(x, 3L)), "opo",
    type_emergency(substr_(x, 6L)), "emergency",
    type_medicaid(substr_(x, 3L)), "medicaid",
    type_excluded(substr_(x, 3L)), "excluded",
    default = NA_character_
  )
}

#' @noRd
is_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
is_supplier <- function(x) {
  nchar(x) == 10L & type_supplier(substr_(x, 3L))
}

#' @noRd
has_extension <- function(x) {
  nchar(x) > 6L & nchar(x) < 10L
}

#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#'
#' @return list of CCN components.
#'
#' @examples
#' ccn("670055") # Medicare Provider
#' ccn("05P001") # Medicare OPO
#'
#' ccn("210101")
#' ccn("21T101")
#' ccn("21S101")
#' ccn("21U101")
#'
#' ccn("01L008") # Medicaid Only Provider
#' ccn("12345E") # Emergency Hospital
#' ccn("10C0001062") # Supplier ASC
#' ccn("45D0634589") # Supplier CLIA
#' ccn("21X0009807") # Supplier Portable X-Ray
#'
#' ccn("02TA01") # IPPS Excluded Unit
#' ccn("04SD38")
#' ccn("52TA05")
#'
#' ccn("212026") # Parent
#' ccn("21SA26")
#' ccn("21TA26")
#'
#' ccn("24T019A")
#' ccn("33S23401")
#' ccn("330027001")
#' @export
ccn <- function(x) {
  check_character(x)
  check_length(x)

  x <- as_Unknown(x)

  if (is_provider(x@number) | has_extension(x@number)) {
    x <- as_provider(x)

    return(switch(
      get_provider_type(x@number),
      medicare  = as_medicare(x),
      opo       = as_care_opo(x),
      emergency = as_emergency(x),
      medicaid  = as_medicaid(x),
      excluded  = as_excluded(x),
      x
    ))
  }

  if (is_supplier(x@number)) {
    return(as_supplier(x))
  }
  return(x)
}
