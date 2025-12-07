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
medicare("212026")
#> <ccn::Medicare>
#>  @ ccn     : chr "212026"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: chr "2026"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
subunit("21SA26")
#> <ccn::EippsSubunit>
#>  @ ccn     : chr "21SA26"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: chr(0) 
#>  @ range   : chr(0) 
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PU"
#>  .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::SubunitParent>
#>  .. @ code    : chr "A"
#>  .. @ ccn     : chr "212026"
#>  .. @ sequence: <ccn::RangeMDC>
#>  .. .. @ number: chr "2026"
#>  .. .. @ range : chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
parent("21SA26")
#> <ccn::Parent>
#>  @ ccn     : chr "212026"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: chr "2026"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
#>  @ subunit : <ccn::Subunit>
#>  .. @ ccn : chr "21SA26"
#>  .. @ type: <ccn::Type>
#>  .. .. @ code: chr "S"
#>  .. .. @ abbr: chr "PU"
#>  .. .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
subunit("21TA26")
#> <ccn::EippsSubunit>
#>  @ ccn     : chr "21TA26"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: chr(0) 
#>  @ range   : chr(0) 
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::SubunitParent>
#>  .. @ code    : chr "A"
#>  .. @ ccn     : chr "212026"
#>  .. @ sequence: <ccn::RangeMDC>
#>  .. .. @ number: chr "2026"
#>  .. .. @ range : chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
parent("21TA26")
#> <ccn::Parent>
#>  @ ccn     : chr "212026"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: chr "2026"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
#>  @ subunit : <ccn::Subunit>
#>  .. @ ccn : chr "21TA26"
#>  .. @ type: <ccn::Type>
#>  .. .. @ code: chr "T"
#>  .. .. @ abbr: chr "IRF"
#>  .. .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"

medicare("022001")
#> <ccn::Medicare>
#>  @ ccn     : chr "022001"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ sequence: chr "2001"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2001"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
subunit("02TA01")
#> <ccn::EippsSubunit>
#>  @ ccn     : chr "02TA01"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ sequence: chr(0) 
#>  @ range   : chr(0) 
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::SubunitParent>
#>  .. @ code    : chr "A"
#>  .. @ ccn     : chr "022001"
#>  .. @ sequence: <ccn::RangeMDC>
#>  .. .. @ number: chr "2001"
#>  .. .. @ range : chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
parent("02TA01")
#> <ccn::Parent>
#>  @ ccn     : chr "022001"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ sequence: chr "2001"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2001"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
#>  @ subunit : <ccn::Subunit>
#>  .. @ ccn : chr "02TA01"
#>  .. @ type: <ccn::Type>
#>  .. .. @ code: chr "T"
#>  .. .. @ abbr: chr "IRF"
#>  .. .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"

medicare("043038")
#> <ccn::Medicare>
#>  @ ccn     : chr "043038"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ sequence: chr "3038"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "3038"
#>  .. @ range : chr "3025-3099"
#>  .. @ abbr  : chr "IRF"
#>  .. @ desc  : chr "Rehabilitation Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
subunit("04SD38")
#> <ccn::EippsSubunit>
#>  @ ccn     : chr "04SD38"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ sequence: chr(0) 
#>  @ range   : chr(0) 
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PU"
#>  .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::SubunitParent>
#>  .. @ code    : chr "D"
#>  .. @ ccn     : chr "043038"
#>  .. @ sequence: <ccn::RangeMDC>
#>  .. .. @ number: chr "3038"
#>  .. .. @ range : chr "3025-3099"
#>  .. .. @ abbr  : chr "IRF"
#>  .. .. @ desc  : chr "Rehabilitation Hospital (IPPS-Excluded)"
parent("04SD38")
#> <ccn::Parent>
#>  @ ccn     : chr "043038"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ sequence: chr "3038"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "3038"
#>  .. @ range : chr "3025-3099"
#>  .. @ abbr  : chr "IRF"
#>  .. @ desc  : chr "Rehabilitation Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
#>  @ subunit : <ccn::Subunit>
#>  .. @ ccn : chr "04SD38"
#>  .. @ type: <ccn::Type>
#>  .. .. @ code: chr "S"
#>  .. .. @ abbr: chr "PU"
#>  .. .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"

medicare("522005")
#> <ccn::Medicare>
#>  @ ccn     : chr "522005"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ sequence: chr "2005"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2005"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
subunit("52TA05")
#> <ccn::EippsSubunit>
#>  @ ccn     : chr "52TA05"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ sequence: chr(0) 
#>  @ range   : chr(0) 
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::SubunitParent>
#>  .. @ code    : chr "A"
#>  .. @ ccn     : chr "522005"
#>  .. @ sequence: <ccn::RangeMDC>
#>  .. .. @ number: chr "2005"
#>  .. .. @ range : chr "2000-2299"
#>  .. .. @ abbr  : chr "LTC"
#>  .. .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
parent("52TA05")
#> <ccn::Parent>
#>  @ ccn     : chr "522005"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ sequence: chr "2005"
#>  @ range   : <ccn::RangeMDC>
#>  .. @ number: chr "2005"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Care Hospital (IPPS-Excluded)"
#>  @ ext     : chr NA
#>  @ subunit : <ccn::Subunit>
#>  .. @ ccn : chr "52TA05"
#>  .. @ type: <ccn::Type>
#>  .. .. @ code: chr "T"
#>  .. .. @ abbr: chr "IRF"
#>  .. .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
```
