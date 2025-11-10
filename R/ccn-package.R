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

# The first two digits are the numeric or alphanumeric state code.
# The third digit of zero represents an acute facility.
# The third digit of “1” and fourth digit of “3” represents a
# Critical Access Hospital (CAH).

# === ResDAC 1:
# The extended CMS Certification Number (CCN). This extended field is designed
# to allow for the identification of __multi-campus hospitals__. For
# multi-campus hospitals, all campuses contain the same first 6-digit CCN,
# but positions 7–13 may be used to distinguish between campuses (ex. 01, 02,
# 001, 002, A, etc.) In the future positions 7–13 may have other uses.

# === ResDAC 2:
# The provider identification number of the institutional provider, certified
# by Medicare. The first two digits indicate the state where the provider is
# located. As two-digit state codes have been exhausted, CMS has implemented
# a two-position alpha-numeric coding system for State Codes. The middle two
# characters indicate the type of provider; and the last two digits are used
# as a __counter for the number of providers within that state__ and type of
# provider (i.e., this is a unique but not necessarily sequential number).

# === 2779K – HHA Branch Identification Numbers
# (Rev. 2, Issued 08-20-04, Effective: N/A/ Implementation: N/A)
# HHA Branches are identified by the assignment of a 10-digit alpha-numeric number.
# Each branch is numbered with the same provider identification number as the parent or
# subunit with two modifications: (1) The letter “Q” will be in the third position between
# the state code and the 4-digit provider designation; and (2) three additional digits are
# added to the end of the number. The last 3 digits are a one up number for each
# consecutive branch. These digits allow the capability of assigning up to 999 branches to
# one parent or subunit HHA. Branch identification numbers will be used only once. In
# the event that an HHA branch closes, its unique branch identification number is
# terminated and will not be reused to identify another branch of that HHA or subunit.
# Example: ABC Home Health Agency has three branches. Its provider identification
# number is 017001. ABC’s three branches would be assigned the branch identification
# numbers 01Q7001001, 01Q7001002, and 01Q7001003.

# === ???
# The CMS Certification Number (CCN) is a unique identifier assigned to
# healthcare providers certified by Medicare, used for quality reporting and
# verification of services. It consists of six digits, where the first two
# indicate the state, and the remaining digits specify the provider type and a
# unique counter.
