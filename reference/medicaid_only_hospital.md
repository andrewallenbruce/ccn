# Medicaid-Only Hospitals

Convert various codes to their associated names.

## Usage

``` r
new_medicaid_only_hospital(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
new_medicaid_only_hospital("01J008")
#> <ccn::MedicaidOnlyHospital>
#>  @ ccn     : chr "01J008"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence: <ccn::MedicaidHospitalSequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "STACH"
#>  .. @ desc  : chr "Medicaid-Only Hospital (Short-Term Acute Care)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "J"
#>  .. @ desc: chr "Medicaid-Only Hospital"
#>  .. @ abbr: chr "MOH"
new_medicaid_only_hospital("A5J508")
#> <ccn::MedicaidOnlyHospital>
#>  @ ccn     : chr "A5J508"
#>  @ entity  : chr "Medicaid-Only Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "A5"
#>  .. @ abbr: chr "MS"
#>  .. @ name: chr "Mississippi"
#>  @ sequence: <ccn::MedicaidHospitalSequence>
#>  .. @ number: chr "508"
#>  .. @ range : chr "500-599"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Medicaid-Only Hospital (Long-Term)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "J"
#>  .. @ desc: chr "Medicaid-Only Hospital"
#>  .. @ abbr: chr "MOH"
```
