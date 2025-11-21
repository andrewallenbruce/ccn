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
#>  @ extension: NULL
ccn("05P001") # Medicare OPO
#> <ccn::MedicareOPO>
#>  @ number   : chr "05P001"
#>  @ sequence : <ccn::OpoSequence>
#>  .. @ number: chr "001"
#>  .. @ range : chr "001-099"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "05"
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ extension: NULL
#>  @ type     : <ccn::OpoType>
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
#>  @ extension: NULL
ccn("21T101")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "21T101"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
ccn("21S101")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "21S101"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
ccn("21U101")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "21U101"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "U"
#>  .. @ abbr: chr "SBA (STH)"
#>  .. @ desc: chr "Swing-Bed Approval for Short-Term Hospital"

ccn("01L008") # Medicaid Only Provider
#> <ccn::MedicaidOnlyProvider>
#>  @ number   : chr "01L008"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ extension: NULL
#>  @ type     : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "L"
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
ccn("12345E") # Emergency Hospital
#> <ccn::EmergencyHospital>
#>  @ number   : chr "12345E"
#>  @ sequence : <ccn::EmergencySequence>
#>  .. @ number: chr "345"
#>  .. @ range : chr "001-999"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ extension: NULL
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
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "02TA01"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2001"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent   : <ccn::IppsExcludedUnitParent>
#>  .. @ code  : chr "A"
#>  .. @ number: chr "022001"
ccn("04SD38")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "04SD38"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "3038"
#>  .. @ range : chr "3025-3099"
#>  .. @ abbr  : chr "REHAB"
#>  .. @ desc  : chr "Rehabilitation Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent   : <ccn::IppsExcludedUnitParent>
#>  .. @ code  : chr "D"
#>  .. @ number: chr "043038"
ccn("52TA05")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "52TA05"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2005"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent   : <ccn::IppsExcludedUnitParent>
#>  .. @ code  : chr "A"
#>  .. @ number: chr "522005"

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
#>  @ extension: NULL
ccn("21SA26")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "21SA26"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent   : <ccn::IppsExcludedUnitParent>
#>  .. @ code  : chr "A"
#>  .. @ number: chr "212026"
ccn("21TA26")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "21TA26"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ extension: NULL
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ parent   : <ccn::IppsExcludedUnitParent>
#>  .. @ code  : chr "A"
#>  .. @ number: chr "212026"

ccn("24T019A")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "24T019"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "019"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "24"
#>  .. @ abbr: chr "MN"
#>  .. @ name: chr "Minnesota"
#>  @ extension: chr "A"
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
ccn("33S23401")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "33S234"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "234"
#>  .. @ range : chr "200-299"
#>  .. @ abbr  : chr "CPH"
#>  .. @ desc  : chr "Medicaid-Only Children's Psychiatric Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ extension: chr "01"
#>  @ type     : <ccn::IPPSExcludedType>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
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
