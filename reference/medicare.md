# Medicare Provider

Convert various codes to their associated names.

## Usage

``` r
medicare(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicare`.

## Examples

``` r
medicare("670055")
#> <ccn::Medicare>
#>  @ ccn     : chr "670055"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "67"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence: chr "0055"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "0055"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ ext     : chr NA
medicare("123456")
#> <ccn::Medicare>
#>  @ ccn     : chr "123456"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence: chr "3456"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "3456"
#>  .. @ range : chr "3400-3499"
#>  .. @ abbr  : chr "RHC"
#>  .. @ desc  : chr "Rural Health Clinic (Provider-based)"
#>  @ ext     : chr NA
```
