#' @description
#' A [vctrs](https://github.com/r-lib/vctrs) class representing a
#' __CMS Certification Number__, a uniform way of identifying Providers or
#' Suppliers who have participated in the Medicare or Medicaid programs.
#'
#' A CCN is an alphanumeric string, either 6 or 10 characters in length, that
#' encodes a Provider/Supplier's State and Facility type, as defined by
#' [CMS Manual System Pub. 100-07](https://www.cms.gov/Regulations-and-Guidance/Guidance/Transmittals/downloads/R3SOM.pdf)
#' _Medicare State Operations: Provider Certification_.
#' @export
"_PACKAGE"

## usethis namespace: start
#' @importFrom methods setOldClass
#' @import vctrs
#' @import rlang
#' @importFrom collapse %!iin% %iin% %==% %=% .c
## usethis namespace: end
NULL
