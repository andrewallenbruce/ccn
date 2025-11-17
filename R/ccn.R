#' @include convert.R
NULL

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
#' @export
ccn <- function(x) {

  x <- new_unknown(x)

  if (x@chr == 6L) {
    x <- convert_provider(x)

    if (is_numeric(    x@number)) return(convert_medicare(x))
    if (type_opo(      x@vec[3])) return(convert_opo(x))
    if (type_emergency(x@vec[6])) return(convert_emergency(x))
    if (type_medicaid( x@vec[3])) return(convert_medicaid(x))

    if (type_excluded( x@vec[3])) {
      if (type_parent( x@vec[4])) return(convert_parent(x))
      return(convert_excluded(x))
    }
    return(x)
  }

  if (x@chr == 10L && type_supplier(x@vec[3])) {
    return(convert_supplier(x))
  }
  x
}
