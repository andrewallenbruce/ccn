# IPPS-Excluded Hospital Sub-Units

Convert various codes to their associated names.

## Usage

``` r
subunit(x)

parent(x)
```

## Arguments

- x:

  scalar.

## Value

character vector of names associated with codes.

## Examples

``` r
subunit("21SA26")
#> <ccn::EippsSubunit>
#>  @ ccn   : chr "21SA26"
#>  @ state : <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range : chr(0) 
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: <ccn::SubunitParent>
#>  .. @ code : chr "A"
#>  .. @ ccn  : chr "212026"
#>  .. @ range: <ccn::RangeMCR>
#>  .. .. @ series: chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital"
#>  .. .. @ eipps : logi TRUE
parent("21SA26")
#> <ccn::Parent>
#>  @ ccn    : chr "212026"
#>  @ state  : <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range  : <ccn::RangeMCR>
#>  .. @ series: chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  .. @ eipps : logi TRUE
#>  @ ext    : chr NA
#>  @ subunit: <ccn::Subunit>
#>  .. @ ccn : chr "21SA26"
#>  .. @ type: <ccn::TypeUnit>
#>  .. .. @ abbr : chr "PSY"
#>  .. .. @ desc : chr "Psychiatric Unit"
#>  .. .. @ eipps: logi TRUE
subunit("21TA26")
#> <ccn::EippsSubunit>
#>  @ ccn   : chr "21TA26"
#>  @ state : <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range : chr(0) 
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: <ccn::SubunitParent>
#>  .. @ code : chr "A"
#>  .. @ ccn  : chr "212026"
#>  .. @ range: <ccn::RangeMCR>
#>  .. .. @ series: chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital"
#>  .. .. @ eipps : logi TRUE
parent("21TA26")
#> <ccn::Parent>
#>  @ ccn    : chr "212026"
#>  @ state  : <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range  : <ccn::RangeMCR>
#>  .. @ series: chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  .. @ eipps : logi TRUE
#>  @ ext    : chr NA
#>  @ subunit: <ccn::Subunit>
#>  .. @ ccn : chr "21TA26"
#>  .. @ type: <ccn::TypeUnit>
#>  .. .. @ abbr : chr "IRF"
#>  .. .. @ desc : chr "Rehabilitation Unit"
#>  .. .. @ eipps: logi TRUE

subunit("02TA01")
#> <ccn::EippsSubunit>
#>  @ ccn   : chr "02TA01"
#>  @ state : <ccn::State>
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ range : chr(0) 
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: <ccn::SubunitParent>
#>  .. @ code : chr "A"
#>  .. @ ccn  : chr "022001"
#>  .. @ range: <ccn::RangeMCR>
#>  .. .. @ series: chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital"
#>  .. .. @ eipps : logi TRUE
parent("02TA01")
#> <ccn::Parent>
#>  @ ccn    : chr "022001"
#>  @ state  : <ccn::State>
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ range  : <ccn::RangeMCR>
#>  .. @ series: chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  .. @ eipps : logi TRUE
#>  @ ext    : chr NA
#>  @ subunit: <ccn::Subunit>
#>  .. @ ccn : chr "02TA01"
#>  .. @ type: <ccn::TypeUnit>
#>  .. .. @ abbr : chr "IRF"
#>  .. .. @ desc : chr "Rehabilitation Unit"
#>  .. .. @ eipps: logi TRUE

subunit("04SD38")
#> <ccn::EippsSubunit>
#>  @ ccn   : chr "04SD38"
#>  @ state : <ccn::State>
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ range : chr(0) 
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: <ccn::SubunitParent>
#>  .. @ code : chr "D"
#>  .. @ ccn  : chr "043038"
#>  .. @ range: <ccn::RangeMCR>
#>  .. .. @ series: chr "3025-3099"
#>  .. .. @ abbr  : chr "IRF"
#>  .. .. @ desc  : chr "Rehabilitation Hospital"
#>  .. .. @ eipps : logi TRUE
parent("04SD38")
#> <ccn::Parent>
#>  @ ccn    : chr "043038"
#>  @ state  : <ccn::State>
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ range  : <ccn::RangeMCR>
#>  .. @ series: chr "3025-3099"
#>  .. @ abbr  : chr "IRF"
#>  .. @ desc  : chr "Rehabilitation Hospital"
#>  .. @ eipps : logi TRUE
#>  @ ext    : chr NA
#>  @ subunit: <ccn::Subunit>
#>  .. @ ccn : chr "04SD38"
#>  .. @ type: <ccn::TypeUnit>
#>  .. .. @ abbr : chr "PSY"
#>  .. .. @ desc : chr "Psychiatric Unit"
#>  .. .. @ eipps: logi TRUE

subunit("52TA05")
#> <ccn::EippsSubunit>
#>  @ ccn   : chr "52TA05"
#>  @ state : <ccn::State>
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ range : chr(0) 
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: <ccn::SubunitParent>
#>  .. @ code : chr "A"
#>  .. @ ccn  : chr "522005"
#>  .. @ range: <ccn::RangeMCR>
#>  .. .. @ series: chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital"
#>  .. .. @ eipps : logi TRUE
parent("52TA05")
#> <ccn::Parent>
#>  @ ccn    : chr "522005"
#>  @ state  : <ccn::State>
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ range  : <ccn::RangeMCR>
#>  .. @ series: chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital"
#>  .. @ eipps : logi TRUE
#>  @ ext    : chr NA
#>  @ subunit: <ccn::Subunit>
#>  .. @ ccn : chr "52TA05"
#>  .. @ type: <ccn::TypeUnit>
#>  .. .. @ abbr : chr "IRF"
#>  .. .. @ desc : chr "Rehabilitation Unit"
#>  .. .. @ eipps: logi TRUE
```
