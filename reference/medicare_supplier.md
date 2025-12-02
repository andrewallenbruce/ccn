# Medicare Supplier

Convert various codes to their associated names.

## Usage

``` r
medicare_supplier(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Supplier`.

## Examples

``` r
medicare_supplier("10C0001062")
#> <ccn::Supplier>
#>  @ ccn      : chr "10C0001062"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "10"
#>  .. @ abbr: chr "FL"
#>  .. @ name: chr "Florida"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0001062"
#>  .. @ range : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "C"
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: NULL
medicare_supplier("45D0634589")
#> <ccn::Supplier>
#>  @ ccn      : chr "45D0634589"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "45"
#>  .. @ abbr: chr "TX"
#>  .. @ name: chr "Texas"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0634589"
#>  .. @ range : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "D"
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  @ extension: NULL
medicare_supplier("21X0009807")
#> <ccn::Supplier>
#>  @ ccn      : chr "21X0009807"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0009807"
#>  .. @ range : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "X"
#>  .. @ abbr: chr "PXRF"
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  @ extension: NULL
medicare_supplier("12C0001062")
#> <ccn::Supplier>
#>  @ ccn      : chr "12C0001062"
#>  @ entity   : chr "Medicare Supplier"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence : <ccn::Sequence>
#>  .. @ number: chr "0001062"
#>  .. @ range : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ code: chr "C"
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: NULL
```
