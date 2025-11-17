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
# Medicare Provider
ccn("670055")
#> <ccn::MedicareProvider>
#>  @ number        : chr "670055"
#>  @ vec           : chr [1:6] "6" "7" "0" "0" "5" "5"
#>  @ state_code    : chr "67"
#>  @ state_abbr    : chr "TX"
#>  @ state_name    : chr "Texas"
#>  @ sequence      : chr "0055"
#>  @ facility_range: chr "0001-0879"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_desc : chr "Short-Term Hospital (General & Specialty)"
ccn("05P001") # OPO
#> <ccn::MedicareOPO>
#>  @ number        : chr "05P001"
#>  @ vec           : chr [1:6] "0" "5" "P" "0" "0" "1"
#>  @ state_code    : chr "05"
#>  @ state_abbr    : chr "CA"
#>  @ state_name    : chr "California"
#>  @ sequence      : chr "001"
#>  @ type_code     : chr "P"
#>  @ facility_range: chr "001-099"
#>  @ facility_abbr : chr "OPO"
#>  @ facility_name : chr "Organ Procurement Organization"

ccn("210101")
#> <ccn::MedicareProvider>
#>  @ number        : chr "210101"
#>  @ vec           : chr [1:6] "2" "1" "0" "1" "0" "1"
#>  @ state_code    : chr "21"
#>  @ state_abbr    : chr "MD"
#>  @ state_name    : chr "Maryland"
#>  @ sequence      : chr "0101"
#>  @ facility_range: chr "0001-0879"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_desc : chr "Short-Term Hospital (General & Specialty)"
ccn("21T101")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "21T101"
#>  @ vec           : chr [1:6] "2" "1" "T" "1" "0" "1"
#>  @ state_code    : chr "21"
#>  @ state_abbr    : chr "MD"
#>  @ state_name    : chr "Maryland"
#>  @ sequence      : chr "101"
#>  @ type_code     : chr "T"
#>  @ type_abbr     : chr "REHAB"
#>  @ type_name     : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ facility_range: chr "100-199"
#>  @ facility_abbr : chr "CHILD"
#>  @ facility_name : chr "Medicaid-Only Children's Hospital"
ccn("21S101")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "21S101"
#>  @ vec           : chr [1:6] "2" "1" "S" "1" "0" "1"
#>  @ state_code    : chr "21"
#>  @ state_abbr    : chr "MD"
#>  @ state_name    : chr "Maryland"
#>  @ sequence      : chr "101"
#>  @ type_code     : chr "S"
#>  @ type_abbr     : chr "PSYCH"
#>  @ type_name     : chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ facility_range: chr "100-199"
#>  @ facility_abbr : chr "CHILD"
#>  @ facility_name : chr "Medicaid-Only Children's Hospital"
ccn("21U101")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "21U101"
#>  @ vec           : chr [1:6] "2" "1" "U" "1" "0" "1"
#>  @ state_code    : chr "21"
#>  @ state_abbr    : chr "MD"
#>  @ state_name    : chr "Maryland"
#>  @ sequence      : chr "101"
#>  @ type_code     : chr "U"
#>  @ type_abbr     : chr "SBA (STH)"
#>  @ type_name     : chr "Swing-Bed Approval for Short-Term Hospital"
#>  @ facility_range: chr "100-199"
#>  @ facility_abbr : chr "CHILD"
#>  @ facility_name : chr "Medicaid-Only Children's Hospital"

# Medicaid Only Provider
ccn("01L008")
#> <ccn::MedicaidOnlyProvider>
#>  @ number        : chr "01L008"
#>  @ vec           : chr [1:6] "0" "1" "L" "0" "0" "8"
#>  @ state_code    : chr "01"
#>  @ state_abbr    : chr "AL"
#>  @ state_name    : chr "Alabama"
#>  @ sequence      : chr "008"
#>  @ type_code     : chr "L"
#>  @ type_abbr     : chr "PRTF"
#>  @ type_name     : chr "Psychiatric Residential Treatment Facility"
#>  @ facility_range: chr "001-099"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_name : chr "Medicaid-Only Short-Term Acute Care Hospital"

# Emergency Hospital
ccn("12345E")
#> <ccn::EmergencyHospital>
#>  @ number    : chr "12345E"
#>  @ vec       : chr [1:6] "1" "2" "3" "4" "5" "E"
#>  @ state_code: chr "12"
#>  @ state_abbr: chr "HI"
#>  @ state_name: chr "Hawaii"
#>  @ sequence  : chr "345"
#>  @ type_code : chr "E"
#>  @ type_abbr : chr "ERH-NF"
#>  @ type_desc : chr "Non-Federal Emergency Hospital (Non-Participating)"

