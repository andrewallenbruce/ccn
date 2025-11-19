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
ccn("670055") # Medicare Provider
#> <ccn::MedicareProvider>
#>  @ number   : chr "670055"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0055"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "67"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ extension: chr(0) 
ccn("05P001") # Medicare OPO
#> <ccn::MedicareOPO>
#>  @ number   : chr "05P001"
#>  @ sequence : <ccn::OPOSequence>
#>  .. @ number: chr "001"
#>  .. @ range : chr "001-099"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "05"
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ extension: chr(0) 
#>  @ type     : <ccn::OPOType>
#>  .. @ code: chr "P"
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"

ccn("210101")
#> <ccn::MedicareProvider>
#>  @ number   : chr "210101"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0101"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: chr(0) 
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

ccn("01L008") # Medicaid Only Provider
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
ccn("12345E") # Emergency Hospital
#> <ccn::EmergencyHospital>
#>  @ number   : chr "12345E"
#>  @ sequence : chr "345"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ extension: chr(0) 
#>  @ type     : <ccn::EmergencyType>
#>  .. @ code: chr "E"
#>  .. @ abbr: chr "ER (NF)"
#>  .. @ desc: chr "Non-Federal Emergency Hospital (Non-Participating)"
ccn("10C0001062") # Supplier ASC
#> <ccn::Supplier>
#>  @ number  : chr "10C0001062"
#>  @ sequence: <ccn::SupplierSequence>
#>  .. @ number: chr "0001062"
#>  .. @ range : chr "000001-9999999"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "10"
#>  .. @ abbr: chr "FL"
#>  .. @ name: chr "Florida"
#>  @ type    : <ccn::SupplierType>
#>  .. @ code: chr "C"
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
ccn("45D0634589") # Supplier CLIA
#> <ccn::Supplier>
#>  @ number  : chr "45D0634589"
#>  @ sequence: <ccn::SupplierSequence>
#>  .. @ number: chr "0634589"
#>  .. @ range : chr "000001-9999999"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "45"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ type    : <ccn::SupplierType>
#>  .. @ code: chr "D"
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
ccn("21X0009807") # Supplier Portable X-Ray
#> <ccn::Supplier>
#>  @ number  : chr "21X0009807"
#>  @ sequence: <ccn::SupplierSequence>
#>  .. @ number: chr "0009807"
#>  .. @ range : chr "000001-9999999"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ type    : <ccn::SupplierType>
#>  .. @ code: chr "X"
#>  .. @ abbr: chr "XRAY"
#>  .. @ desc: chr "Portable X-Ray Facility"

ccn("02TA01") # IPPS Excluded Unit
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
#>  @ number   : chr "212026"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: chr(0) 
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
#>  @ number   : chr "330027"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0027"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ extension: chr "001"
```
