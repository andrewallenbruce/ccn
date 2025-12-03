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
#' the same address.) Use XX-5000 series for facilities providing Medicare or
#' Medicare/Medicaid services, and the alphanumeric series (XX-A000 or XX-E000
#' or XX-G000) for Medicaid-only facilities, as shown in the following charts:

ltc_ccns <- tibble::tribble(
  ~facility_type,                           ~ccn,
  # FREE STANDING LTC FACILITIES
  "18 or 18/19 SNF",                        "5000",
  "19 NF",                                  "A000/E000",
  "ICF/IID",                                "G000",
  # SNF/NF DUALLY-PARTICIPATING AND/OR DISTINCT PART FACILITIES
  "18/19 SNF/NF DUAL",                      "5000",
  "18 SNF or 18/19 DUAL with SNF or NF DP", "5000",
  "18 or 18/19 DUAL with SNF or NF DP",     "5000",
  "19 NF",                                  "A000",
  "19 NF with ICF/IID DP",                  "A000/E000/G000*"
)

#' *EXCEPTION: As the chart indicates, the RO always assigns a separate ICF/IID
#' (XX-G000) number to an ICF/IID or ICF/IID DP.
#'
#' NOTE: When a LTC facility is a unit of a hospital, the RO issues a number
#' separate from the hospital number according to the above guidelines. A
#' hospital is permitted to have only one hospital-based SNF DP and one
#' hospital-based NF DP.
