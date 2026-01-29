# Unit Parents

Convert various codes to their associated names.

## Usage

``` r
parent(x, ...)
```

## Arguments

- x:

  character vector of codes to look up.

- ...:

  additional arguments (not used).

## Value

S7 object of class `Medicare`.

## Examples

``` r
parent("21AE26")
#> ✖ 21AE26 (a <medicaid> object) has no <parent> unit.
parent("21SE26")
#> <ccn::Medicare>
#>  @ ccn      : chr "213326"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "3300-3399"
#>  .. @ abbr  : chr "CH"
#>  .. @ desc  : chr "Children's Hospital"
#>  .. @ eipps : logi TRUE
#>  @ extension: chr NA
parent("21SB26")
#> <ccn::Medicare>
#>  @ ccn      : chr "212126"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "2000-2299"
#>  .. @ abbr  : chr "LTCH"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  .. @ eipps : logi TRUE
#>  @ extension: chr NA
parent("21SD26")
#> <ccn::Medicare>
#>  @ ccn      : chr "213026"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "3025-3099"
#>  .. @ abbr  : chr "IRF"
#>  .. @ desc  : chr "Rehabilitation Hospital"
#>  .. @ eipps : logi TRUE
#>  @ extension: chr NA
```
