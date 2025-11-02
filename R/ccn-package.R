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
"_PACKAGE"

# abstract type CCN
# abstract type ProviderCCN <: CCN
#
# struct MedicareProviderCCN <: ProviderCCN
# number::String7
# A type representing a Medicare provider.
#
# Medicare providers use six-character identifiers with the following format:
#   > `SSPQQQ`
# Where:
#   - `SS` represent a two-character alphanumeric State Code;
#   - `P` represents either a literal 'P' character (for Organ Procurement Organizations) or the most significant digit of the Sequence Number;
#   - `QQQ` represents the three least significant digits of the Sequence Number.
#
# The constructor performs no error checking, but will throw an exception if `n` has more than
# seven characters.
#
## usethis namespace: start
## usethis namespace: end
NULL
