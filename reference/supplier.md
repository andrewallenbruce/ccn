# Medicare Supplier

Convert various codes to their associated names.

## Usage

``` r
supplier_sequence(x)

supplier_type_abbr(x)

supplier_type_desc(x)

supplier_type(x)

new_supplier(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
new_supplier("10C0001062")
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
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  .. @ abbr: chr "ASC"
#>  @ extension: NULL
new_supplier("45D0634589")
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
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  .. @ abbr: chr "CLIA"
#>  @ extension: NULL
new_supplier("21X0009807")
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
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  .. @ abbr: chr "PXRF"
#>  @ extension: NULL
new_supplier("12C0001062")
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
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  .. @ abbr: chr "ASC"
#>  @ extension: NULL
```
