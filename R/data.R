#' CCN State Codes
#'
#'    * Section __2779A1__:
#'    * Title: "CCN for Medicare Providers"
#'    * Pgs. 403-404
#'    * Rev. 226
#'    * Iss./Eff./Impl. 12-06-24
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
#' @keywords internal
"state_codes"

#' CCN Medicare Facility Ranges
#'
#'    * Section __2779A1__
#'    * Title: "CCN for Medicare Providers"
#'    * Pgs. 405-406
#'    * Rev. 226
#'    * Iss./Eff./Impl. 12-06-24
#'
#' @format ## `medicare_ranges`
#' A data frame with 39 rows and 3 columns:
#' \describe{
#'   \item{range}{Medicare facility range}
#'   \item{abbr}{Medicare facility abbreviation}
#'   \item{desc}{Medicare facility description}
#'   ...
#' }
#' @source <https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf>
#' @keywords internal
"medicare_ranges"

#' CCN Medicaid-Only Hospital Ranges
#'
#'    * Section: __2779B__
#'    * Title: "CMS Certification Numbers for Medicaid Providers"
#'    * Pgs. 407-408
#'    * Rev. 123
#'    * Iss./Eff./Impl. 10-03-14
#'
#' @format ## `medicaid_only_hospital_ranges`
#' A data frame with 7 rows and 3 columns:
#' \describe{
#'   \item{range}{Medicaid-only hospital range}
#'   \item{abbr}{Medicaid-only hospital abbreviation}
#'   \item{desc}{Medicaid-only hospital description}
#'   ...
#' }
#' @source <https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf>
#' @keywords internal
"medicaid_only_hospital_ranges"

#' CCN Medicaid-Only Facility Types
#'
#'    * Section __2779B__
#'    * Title: "CMS Certification Numbers for Medicaid Providers"
#'    * Pgs. 407-408
#'    * Rev. 123
#'    * Issued/Effective/Implementation: 10-03-14
#'
#' @format ## `medicaid_only_facility_types`
#' A data frame with 8 rows and 3 columns:
#' \describe{
#'   \item{code}{Medicaid-only facility type code}
#'   \item{abbr}{Medicaid-only facility type abbreviation}
#'   \item{desc}{Medicaid-only facility type description}
#'   ...
#' }
#' @source <https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf>
#' @keywords internal
"medicaid_only_facility_types"
