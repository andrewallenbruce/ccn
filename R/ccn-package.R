#' @description
#' An [S7 class](https://github.com/RConsortium/S7/) representing a
#' __CMS Certification Number__, a uniform way of identifying Providers or
#' Suppliers who have participated in the Medicare or Medicaid programs.
#'
#' A CCN is an alphanumeric string, either 6 or 10 characters in length, that
#' encodes a Provider/Supplier's State and Facility type, as defined by
#' [CMS Manual System Pub. 100-07](https://www.cms.gov/Regulations-and-Guidance/Guidance/Transmittals/downloads/R3SOM.pdf)
#' _Medicare State Operations: Provider Certification_.
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @import S7
#' @importFrom collapse %!in% %iin% %!iin% %=% %==% %!=% .c
#' @importFrom data.table %chin% %inrange% %between% %notin%
#' @rawNamespace if (getRversion() < "4.3.0") importFrom("S7", "@")
## usethis namespace: end
NULL
