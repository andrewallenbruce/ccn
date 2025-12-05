# Medicaid-Only Facilities

Convert various codes to their associated names.

## Usage

``` r
medicaid(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicaid`.

## Examples

``` r
medicaid("01L008")
#> <ccn::Medicaid>
#>  @ ccn     : chr "01L008"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::MedicaidType>
#>  .. @ code: chr "L"
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
medicaid("22B201")
#> <ccn::Medicaid>
#>  @ ccn     : chr "22B201"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "22"
#>  .. @ abbr: chr "MA"
#>  .. @ name: chr "Massachusetts"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "201"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::MedicaidType>
#>  .. @ code: chr "B"
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility (Formerly Assigned to Medicaid SNF)"
medicaid("23E301")
#> <ccn::Medicaid>
#>  @ ccn     : chr "23E301"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "23"
#>  .. @ abbr: chr "MI"
#>  .. @ name: chr "Michigan"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "301"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::MedicaidType>
#>  .. @ code: chr "E"
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility (Formerly Assigned to ICF)"
medicaid("34F401")
#> <ccn::Medicaid>
#>  @ ccn     : chr "34F401"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "34"
#>  .. @ abbr: chr "NC"
#>  .. @ name: chr "North Carolina"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "401"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::MedicaidType>
#>  .. @ code: chr "F"
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility (Formerly Assigned to ICF)"
medicaid("01J008")
#> <ccn::Medicaid>
#>  @ ccn     : chr "01J008"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence: <ccn::SequenceMOH>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Acute Care Hospital"
#>  @ type    : <ccn::MedicaidType>
#>  .. @ code: chr "J"
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
medicaid("A5J508")
#> <ccn::Medicaid>
#>  @ ccn     : chr "A5J508"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "A5"
#>  .. @ abbr: chr "MS"
#>  .. @ name: chr "Mississippi"
#>  @ sequence: <ccn::SequenceMOH>
#>  .. @ number: chr "508"
#>  .. @ range : chr "500-599"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Hospital"
#>  @ type    : <ccn::MedicaidType>
#>  .. @ code: chr "J"
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
```
