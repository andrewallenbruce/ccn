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
  ~code,            ~range,        ~entity,                                 ~ltc_type,
  NA_character_,    "5000-6499",   "SNF (18 or 18/19)",                     "Free-Standing LTC",
  "A",              "000",         "NF (19)",                               "Free-Standing LTC",
  "E",              "000",         "NF (19)",                               "Free-Standing LTC",
  "G",              "000",         "ICF/IID",                               "Free-Standing LTC",
  NA_character_,    "5000-6499",   "SNF/NF (18/19 DUAL)",                   "SNF/NF DUAL and/or DP",
  NA_character_,    "5000-6499",   "SNF (18 or 18/19 DUAL with SNF/NF DP)", "SNF/NF DUAL and/or DP",
  "G",              "000",         "NF (19)",                               "SNF/NF DUAL and/or DP",
  "A",              "000",         "NF (19 with ICF/IID DP)",               "SNF/NF DUAL and/or DP",
  "E",              "000",         "NF (19 with ICF/IID DP)",               "SNF/NF DUAL and/or DP",
  "G",              "000",         "NF (19 with ICF/IID DP)",               "SNF/NF DUAL and/or DP",
)

#' *EXCEPTION: As the chart indicates, the RO always assigns a separate ICF/IID
#' (XX-G000) number to an ICF/IID or ICF/IID DP.
#'
#' NOTE: When a LTC facility is a unit of a hospital, the RO issues a number
#' separate from the hospital number according to the above guidelines. A
#' hospital is permitted to have only one hospital-based SNF DP and one
#' hospital-based NF DP.
