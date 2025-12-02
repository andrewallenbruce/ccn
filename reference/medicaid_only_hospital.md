# Medicaid-Only Hospitals

Convert various codes to their associated names.

## Usage

``` r
medicaid_only_hospital(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `MedicaidOnlyHospital`.

## Examples

``` r
medicaid_only_hospital("01J008")
#> <ccn::MedicaidOnlyHospital>
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
#>  @ type    : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "J"
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
medicaid_only_hospital("A5J508")
#> <ccn::MedicaidOnlyHospital>
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
#>  @ type    : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "J"
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
```
