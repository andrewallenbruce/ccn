#'  (OSCAR): Online Survey, Certification, and Reporting System
#'  CMS Regional Office (RO) assigns CMS Certification Numbers (CCNs)
#'  State Agency (SA)
#'
#' LTC CCNs
#'
#'    * Section __2779D__
#'    * Title: " Assigning LTC CMS Certification Numbers"
#'    * Pgs. 410-411
#'    * Rev. 91
#'    * Iss./Eff./Impl. 09-27-13
#'
#' The RO assigns only one CCN per facility. (For purposes of this section,
#' “facility” means an institution providing SNF and/or NF or ICF/IID care at
#' the same address.).
#'
#' Use XX-5000 series for facilities providing Medicare or Medicare/Medicaid
#' services, and the alphanumeric series (XX-A000 or XX-E000 or XX-G000) for
#' Medicaid-only facilities:

ltc_ccns <- tibble::tribble(
  ~code         , ~range      , ~facility_type                       , ~facility_category  , ~service_type                   ,
  NA_character_ , "5000-6499" , "18:SNF||18-19:SNF"                  , "Free-Standing LTC" , "Medicare or Medicare/Medicaid" ,
  NA_character_ , "5000-6499" , "18-19:S[NF]+{DUAL}"                 , "S[NF] DUAL:DP"     , "Medicare or Medicare/Medicaid" ,
  NA_character_ , "5000-6499" , "18:SNF||18-19:SNF+{DUAL}++DP:S[NF]" , "S[NF] DUAL:DP"     , "Medicare or Medicare/Medicaid" ,
  "A"           , "2000-2099" , "19:NF"                              , "Free-Standing LTC" , "Medicaid-Only"                 ,
  "A"           , "2000-2099" , "19:NF++DP:ICF-IID"                  , "S[NF] DUAL:DP"     , "Medicaid-Only"                 ,
  "E"           , "3300-3399" , "19:NF"                              , "Free-Standing LTC" , "Medicaid-Only"                 ,
  "E"           , "3300-3399" , "19:NF++DP:ICF-IID"                  , "S[NF] DUAL:DP"     , "Medicaid-Only"                 ,
  "G"           , "4100-4199" , "ICF-IID"                            , "Free-Standing LTC" , "Medicaid-Only"                 ,
  "G"           , "4100-4199" , "19:NF"                              , "S[NF] DUAL:DP"     , "Medicaid-Only"                 ,
  "G"           , "4100-4199" , "19:NF++DP:ICF-IID"                  , "S[NF] DUAL:DP"     , "Medicaid-Only"
)

#' *EXCEPTION: As the chart indicates, the RO always assigns a separate ICF/IID
#' (XX-G000) number to an ICF/IID or ICF/IID DP.
#'
#' NOTE: When a LTC facility is a unit of a hospital, the RO issues a number
#' separate from the hospital number according to the above guidelines. A
#' hospital is permitted to have only one hospital-based SNF DP and one
#' hospital-based NF DP.

ccn::eipps_subunit |>
  collapse::sbt(code %in% c("A", "E", "G"))
