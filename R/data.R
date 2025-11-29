#' CCN State Codes
#'
#' From Section 2779A1: CCN for Medicare Providers (pgs. 403-404)
#' (Rev. 226; Issued: 12-06-24; Effective: 12-06-24; Implementation: 12-06-24)
#'
#' @format ## `state_codes`
#' A data frame with 108 rows and 3 columns:
#' \describe{
#'   \item{code}{State code}
#'   \item{abbr}{State abbreviation}
#'   \item{name}{State full name}
#'   ...
#' }
#' @source <https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf>
#' @examples
#' state_codes
#' medicare_ranges
#' medicaid_ranges
#' medicaid_types
#' medicaid_data
"state_codes"

#' CCN Medicare Facility Ranges
#'
#' From Section 2779A1: CCN for Medicare Providers (pgs. 405-406)
#' (Rev. 226; Issued: 12-06-24; Effective: 12-06-24; Implementation: 12-06-24)
#'
#' @format ## `medicare_ranges`
#' A data frame with 39 rows and 3 columns:
#' \describe{
#'   \item{range}{Facility range}
#'   \item{abbr}{Facility abbreviation}
#'   \item{desc}{Facility description}
#'   ...
#' }
#' @rdname state_codes
"medicare_ranges"

#' CCN Medicaid-Only Facility Ranges
#'
#' From Section 2779B:  CMS Certification Numbers for Medicaid Providers (pgs. 407-408)
#' (Rev. 123; Issued: 10-03-14; Effective: 10-03-14; Implementation: 10-03-14)
#'
#' @format ## `medicaid_ranges`
#' A data frame with 7 rows and 3 columns:
#' \describe{
#'   \item{code}{Facility type code}
#'   \item{range}{Facility type range}
#'   \item{abbr}{Facility type abbreviation}
#'   \item{desc}{Facility type description}
#'   ...
#' }
#' @rdname state_codes
"medicaid_ranges"

#' CCN Medicaid-Only Facility Types
#'
#' From Section 2779B:  CMS Certification Numbers for Medicaid Providers (pgs. 407-408)
#' (Rev. 123; Issued: 10-03-14; Effective: 10-03-14; Implementation: 10-03-14)
#'
#' @format ## `medicaid_types`
#' A data frame with 9 rows and 3 columns:
#' \describe{
#'   \item{code}{Facility type code}
#'   \item{abbr}{Facility type abbreviation}
#'   \item{desc}{Facility type description}
#'   ...
#' }
#' @rdname state_codes
"medicaid_types"

#' CCN Medicaid-Only Facility Ranges and Types
#'
#' From Section 2779B:  CMS Certification Numbers for Medicaid Providers (pgs. 407-408)
#' (Rev. 123; Issued: 10-03-14; Effective: 10-03-14; Implementation: 10-03-14)
#'
#' @format ## `medicaid_data`
#' A data frame with 15 rows and 4 columns:
#' \describe{
#'   \item{code}{Facility type code}
#'   \item{range}{Facility type range}
#'   \item{abbr}{Facility type abbreviation}
#'   \item{desc}{Facility type description}
#'   ...
#' }
#' @rdname state_codes
"medicaid_data"
