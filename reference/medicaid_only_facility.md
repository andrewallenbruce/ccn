# Medicaid-Only Facilities

Convert various codes to their associated names.

## Usage

``` r
medicaid_only_facility(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `MedicaidOnlyFacility`.

## Examples

``` r
medicaid_only_facility("01L008")
#> <ccn::MedicaidOnlyFacility>
#>  @ ccn     : chr "01L008"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "L"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
#>  .. @ abbr: chr "PRTF"
medicaid_only_facility("22B201")
#> <ccn::MedicaidOnlyFacility>
#>  @ ccn     : chr "22B201"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "22"
#>  .. @ abbr: chr "MA"
#>  .. @ name: chr "Massachusetts"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "201"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "B"
#>  .. @ desc: chr "Nursing Facility (Formerly Assigned to Medicaid SNF)"
#>  .. @ abbr: chr "NF"
medicaid_only_facility("23E301")
#> <ccn::MedicaidOnlyFacility>
#>  @ ccn     : chr "23E301"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "23"
#>  .. @ abbr: chr "MI"
#>  .. @ name: chr "Michigan"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "301"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "E"
#>  .. @ desc: chr "Nursing Facility (Formerly Assigned to ICF)"
#>  .. @ abbr: chr "NF"
medicaid_only_facility("34F401")
#> <ccn::MedicaidOnlyFacility>
#>  @ ccn     : chr "34F401"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "34"
#>  .. @ abbr: chr "NC"
#>  .. @ name: chr "North Carolina"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "401"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "F"
#>  .. @ desc: chr "Nursing Facility (Formerly Assigned to ICF)"
#>  .. @ abbr: chr "NF"
```
