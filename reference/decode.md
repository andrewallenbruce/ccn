# Decode CCNs

Convert various codes to their associated names.

## Usage

``` r
decode(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicare`.

## Examples

``` r
decode("670055")
#> <ccn::Medicare>
#>  @ ccn      : chr "670055"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "TX"
#>  .. @ name  : chr "Texas"
#>  .. @ region: chr "VI"
#>  .. @ office: chr "Dallas"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
decode("123456")
#> <ccn::Medicare>
#>  @ ccn      : chr "123456"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "San Francisco"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "3400-3499"
#>  .. @ abbr  : chr "RHC"
#>  .. @ desc  : chr "Rural Health Clinic (Provider-based)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
decode("21034E")
#> <ccn::Emergency>
#>  @ ccn  : chr "21034E"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "NFEH"
#>  .. @ desc: chr "Emergency Hospital (Non-Federal)"
decode("12345F")
#> <ccn::Emergency>
#>  @ ccn  : chr "12345F"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "San Francisco"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "FEH"
#>  .. @ desc: chr "Emergency Hospital (Federal)"
decode("210101")
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
decode("21T101")
#> <ccn::Unit>
#>  @ ccn  : chr "21T101"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRF"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
decode("21S101")
#> <ccn::Unit>
#>  @ ccn  : chr "21S101"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
decode("21U101")
#> <ccn::Unit>
#>  @ ccn  : chr "21U101"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeUnit>
#>  .. @ abbr : chr "SBA"
#>  .. @ desc : chr "Swing-Bed Approval - STC"
#>  .. @ eipps: logi FALSE
decode("01L008")
#> <ccn::Medicaid>
#>  @ ccn  : chr "01L008"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "AL"
#>  .. @ name  : chr "Alabama"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"
decode("22B201")
#> <ccn::Medicaid>
#>  @ ccn  : chr "22B201"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MA"
#>  .. @ name  : chr "Massachusetts"
#>  .. @ region: chr "I"
#>  .. @ office: chr "Boston"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
decode("23E301")
#> <ccn::Medicaid>
#>  @ ccn  : chr "23E301"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MI"
#>  .. @ name  : chr "Michigan"
#>  .. @ region: chr "V"
#>  .. @ office: chr "Chicago"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
decode("34F401")
#> <ccn::Medicaid>
#>  @ ccn  : chr "34F401"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "NC"
#>  .. @ name  : chr "North Carolina"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range: chr "001-999"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Nursing Facility"
decode("01J008")
#> <ccn::Medicaid>
#>  @ ccn  : chr "01J008"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "AL"
#>  .. @ name  : chr "Alabama"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "001-099"
#>  .. @ abbr  : chr "STAC"
#>  .. @ desc  : chr "Short-Term Acute Care Hospital"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
decode("A5J508")
#> <ccn::Medicaid>
#>  @ ccn  : chr "A5J508"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MS"
#>  .. @ name  : chr "Mississippi"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "500-599"
#>  .. @ abbr  : chr "LTC"
#>  .. @ desc  : chr "Long-Term Hospital"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
decode("21SA26")
#> <ccn::Subunit>
#>  @ ccn   : chr "21SA26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "212026"
decode("21TA26")
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
decode("02TA01")
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
decode("04SD38")
#> <ccn::Subunit>
#>  @ ccn   : chr "04SD38"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "AR"
#>  .. @ name  : chr "Arkansas"
#>  .. @ region: chr "VI"
#>  .. @ office: chr "Dallas"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "PSY"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "043038"
decode("52TA05")
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