# Supplier
ccn("10C0001062") # ASC
#> <ccn::Supplier>
#>  @ number    : chr "10C0001062"
#>  @ vec       : chr [1:10] "1" "0" "C" "0" "0" "0" "1" "0" "6" "2"
#>  @ state_code: chr "10"
#>  @ state_abbr: chr "FL"
#>  @ state_name: chr "Florida"
#>  @ sequence  : chr "0001062"
#>  @ type_code : chr "C"
#>  @ type_abbr : chr "ASC"
#>  @ type_desc : chr "Ambulatory Surgical Center"
ccn("45D0634589") # CLIA
#> <ccn::Supplier>
#>  @ number    : chr "45D0634589"
#>  @ vec       : chr [1:10] "4" "5" "D" "0" "6" "3" "4" "5" "8" "9"
#>  @ state_code: chr "45"
#>  @ state_abbr: chr "TX"
#>  @ state_name: chr "Texas"
#>  @ sequence  : chr "0634589"
#>  @ type_code : chr "D"
#>  @ type_abbr : chr "CLIA"
#>  @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
ccn("21X0009807") # Portable X-Ray
#> <ccn::Supplier>
#>  @ number    : chr "21X0009807"
#>  @ vec       : chr [1:10] "2" "1" "X" "0" "0" "0" "9" "8" "0" "7"
#>  @ state_code: chr "21"
#>  @ state_abbr: chr "MD"
#>  @ state_name: chr "Maryland"
#>  @ sequence  : chr "0009807"
#>  @ type_code : chr "X"
#>  @ type_abbr : chr "XRAY"
#>  @ type_desc : chr "Portable X-Ray Facility"

# IPPS Excluded Unit
ccn("02TA01")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "02TA01"
#>  @ vec         : chr [1:6] "0" "2" "T" "A" "0" "1"
#>  @ state_code  : chr "02"
#>  @ state_abbr  : chr "AK"
#>  @ state_name  : chr "Alaska"
#>  @ sequence    : chr "2001"
#>  @ type_code   : chr "T"
#>  @ type_abbr   : chr "REHAB"
#>  @ type_name   : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent_code : chr "A"
#>  @ parent_abbr : chr "LTCH"
#>  @ parent_range: chr "2000-2299"
#>  @ parent_name : chr "Long-Term Care Hospital"
ccn("04SD38")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "04SD38"
#>  @ vec         : chr [1:6] "0" "4" "S" "D" "3" "8"
#>  @ state_code  : chr "04"
#>  @ state_abbr  : chr "AR"
#>  @ state_name  : chr "Arkansas"
#>  @ sequence    : chr "3038"
#>  @ type_code   : chr "S"
#>  @ type_abbr   : chr "PSYCH"
#>  @ type_name   : chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent_code : chr "D"
#>  @ parent_abbr : chr "REHAB"
#>  @ parent_range: chr "3025-3099"
#>  @ parent_name : chr "Rehabilitation Hospital"
ccn("52TA05")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "52TA05"
#>  @ vec         : chr [1:6] "5" "2" "T" "A" "0" "5"
#>  @ state_code  : chr "52"
#>  @ state_abbr  : chr "WI"
#>  @ state_name  : chr "Wisconsin"
#>  @ sequence    : chr "2005"
#>  @ type_code   : chr "T"
#>  @ type_abbr   : chr "REHAB"
#>  @ type_name   : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent_code : chr "A"
#>  @ parent_abbr : chr "LTCH"
#>  @ parent_range: chr "2000-2299"
#>  @ parent_name : chr "Long-Term Care Hospital"

ccn("212026") # Parent
#> <ccn::MedicareProvider>
#>  @ number        : chr "212026"
#>  @ vec           : chr [1:6] "2" "1" "2" "0" "2" "6"
#>  @ state_code    : chr "21"
#>  @ state_abbr    : chr "MD"
#>  @ state_name    : chr "Maryland"
#>  @ sequence      : chr "2026"
#>  @ facility_range: chr "2000-2299"
#>  @ facility_abbr : chr "LTCH"
#>  @ facility_desc : chr "Long-Term Care Hospital"
ccn("21SA26")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "21SA26"
#>  @ vec         : chr [1:6] "2" "1" "S" "A" "2" "6"
#>  @ state_code  : chr "21"
#>  @ state_abbr  : chr "MD"
#>  @ state_name  : chr "Maryland"
#>  @ sequence    : chr "2026"
#>  @ type_code   : chr "S"
#>  @ type_abbr   : chr "PSYCH"
#>  @ type_name   : chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent_code : chr "A"
#>  @ parent_abbr : chr "LTCH"
#>  @ parent_range: chr "2000-2299"
#>  @ parent_name : chr "Long-Term Care Hospital"
ccn("21TA26")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "21TA26"
#>  @ vec         : chr [1:6] "2" "1" "T" "A" "2" "6"
#>  @ state_code  : chr "21"
#>  @ state_abbr  : chr "MD"
#>  @ state_name  : chr "Maryland"
#>  @ sequence    : chr "2026"
#>  @ type_code   : chr "T"
#>  @ type_abbr   : chr "REHAB"
#>  @ type_name   : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent_code : chr "A"
#>  @ parent_abbr : chr "LTCH"
#>  @ parent_range: chr "2000-2299"
#>  @ parent_name : chr "Long-Term Care Hospital"
```
