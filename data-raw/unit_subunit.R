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
#' CAH could have swing-bed approval, an IPPS-excluded rehabilitation unit,
#' and/or an IPPS-excluded psychiatric unit.
unit_types <- tibble::tribble(
  ~code , ~abbr , ~desc                         ,
  "M"   , "PSY" , "Psychiatric Unit - CAH"      ,
  "R"   , "IRF" , "Rehabilitation Unit - CAH"   ,
  "S"   , "PSY" , "Psychiatric Unit"            ,
  "T"   , "IRF" , "Rehabilitation Unit"         ,
  "U"   , "SBA" , "Swing-Bed Approval - STC"    ,
  "V"   , "ADU" , "Alcohol-Drug Unit (Retired)" ,
  "W"   , "SBA" , "Swing-Bed Approval - LTCH"   ,
  "Y"   , "SBA" , "Swing-Bed Approval - IRF"    ,
  "Z"   , "SBA" , "Swing-Bed Approval - CAH"
)

usethis::use_data(unit_types, overwrite = TRUE)

unit_parents <- tibble::tribble(
  ~code , ~infix , ~range        , ~abbr         , ~desc                                       ,
  "U"   , "0"    , "0001-0879"   , "STC"         , "Short-Term Hospital (General & Specialty)" ,
  "M"   , "1"    , "1300-1399"   , "CAH"         , "Critical Access Hospital"                  ,
  "R"   , "1"    , "1300-1399"   , "CAH"         , "Critical Access Hospital"                  ,
  "Z"   , "1"    , "1300-1399"   , "CAH"         , "Critical Access Hospital"                  ,
  "W"   , "2"    , "2000-2299"   , "LTCH"        , "Long-Term Care Hospital"                   ,
  "Y"   , "3"    , "3025-3099"   , "IRF"         , "Rehabilitation Hospital"                   ,
  "S"   , "_"    , NA_character_ , NA_character_ , NA_character_                               ,
  "T"   , "_"    , NA_character_ , NA_character_ , NA_character_
)

subunit_types <- tibble::tribble(
  ~code , ~prefix , ~abbr  ,
  "A"   , "20"    , "LTCH" ,
  "B"   , "21"    , "LTCH" ,
  "C"   , "22"    , "LTCH" ,
  "D"   , "30"    , "IRF"  ,
  "E"   , "33"    , "CH"   ,
  "F"   , "40"    , "PSY"  ,
  "G"   , "41"    , "PSY"  ,
  "H"   , "42"    , "PSY"  ,
  "J"   , "43"    , "PSY"  ,
  "K"   , "44"    , "PSY"  ,
)

usethis::use_data(subunit_types, overwrite = TRUE)

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
  ~medicare_range , ~medicare_abbr , ~unit_type , ~parent_code , ~rehab_unit_range ,
  "2000-2099"     , "LTC"          , "T"        , "A"          , "00-99"           ,
  "2100-2199"     , "LTC"          , "T"        , "B"          , "00-99"           ,
  "2200-2299"     , "LTC"          , "T"        , "C"          , "00-99"           ,
  "3300-3399"     , "CH"           , "T"        , "E"          , "00-99"           ,
  "4400-4499"     , "PH"           , "T"        , "K"          , "00-99"           ,
  "4000-4099"     , "PH"           , "T"        , "F"          , "00-99"           ,
  "4100-4199"     , "PH"           , "T"        , "G"          , "00-99"           ,
  "4200-4299"     , "PH"           , "T"        , "H"          , "00-99"           ,
  "4300-4399"     , "PH"           , "T"        , "J"          , "00-99"
)

psych_unit_range <- tibble::tribble(
  ~medicare_range , ~medicare_abbr , ~unit_type , ~parent_code , ~psych_unit_range ,
  "2000-2099"     , "LTC"          , "S"        , "A"          , "00-99"           ,
  "2100-2199"     , "LTC"          , "S"        , "B"          , "00-99"           ,
  "2200-2299"     , "LTC"          , "S"        , "C"          , "00-99"           ,
  "3025-3099"     , "PH"           , "S"        , "D"          , "00-99"           ,
  "3300-3399"     , "CH"           , "S"        , "E"          , "00-99"
)

#' NOTE: An IPPS-excluded hospital may not have an IPPS-excluded unit of the
#' same type (psychiatric or rehabilitation) as the hospital (for example, an
#' Inpatient Rehabilitation Facility (IRF) may not have an IRF unit).
#'
#' EXAMPLE: 21-2026 - XYZ Hospital (IPPS-excluded Long Term Care Hospital)
#'    * 21-SA26 - XYZ Long Term Care Hospital’s IPPS-excluded Psychiatric Unit
#     * 21-TA26 - XYZ Long Term Care Hospital’s IPPS-excluded Rehabilitation Unit

# constructive::construct(ccn::subunit_types, constructive::opts_tbl_df("tribble"))
# subunit_types <- tibble::tibble(
#   code = c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"),
#   prefix = c(20:22, "30", "33", 40:44),
#   abbr = c(rep.int("LTCH", 3), "IRF", "CH", rep.int("PSY", 5))
# )
