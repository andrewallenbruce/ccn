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
subunit("21SE26")
#> <ccn::Subunit>
#>  @ ccn   : chr "21SE26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "213326"
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
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  .. @ eipps : logi TRUE
#>  @ extension: chr NA
subunit("21SB26")
#> <ccn::Subunit>
#>  @ ccn   : chr "21SB26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "212126"
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
subunit("21SD26")
#> <ccn::Subunit>
#>  @ ccn   : chr "21SD26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "213026"
```
