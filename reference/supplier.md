# Medicare Supplier

Convert various codes to their associated names.

## Usage

``` r
supplier(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Supplier`.

## Examples

``` r
supplier("10C0001062")
#> <ccn::Supplier>
#>  @ ccn     : chr "10C0001062"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "FL"
#>  .. @ name: chr "Florida"
#>  @ sequence: chr "0001062"
#>  @ range   : chr "0000001-9999999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "C"
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ ext     : chr NA
supplier("45D0634589")
#> <ccn::Supplier>
#>  @ ccn     : chr "45D0634589"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence: chr "0634589"
#>  @ range   : chr "0000001-9999999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "D"
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  @ ext     : chr NA
supplier("21X0009807")
#> <ccn::Supplier>
#>  @ ccn     : chr "21X0009807"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: chr "0009807"
#>  @ range   : chr "0000001-9999999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "X"
#>  .. @ abbr: chr "PXRF"
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  @ ext     : chr NA
supplier("12C0001062")
#> <ccn::Supplier>
#>  @ ccn     : chr "12C0001062"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence: chr "0001062"
#>  @ range   : chr "0000001-9999999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "C"
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ ext     : chr NA
```
