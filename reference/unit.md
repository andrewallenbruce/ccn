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
#>  @ ccn  : chr "210101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: <ccn::RangeMDC>
#>  .. @ number: chr "0101"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ ext  : chr NA
unit("21T101")
#> <ccn::Unit>
#>  @ ccn  : chr "21T101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF"
#>  .. @ desc: chr "Rehabilitation Unit (IPPS-Excluded)"
unit("21S101")
#> <ccn::Unit>
#>  @ ccn  : chr "21S101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PSY"
#>  .. @ desc: chr "Psychiatric Unit (IPPS-Excluded)"
unit("21U101")
#> <ccn::Unit>
#>  @ ccn  : chr "21U101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ code: chr "U"
#>  .. @ abbr: chr "SBA"
#>  .. @ desc: chr "Swing-Bed Approval - Short-Term Hospital"
```
