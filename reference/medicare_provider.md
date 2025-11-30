# Medicare Provider

Convert various codes to their associated names.

## Usage

``` r
medicare_provider(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicare`.

## Examples

``` r
medicare_provider("670055")
#> <ccn::Medicare>
#>  @ ccn      : chr "670055"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "67"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0055"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ extension: NULL
medicare_provider("123456")
#> <ccn::Medicare>
#>  @ ccn      : chr "123456"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "3456"
#>  .. @ range : chr "3400-3499"
#>  .. @ abbr  : chr "RHC-P"
#>  .. @ desc  : chr "Rural Health Clinic (Provider-based)"
#>  @ extension: NULL
```
