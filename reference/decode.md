# Decode CMS Certification Numbers (CCNs)

Decode a CCN into its component parts.

## Usage

``` r
decode(x)
```

## Arguments

- x:

  character vector of CCNs.

## Value

list of CCN components.

## Examples

``` r
decode("670055") # Medicare Provider
#> <ccn::Medicare>
#>  @ ccn      : chr "670055"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "67"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0055"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ extension: chr NA
decode("05P001") # Medicare OPO
#> <ccn::MedicareOPO>
#>  @ ccn      : chr "05P001"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "05"
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "001"
#>  .. @ range : chr "001-099"
#>  @ extension: chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "P"
#>  .. @ desc: chr "Organ Procurement Organization"
#>  .. @ abbr: chr "OPO"
decode("12345E") # Emergency Hospital
#> <ccn::EmergencyHospital>
#>  @ ccn      : chr "12345E"
#>  @ entity   : chr "Emergency Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "345"
#>  .. @ range : chr "001-999"
#>  @ extension: chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "E"
#>  .. @ desc: chr "Non-Federal Emergency Hospital (Non-Participating)"
#>  .. @ abbr: chr "ER (NF)"
decode("01L008") # Medicaid Only Provider
#> <ccn::MedicaidOnly>
#>  @ ccn      : chr "01L008"
#>  @ entity   : chr "Medicaid Only Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ extension: chr NA
#>  @ type     : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "L"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
#>  .. @ abbr: chr "PRTF"

decode("210101")
#> <ccn::Medicare>
#>  @ ccn      : chr "210101"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0101"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ extension: chr NA
decode("21T101")
#> <ccn::IppsExcluded>
#>  @ ccn      : chr "21T101"
#>  @ entity   : chr "IPPS Excluded Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ extension: chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  .. @ abbr: chr "REHAB"
decode("21S101")
#> <ccn::IppsExcluded>
#>  @ ccn      : chr "21S101"
#>  @ entity   : chr "IPPS Excluded Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ extension: chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  .. @ abbr: chr "PSYCH"
decode("21U101")
#> <ccn::IppsExcluded>
#>  @ ccn      : chr "21U101"
#>  @ entity   : chr "IPPS Excluded Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ extension: chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "U"
#>  .. @ desc: chr "Swing-Bed Approval for Short-Term Hospital"
#>  .. @ abbr: chr "SBA (ACUTE)"

decode("10C0001062") # Supplier ASC
#> <ccn::Supplier>
#>  @ ccn      : chr "10C0001062"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "10"
#>  .. @ abbr: chr "FL"
#>  .. @ name: chr "Florida"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0001062"
#>  .. @ range : chr "0000001-9999999"
#>  @ extension: chr NA
#>  @ type     : <ccn::SupplierType>
#>  .. @ code: chr "C"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  .. @ abbr: chr "ASC"
decode("45D0634589") # Supplier CLIA
#> <ccn::Supplier>
#>  @ ccn      : chr "45D0634589"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "45"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0634589"
#>  .. @ range : chr "0000001-9999999"
#>  @ extension: chr NA
#>  @ type     : <ccn::SupplierType>
#>  .. @ code: chr "D"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  .. @ abbr: chr "CLIA"
decode("21X0009807") # Supplier Portable X-Ray
#> <ccn::Supplier>
#>  @ ccn      : chr "21X0009807"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0009807"
#>  .. @ range : chr "0000001-9999999"
#>  @ extension: chr NA
#>  @ type     : <ccn::SupplierType>
#>  .. @ code: chr "X"
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  .. @ abbr: chr "XRAY"

decode("02TA01") # IPPS Excluded Unit
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'
decode("04SD38")
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'
decode("52TA05")
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'

decode("212026") # Parent
#> <ccn::Medicare>
#>  @ ccn      : chr "212026"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ extension: chr NA
decode("21SA26")
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'
decode("21TA26")
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'

decode("24T019A")
#> <ccn::IppsExcluded>
#>  @ ccn      : chr "24T019"
#>  @ entity   : chr "IPPS Excluded Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "24"
#>  .. @ abbr: chr "MN"
#>  .. @ name: chr "Minnesota"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "019"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ extension: chr "A"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  .. @ abbr: chr "REHAB"
decode("33S23401")
#> <ccn::IppsExcluded>
#>  @ ccn      : chr "33S234"
#>  @ entity   : chr "IPPS Excluded Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "234"
#>  .. @ range : chr "200-299"
#>  .. @ abbr  : chr "CPH"
#>  .. @ desc  : chr "Medicaid-Only Children's Psychiatric Hospital"
#>  @ extension: chr "01"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  .. @ abbr: chr "PSYCH"
decode("330027001")
#> <ccn::Medicare>
#>  @ ccn      : chr "330027"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0027"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ extension: chr "001"
```
