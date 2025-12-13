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
#>  @ ccn  : chr "670055"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ range: <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ ext  : chr NA
medicare("123456")
#> <ccn::Medicare>
#>  @ ccn  : chr "123456"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ range: <ccn::RangeMCR>
#>  .. @ series: chr "3400-3499"
#>  .. @ abbr  : chr "RHC"
#>  .. @ desc  : chr "Rural Health Clinic (Provider-based)"
#>  @ ext  : chr NA
```
