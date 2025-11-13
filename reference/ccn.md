# Decode a CCN

Decode a CCN into its component parts.

## Usage

``` r
ccn(x)
```

## Arguments

- x:

  character vector of CCNs.

## Value

list of CCN components.

## Examples

``` r
ccn("01P001") # OPO
#> <ccn::MedicareOPO>
#>  @ ccn            : chr "01P001"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "0" "1" "P" "0" "0" "1"
#>  @ state_code     : chr "01"
#>  @ state_abbr     : chr "AL"
#>  @ state_name     : chr "Alabama"
#>  @ sequence_number: chr "001"
#>  @ type_code      : chr "P"
#>  @ facility_range : chr "001-099"
#>  @ facility_abbr  : chr "OPO"
#>  @ facility_name  : chr "Organ Procurement Organization"
ccn("05P001") # OPO
#> <ccn::MedicareOPO>
#>  @ ccn            : chr "05P001"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "0" "5" "P" "0" "0" "1"
#>  @ state_code     : chr "05"
#>  @ state_abbr     : chr "CA"
#>  @ state_name     : chr "California"
#>  @ sequence_number: chr "001"
#>  @ type_code      : chr "P"
#>  @ facility_range : chr "001-099"
#>  @ facility_abbr  : chr "OPO"
#>  @ facility_name  : chr "Organ Procurement Organization"
ccn("670055")
#> <ccn::MedicareProvider>
#>  @ ccn            : chr "670055"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "6" "7" "0" "0" "5" "5"
#>  @ state_code     : chr "67"
#>  @ state_abbr     : chr "TX"
#>  @ state_name     : chr "Texas"
#>  @ sequence_number: chr "0055"
#>  @ facility_range : chr "0001-0879"
#>  @ facility_abbr  : chr "ACUTE"
#>  @ facility_desc  : chr "Short-Term Hospital (General & Specialty)"

ccn("210101")
#> <ccn::MedicareProvider>
#>  @ ccn            : chr "210101"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "0" "1" "0" "1"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "0101"
#>  @ facility_range : chr "0001-0879"
#>  @ facility_abbr  : chr "ACUTE"
#>  @ facility_desc  : chr "Short-Term Hospital (General & Specialty)"
ccn("21T101")
#> <ccn::IPPSExcludedProvider>
#>  @ ccn            : chr "21T101"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "T" "1" "0" "1"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "101"
#>  @ type_code      : chr "T"
#>  @ type_abbr      : chr NA
#>  @ type_name      : chr NA
#>  @ facility_range : chr "100-199"
#>  @ facility_abbr  : chr "CHILD"
#>  @ facility_name  : chr "Medicaid-Only Children's Hospital"
ccn("21S101")
#> <ccn::IPPSExcludedProvider>
#>  @ ccn            : chr "21S101"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "S" "1" "0" "1"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "101"
#>  @ type_code      : chr "S"
#>  @ type_abbr      : chr NA
#>  @ type_name      : chr NA
#>  @ facility_range : chr "100-199"
#>  @ facility_abbr  : chr "CHILD"
#>  @ facility_name  : chr "Medicaid-Only Children's Hospital"
ccn("21U101")
#> <ccn::IPPSExcludedProvider>
#>  @ ccn            : chr "21U101"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "U" "1" "0" "1"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "101"
#>  @ type_code      : chr "U"
#>  @ type_abbr      : chr NA
#>  @ type_name      : chr NA
#>  @ facility_range : chr "100-199"
#>  @ facility_abbr  : chr "CHILD"
#>  @ facility_name  : chr "Medicaid-Only Children's Hospital"

ccn("212026")
#> <ccn::MedicareProvider>
#>  @ ccn            : chr "212026"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "2" "0" "2" "6"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "2026"
#>  @ facility_range : chr "2000-2299"
#>  @ facility_abbr  : chr "LTCH"
#>  @ facility_desc  : chr "Long-Term Care Hospital"
ccn("21SA26")
#> <ccn::IPPSExcludedProvider>
#>  @ ccn            : chr "21SA26"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "S" "A" "2" "6"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "A26"
#>  @ type_code      : chr "S"
#>  @ type_abbr      : chr NA
#>  @ type_name      : chr NA
#>  @ facility_range : chr NA
#>  @ facility_abbr  : chr NA
#>  @ facility_name  : chr NA
ccn("21TA26")
#> <ccn::IPPSExcludedProvider>
#>  @ ccn            : chr "21TA26"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "T" "A" "2" "6"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "A26"
#>  @ type_code      : chr "T"
#>  @ type_abbr      : chr NA
#>  @ type_name      : chr NA
#>  @ facility_range : chr NA
#>  @ facility_abbr  : chr NA
#>  @ facility_name  : chr NA

ccn("01L008") # Medicaid Only Provider
#> <ccn::MedicaidOnlyProvider>
#>  @ ccn            : chr "01L008"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "0" "1" "L" "0" "0" "8"
#>  @ state_code     : chr "01"
#>  @ state_abbr     : chr "AL"
#>  @ state_name     : chr "Alabama"
#>  @ sequence_number: chr "008"
#>  @ type_code      : chr "L"
#>  @ type_abbr      : chr "PRTF"
#>  @ type_name      : chr "Psychiatric Residential Treatment Facility"
#>  @ facility_range : chr "001-099"
#>  @ facility_abbr  : chr "ACUTE"
#>  @ facility_name  : chr "Medicaid-Only Short-Term Acute Care Hospital"

ccn("12345E") # Emergency Hospital
#> <ccn::EmergencyHospital>
#>  @ ccn            : chr "12345E"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "1" "2" "3" "4" "5" "E"
#>  @ state_code     : chr "12"
#>  @ state_abbr     : chr "HI"
#>  @ state_name     : chr "Hawaii"
#>  @ sequence_number: chr "345"
#>  @ type_code      : chr "E"
#>  @ type_abbr      : chr "ERH-NF"
#>  @ type_desc      : chr "Non-Federal Emergency Hospital (Non-Participating)"

ccn("10C0001062") # ASC
#> <ccn::Supplier>
#>  @ ccn            : chr "10C0001062"
#>  @ chr            : int 10
#>  @ vec            : chr [1:10] "1" "0" "C" "0" "0" "0" "1" "0" "6" "2"
#>  @ state_code     : chr "10"
#>  @ state_abbr     : chr "FL"
#>  @ state_name     : chr "Florida"
#>  @ sequence_number: chr "0001062"
#>  @ type_code      : chr "C"
#>  @ type_abbr      : chr "ASC"
#>  @ type_desc      : chr "Ambulatory Surgical Center"
ccn("45D0634589") # CLIA
#> <ccn::Supplier>
#>  @ ccn            : chr "45D0634589"
#>  @ chr            : int 10
#>  @ vec            : chr [1:10] "4" "5" "D" "0" "6" "3" "4" "5" "8" "9"
#>  @ state_code     : chr "45"
#>  @ state_abbr     : chr "TX"
#>  @ state_name     : chr "Texas"
#>  @ sequence_number: chr "0634589"
#>  @ type_code      : chr "D"
#>  @ type_abbr      : chr "CLIA"
#>  @ type_desc      : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
ccn("21X0009807") # Portable X-Ray
#> <ccn::Supplier>
#>  @ ccn            : chr "21X0009807"
#>  @ chr            : int 10
#>  @ vec            : chr [1:10] "2" "1" "X" "0" "0" "0" "9" "8" "0" "7"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "0009807"
#>  @ type_code      : chr "X"
#>  @ type_abbr      : chr "XRAY"
#>  @ type_desc      : chr "Portable X-Ray Facility"
```
