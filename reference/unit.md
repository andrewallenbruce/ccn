# Hospital Units

An alpha character in the third position of a CCN identifies either
hospitals with swing-bed approval, rehabilitation units, or psychiatric
units excluded from IPPS payment.

The first 2 digits identify the State in which the provider is located.
The third position (which is alpha) identifies the type of unit or
swing-bed designation.

**The last 3 digits must match the last 3 digits of the parent
provider.**

## Usage

``` r
unit(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Unit>`.

## Examples

``` r
medicare("210101")
#> <ccn::Medicare>
#>  @ ccn      : chr "210101"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
unit("21T101")
#> <ccn::Unit>
#>  @ ccn   : chr "21T101"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "21_101"
unit("21S101")
#> <ccn::Unit>
#>  @ ccn   : chr "21S101"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "21_101"
unit("21U101")
#> <ccn::Unit>
#>  @ ccn   : chr "21U101"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "SBA"
#>  .. @ desc : chr "Swing-Bed Approval - STC"
#>  .. @ eipps: logi FALSE
#>  @ parent: chr "210101"

unit("28Z348")
#> <ccn::Unit>
#>  @ ccn   : chr "28Z348"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "NE"
#>  .. @ name  : chr "Nebraska"
#>  .. @ region: chr "VII"
#>  .. @ office: chr "Kansas City"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "SBA"
#>  .. @ desc : chr "Swing-Bed Approval - CAH"
#>  .. @ eipps: logi FALSE
#>  @ parent: chr "281348"
medicare("281348")
#> <ccn::Medicare>
#>  @ ccn      : chr "281348"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "NE"
#>  .. @ name  : chr "Nebraska"
#>  .. @ region: chr "VII"
#>  .. @ office: chr "Kansas City"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "1300-1399"
#>  .. @ abbr  : chr "CAH"
#>  .. @ desc  : chr "Critical Access Hospital"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
```
