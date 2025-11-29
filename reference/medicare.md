# Medicare Providers

Convert various codes to their associated names.

## Usage

``` r
medicare_range(x)

medicare_range_abbr(x)

medicare_range_desc(x)

medicare_sequence(x)

new_medicare(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
new_medicare("670055")
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
