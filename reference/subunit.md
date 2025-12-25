# IPPS-Excluded Hospital Subunits

Convert various codes to their associated names.

## Usage

``` r
subunit(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Subunit>`.

## Examples

``` r
subunit("21SA26")
#> <ccn::Subunit>
#>  @ ccn   : chr "21SA26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PU"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "212026"
subunit("21TA26")
#> <ccn::Subunit>
#>  @ ccn   : chr "21TA26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "212026"
subunit("02TA01")
#> <ccn::Subunit>
#>  @ ccn   : chr "02TA01"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "AK"
#>  .. @ name  : chr "Alaska"
#>  .. @ region: chr "X"
#>  .. @ office: chr "Seattle"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "022001"
subunit("04SD38")
#> <ccn::Subunit>
#>  @ ccn   : chr "04SD38"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "AR"
#>  .. @ name  : chr "Arkansas"
#>  .. @ region: chr "VI"
#>  .. @ office: chr "Dallas"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PU"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "043038"
subunit("52TA05")
#> <ccn::Subunit>
#>  @ ccn   : chr "52TA05"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "WI"
#>  .. @ name  : chr "Wisconsin"
#>  .. @ region: chr "V"
#>  .. @ office: chr "Chicago"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "522005"
```
