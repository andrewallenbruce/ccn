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
#>  @ ccn  : chr "01L008"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
medicaid("22B201")
#> <ccn::Medicaid>
#>  @ ccn  : chr "22B201"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MA"
#>  .. @ name: chr "Massachusetts"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
medicaid("23E301")
#> <ccn::Medicaid>
#>  @ ccn  : chr "23E301"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MI"
#>  .. @ name: chr "Michigan"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
medicaid("34F401")
#> <ccn::Medicaid>
#>  @ ccn  : chr "34F401"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "NC"
#>  .. @ name: chr "North Carolina"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
medicaid("01J008")
#> <ccn::Medicaid>
#>  @ ccn  : chr "01J008"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "001-099"
#>  .. @ abbr  : chr "STAC"
#>  .. @ desc  : chr "Short-Term Acute Care Hospital"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
medicaid("A5J508")
#> <ccn::Medicaid>
#>  @ ccn  : chr "A5J508"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MS"
#>  .. @ name: chr "Mississippi"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "500-599"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Hospital"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
```
