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
#> ────<ccn::Medicare>
#> ◉ CCN: <210101>
#> ◉ State: MD - Maryland
#> ◉ Facility Type: STC - Short-Term Hospital (General & Specialty)
#> ◉ IPPS-Excluded: ✖
unit("21T101")
#> <ccn::Unit>
#>  @ ccn  : chr "21T101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
unit("21S101")
#> <ccn::Unit>
#>  @ ccn  : chr "21S101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
unit("21U101")
#> <ccn::Unit>
#>  @ ccn  : chr "21U101"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeUnit>
#>  .. @ abbr : chr "SBA"
#>  .. @ desc : chr "Swing-Bed Approval - STC"
#>  .. @ eipps: logi FALSE
```
