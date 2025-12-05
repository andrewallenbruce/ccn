# IPPS-Excluded Hospital Units

Convert various codes to their associated names.

## Usage

``` r
unit(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
medicare("210101")
#> <ccn::Medicare>
#>  @ ccn      : chr "210101"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0101"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ extension: NULL
unit("21T101")
#> <ccn::Unit>
#>  @ ccn     : chr "21T101"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
unit("21S101")
#> <ccn::Unit>
#>  @ ccn     : chr "21S101"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PU"
#>  .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
unit("21U101")
#> <ccn::Unit>
#>  @ ccn     : chr "21U101"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "0001-0009"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "U"
#>  .. @ abbr: chr "STH"
#>  .. @ desc: chr "Swing-Bed Approval for Short-Term Hospital"
```
