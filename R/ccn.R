#' @include convert.R
NULL

#' @noRd
get_provider_type <- function(x) {
  kit::nif(
    is_numeric(x@number),
    "medicare",
    type_opo(substr_(x@number, 3L)),
    "opo",
    type_emergency(substr_(x@number, 6L)),
    "emergency",
    type_medicaid(substr_(x@number, 3L)),
    "medicaid",
    type_excluded(substr_(x@number, 3L)),
    "excluded",
    default = NA_character_
  )
}

#' @noRd
as_excluded_type <- function(x) {
  if (type_unit(substr_(x@number, 4L))) {
    as_unit(x)
  } else {
    as_excluded(x)
  }
}

#' @noRd
is_provider <- function(x) {
  nchar(x@number) == 6L
}

#' @noRd
is_supplier <- function(x) {
  nchar(x@number) == 10L && type_supplier(substr_(x@number, 3L))
}

#' @noRd
is_extended <- function(x) {
  nchar(x@number) > 6L && nchar(x@number) < 10L
}

#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#' @return list of CCN components.
#' @examples
#' # Medicare Provider
#' ccn("670055")
#' ccn("05P001") # OPO
#'
#' ccn("210101")
#' ccn("21T101")
#' ccn("21S101")
#' ccn("21U101")
#'
#' # Medicaid Only Provider
#' ccn("01L008")
#'
#' # Emergency Hospital
#' ccn("12345E")
#'
#' # Supplier
#' ccn("10C0001062") # ASC
#' ccn("45D0634589") # CLIA
#' ccn("21X0009807") # Portable X-Ray
#'
#' # IPPS Excluded Unit
#' ccn("02TA01")
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

  x <- as_unknown(x)

  if (is_provider(x) | is_extended(x)) {
    x <- as_provider(x)

    return(switch(
      get_provider_type(x),
      medicare  = as_medicare(x),
      opo       = as_care_opo(x),
      emergency = as_emergency(x),
      medicaid  = as_medicaid(x),
      excluded  = as_excluded_type(x),
      x
    ))
  }

  if (is_supplier(x)) {
    return(as_supplier(x))
  }
  return(x)
}

#' @noRd
ccn2 <- function(x) {
  x <- as_unknown(x)

  if (nchar(x@number) == 6L) {
    x <- as_provider(x)

    if (is_numeric(x@number))                  return(as_medicare(x))
    if (type_opo(substr_(x@number, 3L)))       return(as_care_opo(x))
    if (type_emergency(substr_(x@number, 6L))) return(as_emergency(x))
    if (type_medicaid(substr_(x@number, 3L)))  return(as_medicaid(x))

    if (type_excluded(substr_(x@number, 3L))) {
      if (type_unit(substr_(x@number, 4L)))  return(as_unit(x))
      return(as_excluded(x))
    }
    return(x)
  }

  if (nchar(x@number) == 10L && type_supplier(substr_(x@number, 3L))) {
    return(as_supplier(x))
  }
  return(x)
}
