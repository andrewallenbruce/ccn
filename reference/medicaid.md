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
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence: chr "008"
#>  @ range   : chr "001-999"
#>  @ type    : <ccn::TypeMOF>
#>  .. @ code: chr "L"
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
medicaid("22B201")
#> <ccn::Medicaid>
#>  @ ccn     : chr "22B201"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "MA"
#>  .. @ name: chr "Massachusetts"
#>  @ sequence: chr "201"
#>  @ range   : chr "001-999"
#>  @ type    : <ccn::TypeMOF>
#>  .. @ code: chr "B"
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
medicaid("23E301")
#> <ccn::Medicaid>
#>  @ ccn     : chr "23E301"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "MI"
#>  .. @ name: chr "Michigan"
#>  @ sequence: chr "301"
#>  @ range   : chr "001-999"
#>  @ type    : <ccn::TypeMOF>
#>  .. @ code: chr "E"
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
medicaid("34F401")
#> <ccn::Medicaid>
#>  @ ccn     : chr "34F401"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "NC"
#>  .. @ name: chr "North Carolina"
#>  @ sequence: chr "401"
#>  @ range   : chr "001-999"
#>  @ type    : <ccn::TypeMOF>
#>  .. @ code: chr "F"
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
medicaid("01J008")
#> <ccn::Medicaid>
#>  @ ccn     : chr "01J008"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ sequence: chr "008"
#>  @ range   : <ccn::RangeMOH>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "STAC"
#>  .. @ desc  : chr "Short-Term Acute Care Hospital"
#>  @ type    : <ccn::TypeMOF>
#>  .. @ code: chr "J"
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
medicaid("A5J508")
#> <ccn::Medicaid>
#>  @ ccn     : chr "A5J508"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "MS"
#>  .. @ name: chr "Mississippi"
#>  @ sequence: chr "508"
#>  @ range   : <ccn::RangeMOH>
#>  .. @ number: chr "508"
#>  .. @ range : chr "500-599"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Hospital"
#>  @ type    : <ccn::TypeMOF>
#>  .. @ code: chr "J"
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
```
