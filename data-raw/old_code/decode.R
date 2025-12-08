as_ccn_provider <- function(x) {
  CCN(
    ccn = substr_(x, c(1L, 6L)),
    state = State(code = substr_(x, c(1L, 2L))),
    extension = substr_(x, c(7L, nchar(x)))
  )
}

as_ccn_supplier <- function(x) {
  CCN(
    ccn = substr_(x, c(1L, 10L)),
    state = State(code = substr_(x, c(1L, 2L))),
    extension = substr_(x, c(11L, nchar(x)))
  )
}

#' Decode CMS Certification Numbers (CCNs)
#'
#' Decode a CCN into its component parts.
#'
# @param x character vector of CCNs.
#'
# @return list of CCN components.
#'
# @examplesIf FALSE
#' decode("670055") # Medicare Provider
#' decode("05P001") # Medicare OPO
#' decode("12345E") # Emergency Hospital
#' decode("01L008") # Medicaid Only Provider
#'
#' decode("210101")
#' decode("21T101")
#' decode("21S101")
#' decode("21U101")
#'
#' decode("10C0001062") # Supplier ASC
#' decode("45D0634589") # Supplier CLIA
#' decode("21X0009807") # Supplier Portable X-Ray
#'
#' decode("02TA01") # IPPS Excluded Unit
#' decode("04SD38")
#' decode("52TA05")
#'
#' decode("212026") # Parent
#' decode("21SA26")
#' decode("21TA26")
#'
#' decode("24T019A")
#' decode("33S23401")
#' decode("330027001")
#' @noRd
decode <- function(x) {
  x <- clean(x)

  if (is_provider_nchar(x)) {
    return(switch(provider_type(x@ccn),
      medicare  = as_medicare(x),
      opo       = as_medicare_opo(x),
      emergency = as_emergency(x),
      medicaid  = as_medicaid_only(x),
      excluded  = as_excluded(x),
      x
    ))
  }

  if (is_supplier_nchar(x) & is_supplier_type(x)) {
    return(as_supplier(x))
  }
  return(x)
}
