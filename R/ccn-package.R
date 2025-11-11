#' CCN
#'
#' An S7 class representing a __CMS Certification Number__, a uniform way of
#' identifying providers or suppliers who currently or who ever have
#' participated in the Medicare or Medicaid programs.
#'
#' A CCN is a 6- or 10-character alphanumeric string that encodes the provider
#' or supplier's state and facility type, as defined by
#' __CMS Manual System publication number 100-07 "State Operations Provider Certification"__.
#'
#' @keywords internal
#' @source [CMS Manual](https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf)
#' @source [ResDAC 1](https://resdac.org/cms-data/variables/full-cms-certification-number-provider)
#' @source [ResDAC 2](https://resdac.org/cms-data/variables/provider-number)
#' @source [The Joint Commission](https://manual.jointcommission.org/releases/TJC2025A/DataElem0276.html)
#' @source [QCOR](https://qcor.cms.gov/main.jsp)
#' @source [HHA Branch Identification Numbers](https://www.cms.gov/Regulations-and-Guidance/Guidance/Transmittals/Downloads/R2SOM.pdf)
"_PACKAGE"

## usethis namespace: start
#' @import S7
#' @importFrom collapse `%=%` `%==%` `%!=%` `%!in%` `%iin%` `%!iin%` .c
#' @importFrom cheapr `%in_%` `%!in_%`
#' @rawNamespace if (getRversion() < "4.3.0") importFrom("S7", "@")
## usethis namespace: end
NULL
