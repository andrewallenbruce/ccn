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
#>  @ sequence      : chr "0055"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "67"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ extension     : chr(0) 
#>  @ facility_range: chr "0001-0879"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_desc : chr "Short-Term Hospital (General & Specialty)"
ccn("05P001") # OPO
#> <ccn::MedicareOPO>
#>  @ number        : chr "05P001"
#>  @ sequence      : chr "001"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "05"
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ extension     : chr(0) 
#>  @ type_code     : chr "P"
#>  @ facility_range: chr "001-099"
#>  @ facility_abbr : chr "OPO"
#>  @ facility_name : chr "Organ Procurement Organization"

ccn("210101")
#> <ccn::MedicareProvider>
#>  @ number        : chr "210101"
#>  @ sequence      : chr "0101"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension     : chr(0) 
#>  @ facility_range: chr "0001-0879"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_desc : chr "Short-Term Hospital (General & Specialty)"
ccn("21T101")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "21T101"
#>  @ sequence      : chr "101"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension     : chr(0) 
#>  @ type_code     : chr "T"
#>  @ type_abbr     : chr "REHAB"
#>  @ type_name     : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ facility_range: chr "100-199"
#>  @ facility_abbr : chr "CHILD"
#>  @ facility_name : chr "Medicaid-Only Children's Hospital"
ccn("21S101")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "21S101"
#>  @ sequence      : chr "101"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension     : chr(0) 
#>  @ type_code     : chr "S"
#>  @ type_abbr     : chr "PSYCH"
#>  @ type_name     : chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ facility_range: chr "100-199"
#>  @ facility_abbr : chr "CHILD"
#>  @ facility_name : chr "Medicaid-Only Children's Hospital"
ccn("21U101")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "21U101"
#>  @ sequence      : chr "101"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension     : chr(0) 
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
#>  @ sequence      : chr "008"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ extension     : chr(0) 
#>  @ type_code     : chr "L"
#>  @ type_abbr     : chr "PRTF"
#>  @ type_name     : chr "Psychiatric Residential Treatment Facility"
#>  @ facility_range: chr "001-099"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_name : chr "Medicaid-Only Short-Term Acute Care Hospital"

# Emergency Hospital
ccn("12345E")
#> <ccn::EmergencyHospital>
#>  @ number   : chr "12345E"
#>  @ sequence : chr "345"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ extension: chr(0) 
#>  @ type_code: chr "E"
#>  @ type_abbr: chr "ERH-NF"
#>  @ type_desc: chr "Non-Federal Emergency Hospital (Non-Participating)"

# Supplier
ccn("10C0001062") # ASC
#> <ccn::Supplier>
#>  @ number   : chr "10C0001062"
#>  @ sequence : chr "0001062"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "10"
#>  .. @ abbr: chr "FL"
#>  .. @ name: chr "Florida"
#>  @ type_code: chr "C"
#>  @ type_abbr: chr "ASC"
#>  @ type_desc: chr "Ambulatory Surgical Center"
ccn("45D0634589") # CLIA
#> <ccn::Supplier>
#>  @ number   : chr "45D0634589"
#>  @ sequence : chr "0634589"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "45"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ type_code: chr "D"
#>  @ type_abbr: chr "CLIA"
#>  @ type_desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
ccn("21X0009807") # Portable X-Ray
#> <ccn::Supplier>
#>  @ number   : chr "21X0009807"
#>  @ sequence : chr "0009807"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ type_code: chr "X"
#>  @ type_abbr: chr "XRAY"
#>  @ type_desc: chr "Portable X-Ray Facility"

# IPPS Excluded Unit
ccn("02TA01")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "02TA01"
#>  @ sequence    : chr "2001"
#>  @ state       : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ extension   : chr(0) 
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
#>  @ sequence    : chr "3038"
#>  @ state       : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ extension   : chr(0) 
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
#>  @ sequence    : chr "2005"
#>  @ state       : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ extension   : chr(0) 
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
#>  @ sequence      : chr "2026"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension     : chr(0) 
#>  @ facility_range: chr "2000-2299"
#>  @ facility_abbr : chr "LTCH"
#>  @ facility_desc : chr "Long-Term Care Hospital"
ccn("21SA26")
#> <ccn::IPPSExcludedUnit>
#>  @ number      : chr "21SA26"
#>  @ sequence    : chr "2026"
#>  @ state       : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension   : chr(0) 
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
#>  @ sequence    : chr "2026"
#>  @ state       : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension   : chr(0) 
#>  @ type_code   : chr "T"
#>  @ type_abbr   : chr "REHAB"
#>  @ type_name   : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent_code : chr "A"
#>  @ parent_abbr : chr "LTCH"
#>  @ parent_range: chr "2000-2299"
#>  @ parent_name : chr "Long-Term Care Hospital"

ccn("24T019A")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "24T019"
#>  @ sequence      : chr "019"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "24"
#>  .. @ abbr: chr "MN"
#>  .. @ name: chr "Minnesota"
#>  @ extension     : chr "A"
#>  @ type_code     : chr "T"
#>  @ type_abbr     : chr "REHAB"
#>  @ type_name     : chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ facility_range: chr "001-099"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_name : chr "Medicaid-Only Short-Term Acute Care Hospital"
ccn("33S23401")
#> <ccn::IPPSExcludedProvider>
#>  @ number        : chr "33S234"
#>  @ sequence      : chr "234"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ extension     : chr "01"
#>  @ type_code     : chr "S"
#>  @ type_abbr     : chr "PSYCH"
#>  @ type_name     : chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ facility_range: chr "200-299"
#>  @ facility_abbr : chr "CPH"
#>  @ facility_name : chr "Medicaid-Only Children's Psychiatric Hospital"
ccn("330027001")
#> <ccn::MedicareProvider>
#>  @ number        : chr "330027"
#>  @ sequence      : chr "0027"
#>  @ state         : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ extension     : chr "001"
#>  @ facility_range: chr "0001-0879"
#>  @ facility_abbr : chr "ACUTE"
#>  @ facility_desc : chr "Short-Term Hospital (General & Specialty)"
```
