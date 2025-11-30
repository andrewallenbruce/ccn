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
```
