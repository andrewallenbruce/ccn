#' CCN
#'
#' An S7 class representing a __CMS Certification Number__.
#'
#' CCNs are a uniform way of identifying providers or suppliers who currently
#' or who ever have participated in the Medicare or Medicaid programs.
#'
#' A CCN is a 6- or 10-character alphanumeric string that encodes the provider
#' or supplier's (respectively) State and facility type.
#'
#' CCNs are defined by __CMS Manual System publication number 100-07 "State Operations Provider Certification"__.
#'
#' @keywords internal
#' @source [CMS Manual](https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf)
#' @source [ResDAC 1](https://resdac.org/cms-data/variables/full-cms-certification-number-provider)
#' @source [ResDAC 2](https://resdac.org/cms-data/variables/provider-number)
#' @source [The Joint Commission](https://manual.jointcommission.org/releases/TJC2025A/DataElem0276.html)
#' @source [QCOR](https://qcor.cms.gov/main.jsp)
"_PACKAGE"

## usethis namespace: start
#' @import S7
#' @importFrom collapse `%=%` `%==%` `%!=%` `%!in%` `%iin%` `%!iin%` .c
#' @importFrom cheapr `%in_%` `%!in_%`
#' @rawNamespace if (getRversion() < "4.3.0") importFrom("S7", "@")
## usethis namespace: end
NULL

# === ResDAC 1:
# This variable is the extended CMS Certification Number (CCN). This extended
# field is designed to allow for the identification of multiple campus hospitals.
# For multicampus hospitals, all campuses contain the same first 6-digit CCN
# (reference PRVDR_NUM variable in this data file), but positions 7–13 may be
# used to distinguish between campuses (ex. 01, 02, 001, 002, A, etc.) In the
# future positions 7–13 may have other uses.

# === ResDAC 2:
# This variable is the provider identification number of the institutional
# provider certified by Medicare to provide services to the beneficiary.
# This is the CMS Certification Number (CCN). The first two digits indicate
# the state where the provider is located. As two-digit state codes have been
# exhausted, CMS has implemented a two-position alpha-numeric coding system
# for State Codes (reference the NOTE in the VALUES below). The middle two
# characters indicate the type of provider; and the last two digits are used
# as a counter for the number of providers within that state and type of
# provider (i.e., this is a unique but not necessarily sequential number).

# === ???
# The CMS Certification Number (CCN) is a unique identifier assigned to
# healthcare providers certified by Medicare, used for quality reporting and
# verification of services. It consists of six digits, where the first two
# indicate the state, and the remaining digits specify the provider type and a
# unique counter.
