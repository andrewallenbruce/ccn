#' IPPS-Excluded Hospital Units/Swing-Bed Approvals
#'
#'    * Section __2779C__
#'    * Title: Special Numbering System for
#'       * IPPS Excluded Hospital Units
#'       * Hospitals/CAHs with Swing-Bed Approval
#'    * Pgs. 408-409
#'    * Rev. 198
#'    * Iss/Eff/Impl `01-17-20`
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
eipps_unit_swing_types <- tibble::tribble(
  ~code, ~abbr,         ~desc,
  "M",   "PU (CAH)",    "Psychiatric Unit of a Critical Access Hospital",
  "R",   "IRF (CAH)",   "Rehabilitation Unit of a Critical Access Hospital",
  "S",   "PU (EIPPS)",  "Psychiatric Unit (Excluded from IPPS)",
  "T",   "IRF (EIPPS)", "Rehabilitation Unit (Excluded from IPPS)",
  "U",   "STH (SBA)",   "Swing-Bed Approval for Short-Term Hospital",
  "V",   "ADU (Ret.)",  "Alcohol-Drug Unit (Retired)",
  "W",   "LTC (SBA)",   "Swing-Bed Approval for Long-Term Care Hospital",
  "Y",   "IRF (SBA)",   "Swing-Bed Approval for Rehabilitation Hospital",
  "Z",   "CAH (SBA)",   "Swing-Bed Approval for Critical Access Hospital")
usethis::use_data(eipps_unit_swing_types, overwrite = TRUE)

eipps_hospital_units_types <- tibble::tibble(
  code  = c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"),
  prefix = c(20:22, "30", "33", 40:44),
  abbr = c(rep.int("LTC (EIPPS)", 3), "IRF (EIPPS)", "CH (EIPPS)", rep.int("PH (EIPPS)", 5)))
usethis::use_data(eipps_hospital_units_types, overwrite = TRUE)

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
rehab_unit_range <- tibble::tribble(
  ~medicare_range,   ~medicare_abbr,   ~unit_type,    ~parent_code,     ~rehab_unit_range,
  "2000-2099",       "LTC (EIPPS)",    "T",                    "A",    "00-99",
  "2100-2199",       "LTC (EIPPS)",    "T",                    "B",    "00-99",
  "2200-2299",       "LTC (EIPPS)",    "T",                    "C",    "00-99",
  "3300-3399",       "CH (EIPPS)",     "T",                    "E",    "00-99",
  "4400-4499",       "PH (EIPPS)",     "T",                    "K",    "00-99",
  "4000-4099",       "PH (EIPPS)",     "T",                    "F",    "00-99",
  "4100-4199",       "PH (EIPPS)",     "T",                    "G",    "00-99",
  "4200-4299",       "PH (EIPPS)",     "T",                    "H",    "00-99",
  "4300-4399",       "PH (EIPPS)",     "T",                    "J",    "00-99"
)

psych_unit_range <- tibble::tribble(
  ~medicare_range,   ~medicare_abbr,   ~unit_type,    ~parent_code,     ~psych_unit_range,
  "2000-2099",       "LTC (EIPPS)",    "S",                    "A",    "00-99",
  "2100-2199",       "LTC (EIPPS)",    "S",                    "B",    "00-99",
  "2200-2299",       "LTC (EIPPS)",    "S",                    "C",    "00-99",
  "3025-3099",       "PH (EIPPS)",     "S",                    "D",    "00-99",
  "3300-3399",       "CH (EIPPS)",     "S",                    "E",    "00-99")

#' NOTE: An IPPS-excluded hospital may not have an IPPS-excluded unit of the
#' same type (psychiatric or rehabilitation) as the hospital (for example, an
#' Inpatient Rehabilitation Facility (IRF) may not have an IRF unit).
#'
#' EXAMPLE: 21-2026 - XYZ Hospital (IPPS-excluded Long Term Care Hospital)
#'    * 21-SA26 - XYZ Long Term Care Hospital’s IPPS-excluded Psychiatric Unit
#     * 21-TA26 - XYZ Long Term Care Hospital’s IPPS-excluded Rehabilitation Unit
