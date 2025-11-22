# Decode a CCN

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
#> <ccn::MedicareProvider>
#>  @ number   : chr "670055"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "67"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0055"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr NA
#>  .. @ abbr: chr NA
#>  .. @ desc: chr NA
#>  @ extension: chr NA
decode("05P001") # Medicare OPO
#> <ccn::MedicareOPO>
#>  @ number   : chr "05P001"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "05"
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "001"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr NA
#>  .. @ desc  : chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "P"
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"
#>  @ extension: chr NA
decode("12345E") # Emergency Hospital
#> <ccn::EmergencyHospital>
#>  @ number   : chr "12345E"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "345"
#>  .. @ range : chr "001-999"
#>  .. @ abbr  : chr NA
#>  .. @ desc  : chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "E"
#>  .. @ abbr: chr "ER (NF)"
#>  .. @ desc: chr "Non-Federal Emergency Hospital (Non-Participating)"
#>  @ extension: chr NA
decode("01L008") # Medicaid Only Provider
#> <ccn::MedicaidOnly>
#>  @ number   : chr "01L008"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "L"
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
#>  @ extension: chr NA

decode("210101")
#> <ccn::MedicareProvider>
#>  @ number   : chr "210101"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0101"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr NA
#>  .. @ abbr: chr NA
#>  .. @ desc: chr NA
#>  @ extension: chr NA
decode("21T101")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "21T101"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
decode("21S101")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "21S101"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
decode("21U101")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "21U101"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "100-199"
#>  .. @ abbr  : chr "CHILD"
#>  .. @ desc  : chr "Medicaid-Only Children's Hospital"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "U"
#>  .. @ abbr: chr "SBA (ACUTE)"
#>  .. @ desc: chr "Swing-Bed Approval for Short-Term Hospital"
#>  @ extension: chr NA

decode("10C0001062") # Supplier ASC
#> <ccn::MedicareSupplier>
#>  @ number   : chr "10C0001062"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "10"
#>  .. @ abbr: chr "FL"
#>  .. @ name: chr "Florida"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0001062"
#>  .. @ range : chr "0000001-9999999"
#>  .. @ abbr  : chr NA
#>  .. @ desc  : chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "C"
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: chr NA
decode("45D0634589") # Supplier CLIA
#> <ccn::MedicareSupplier>
#>  @ number   : chr "45D0634589"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "45"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0634589"
#>  .. @ range : chr "0000001-9999999"
#>  .. @ abbr  : chr NA
#>  .. @ desc  : chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "D"
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  @ extension: chr NA
decode("21X0009807") # Supplier Portable X-Ray
#> <ccn::MedicareSupplier>
#>  @ number   : chr "21X0009807"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0009807"
#>  .. @ range : chr "0000001-9999999"
#>  .. @ abbr  : chr NA
#>  .. @ desc  : chr NA
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "X"
#>  .. @ abbr: chr "XRAY"
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  @ extension: chr NA

decode("02TA01") # IPPS Excluded Unit
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "02TA01"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "2001"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
#>  @ parent   : <ccn::IppsExcludedParent>
#>  .. @ type: chr "A"
#>  .. @ ccn : chr "022001"
decode("04SD38")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "04SD38"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "3038"
#>  .. @ range : chr "3025-3099"
#>  .. @ abbr  : chr "REHAB"
#>  .. @ desc  : chr "Rehabilitation Hospital (Excluded from IPPS)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
#>  @ parent   : <ccn::IppsExcludedParent>
#>  .. @ type: chr "D"
#>  .. @ ccn : chr "043038"
decode("52TA05")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "52TA05"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "2005"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
#>  @ parent   : <ccn::IppsExcludedParent>
#>  .. @ type: chr "A"
#>  .. @ ccn : chr "522005"

decode("212026") # Parent
#> <ccn::MedicareProvider>
#>  @ number   : chr "212026"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr NA
#>  .. @ abbr: chr NA
#>  .. @ desc: chr NA
#>  @ extension: chr NA
decode("21SA26")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "21SA26"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
#>  @ parent   : <ccn::IppsExcludedParent>
#>  .. @ type: chr "A"
#>  .. @ ccn : chr "212026"
decode("21TA26")
#> <ccn::IppsExcludedUnit>
#>  @ number   : chr "21TA26"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr NA
#>  @ parent   : <ccn::IppsExcludedParent>
#>  .. @ type: chr "A"
#>  .. @ ccn : chr "212026"

decode("24T019A")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "24T019A"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "24"
#>  .. @ abbr: chr "MN"
#>  .. @ name: chr "Michigan"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "019"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "REHAB"
#>  .. @ desc: chr "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr "A"
decode("33S23401")
#> <ccn::IppsExcludedProvider>
#>  @ number   : chr "33S23401"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "234"
#>  .. @ range : chr "200-299"
#>  .. @ abbr  : chr "CPH"
#>  .. @ desc  : chr "Medicaid-Only Children's Psychiatric Hospital"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSYCH"
#>  .. @ desc: chr "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#>  @ extension: chr "01"
decode("330027001")
#> <ccn::MedicareProvider>
#>  @ number   : chr "330027001"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "33"
#>  .. @ abbr: chr "NY"
#>  .. @ name: chr "New York"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0027"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr NA
#>  .. @ abbr: chr NA
#>  .. @ desc: chr NA
#>  @ extension: chr "001"
```
