#' IPPS-Excluded Hospital Units/Swing-Bed Approvals
#'
#'    * Section __2779C__
#'    * Title: Special Numbering System for
#'       * IPPS Excluded Hospital Units
#'       * and Hospitals & CAHs with Swing-Bed Approval
#'    * Pgs. 408-409
#'    * Rev. 198
#'    * Iss./Eff./Impl. 01-17-20
#'
#' An alpha character in the third position of a hospital's or CAH's CCN
#' identifies either its swing-bed approval or its status as an IPPS-excluded
#' rehabilitation or psychiatric unit.
#'
#' The first 2 digits identify the State in which the provider is located. The
#' third position (which is alpha) identifies the type of unit or swing-bed
#' designation.
#'
#' The last 3 digits must be exactly the same as the last 3 digits of the CCN of
#' the hospital or CAH operating the unit(s), unless as noted below in Section
#' 2779C1.
#'
#' NOTE: As of the cost reporting period beginning on or after October 1, 2019,
#' an IPPS-excluded hospital is no longer precluded from having an IPPS-excluded
#' psychiatric and/or rehabilitation unit (see Section 2779C1 for CCN
#' numbering).
#'
#' EXAMPLE: 21-0101 - ABC Hospital (Short-Term Hospital)
#'    * 21-T101 - ABC Hospital’s IPPS-excluded Rehabilitation Unit
#'    * 21-S101 - ABC Hospital’s IPPS-excluded Psychiatric Unit
#'    * 21-U101 - ABC Hospital’s Swing-Bed Approval
#'
#' NOTE: If it meets the applicable requirements, an acute care hospital or a
#' CAH could have swing-bed approval, an IPPS-excluded rehabilitation unit, and/
#' or an IPPS-excluded psychiatric unit.
ipps_excluded_facility_types <- tibble::tribble(
  ~code, ~abbr,     ~desc,
  "M",   "PUCAH",   "Psychiatric Unit of a Critical Access Hospital",
  "R",   "RU/IRF",  "Rehabilitation Unit of a Critical Access Hospital",
  "S",   "PBMU",    "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital",
  "T",   "RU/IRF",  "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital",
  "U",   "SBA-STH", "Swing-Bed Approval for Short-Term Hospital",
  "W",   "SBA-LTC", "Swing-Bed Approval for Long-Term Care Hospital",
  "Y",   "SBA-RH",  "Swing-Bed Approval for Rehabilitation Hospital",
  "Z",   "SBA-CAH", "Swing-Bed Approval for Critical Access Hospital"
)

#' IPPS-Excluded Hospitals with IPPS-Excluded Units
#'
#'    * Section __2779C1__
#'    * Title: "Special Numbering System for IPPS-Excluded Hospitals with IPPS-Excluded Units"
#'    * Pgs. 409-410
#'    * Rev. 198
#'    * Iss./Eff./Impl. 01-17-20
#'
#' If an IPPS-excluded hospital also has an IPPS-excluded unit, the fourth
#' position within the CCN requires an additional alpha-character to identify
#' the IPPS-excluded unit type.
#'
#' Note: No special fourth position alpha character is needed for cancer
#' hospitals.
#'
#' The RO assigns the following alpha-characters in the fourth position as
#' indicated in the table below.
#'
#' Note: This table does not apply to CAHs.
ipps_excluded_hospitals_units <- tibble::tribble(
  ~excl_parent_range,     ~excl_parent_hospital,     ~psych_unit_range,    ~rehab_unit_range,
  "2000-2099",            "LTCH",                    "SA00-SA99",          "TA00-TA99",
  "2100-2199",            "LTCH",                    "SB00-SB99",          "TB00-TB99",
  "2200-2299",            "LTCH",                    "SC00-SC99",          "TC00-TC99",
  "3025-3099",            "RH",                      "SD00-SD99",          NA_character_,
  "3300-3399",            "CH",                      "SE00-SE99",          "TE00-TE99",
  "4000-4099",            "PH",                      NA_character_,        "TF00-TF99",
  "4100-4199",            "PH",                      NA_character_,        "TG00-TG99",
  "4200-4299",            "PH",                      NA_character_,        "TH00-TH99",
  "4300-4399",            "PH",                      NA_character_,        "TJ00-TJ99",
  "4400-4499",            "PH",                      NA_character_,        "TK00-TK99"
)

#' NOTE: An IPPS-excluded hospital may not have an IPPS-excluded unit of the
#' same type (psychiatric or rehabilitation) as the hospital (for example, an
#' Inpatient Rehabilitation Facility (IRF) may not have an IRF unit).
#'
#' EXAMPLE: 21-2026 - XYZ Hospital (IPPS-excluded Long Term Care Hospital)
#'    * 21-SA26 - XYZ Long Term Care Hospital’s IPPS-excluded Psychiatric Unit
#     * 21-TA26 - XYZ Long Term Care Hospital’s IPPS-excluded Rehabilitation Unit
