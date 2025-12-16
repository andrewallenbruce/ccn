#' CCN State Codes
#'
#' @format ## `states`
#' A data frame with 108 rows and 3 columns:
#' \describe{
#'   \item{code}{State code}
#'   \item{abbr}{State abbreviation}
#'   \item{name}{State full name}
#'   ...
#' }
#' @keywords internal
"states"

#' CMS Regional Office Codes
#'
#' @format ## `regions`
#' A data frame with 59 rows and 4 columns:
#' \describe{
#'   \item{ro}{Region number}
#'   \item{region}{Region roman numeral}
#'   \item{state}{State abbreviation}
#'   \item{city}{Regional office city}
#'   ...
#' }
#' @keywords internal
"regions"

#' CCN Medicare Facility Ranges
#'
#' @format ## `medicare_ranges`
#' A data frame with 43 rows and 5 columns:
#' \describe{
#'   \item{start}{Medicare facility range start}
#'   \item{end}{Medicare facility range end}
#'   \item{range}{Medicare facility range label}
#'   \item{abbr}{Medicare facility abbreviation}
#'   \item{desc}{Medicare facility description}
#'   ...
#' }
#' @keywords internal
"medicare_ranges"

#' CCN Medicaid-Only Hospital Ranges
#'
#' @format ## `medicaid_ranges`
#' A data frame with 7 rows and 5 columns:
#' \describe{
#'   \item{start}{Medicaid-only hospital range start}
#'   \item{end}{Medicaid-only hospital range end}
#'   \item{range}{Medicaid-only hospital range}
#'   \item{abbr}{Medicaid-only hospital abbreviation}
#'   \item{desc}{Medicaid-only hospital description}
#'   ...
#' }
#' @keywords internal
"medicaid_ranges"

#' CCN Medicaid-Only Facility Types
#'
#' @format ## `medicaid_types`
#' A data frame with 9 rows and 3 columns:
#' \describe{
#'   \item{code}{Medicaid-only facility type code}
#'   \item{abbr}{Medicaid-only facility type abbreviation}
#'   \item{desc}{Medicaid-only facility type description}
#'   ...
#' }
#' @keywords internal
"medicaid_types"

#' IPPS-Excluded Hospital Unit Types/Swing-Bed Approvals
#'
#' @format ## `unit_types`
#' A data frame with 9 rows and 3 columns:
#' \describe{
#'   \item{code}{IPPS-Excluded type code}
#'   \item{abbr}{IPPS-Excluded type abbreviation}
#'   \item{desc}{IPPS-Excluded type description}
#'   ...
#' }
#' @keywords internal
"unit_types"

#' IPPS-Excluded Hospital Unit Types/Swing-Bed Approvals
#'
#' @format ## `subunit_types`
#' A data frame with 10 rows and 3 columns:
#' \describe{
#'   \item{code}{IPPS-Excluded type code}
#'   \item{prefix}{IPPS-Excluded type abbreviation}
#'   \item{abbr}{IPPS-Excluded type description}
#'   ...
#' }
#' @keywords internal
"subunit_types"

#' IPPS-Excluded Hospital Unit Types/Swing-Bed Approvals
#'
#' @format ## `eipps_types`
#' A data frame with 5 rows and 3 columns:
#' \describe{
#'   \item{code}{IPPS-Excluded type code}
#'   \item{abbr}{IPPS-Excluded type abbreviation}
#'   \item{desc}{IPPS-Excluded type description}
#'   ...
#' }
#' @keywords internal
"eipps_types"

#' IPPS-Excluded Hospital Unit Types/Swing-Bed Approvals
#'
#' @format ## `eipps_ranges`
#' A data frame with 3 rows and 3 columns:
#' \describe{
#'   \item{start}{IPPS-Excluded range start}
#'   \item{end}{IPPS-Excluded range end}
#'   \item{range}{IPPS-Excluded range label}
#'   \item{abbr}{IPPS-Excluded abbreviation}
#'   \item{desc}{IPPS-Excluded description}
#'   ...
#' }
#' @keywords internal
"eipps_ranges"
