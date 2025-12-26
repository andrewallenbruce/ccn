# Decode CMS Certification Numbers

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
#>  .. @ office: chr "DAL"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
decode("05P001")
#> <ccn::Organ>
#>  @ ccn  : chr "05P001"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "CA"
#>  .. @ name  : chr "California"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "SF"
#>  @ range: chr "001-099"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"
decode("123456")
#> <ccn::Medicare>
#>  @ ccn      : chr "123456"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "SF"
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
#>  .. @ office: chr "PHL"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Non-Federal"
decode("12345F")
#> <ccn::Emergency>
#>  @ ccn  : chr "12345F"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "SF"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "F"
#>  .. @ desc: chr "Federal"
decode("210101")
#> <ccn::Medicare>
#>  @ ccn      : chr "210101"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "PHL"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
decode("21T101")
#> <ccn::Unit>
#>  @ ccn   : chr "21T101"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "PHL"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRFu"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "21_101"
decode("21S101")
#> <ccn::Unit>
#>  @ ccn   : chr "21S101"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "PHL"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "Pu"
#>  .. @ desc : chr "Psychiatric Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "21_101"
decode("21U101")
#> <ccn::Unit>
#>  @ ccn   : chr "21U101"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "PHL"
#>  @ range : chr "001-999"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "SBA"
#>  .. @ desc : chr "Swing-Bed Approval [STC]"
#>  .. @ eipps: logi FALSE
#>  @ parent: chr "210101"
decode("01L008")
#> <ccn::Medicaid>
#>  @ ccn  : chr "01L008"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "AL"
#>  .. @ name  : chr "Alabama"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "ATL"
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
#>  .. @ office: chr "BOS"
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
#>  .. @ office: chr "CHI"
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
#>  .. @ office: chr "ATL"
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
#>  .. @ office: chr "ATL"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "001-099"
#>  .. @ abbr  : chr "STC"
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
#>  .. @ office: chr "ATL"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "500-599"
#>  .. @ abbr  : chr "LTCH"
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
#>  .. @ office: chr "PHL"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "Pu"
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
#>  .. @ office: chr "PHL"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRFu"
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
#>  .. @ office: chr "SEA"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRFu"
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
#>  .. @ office: chr "DAL"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "Pu"
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
#>  .. @ office: chr "CHI"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRFu"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "522005"
decode("10C0001062")
#> <ccn::Supplier>
#>  @ ccn      : chr "10C0001062"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "FL"
#>  .. @ name  : chr "Florida"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "ATL"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: chr NA
decode("45D0634589")
#> <ccn::Supplier>
#>  @ ccn      : chr "45D0634589"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "TX"
#>  .. @ name  : chr "Texas"
#>  .. @ region: chr "VI"
#>  .. @ office: chr "DAL"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  @ extension: chr NA
decode("21X0009807")
#> <ccn::Supplier>
#>  @ ccn      : chr "21X0009807"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "PHL"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "PXRF"
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  @ extension: chr NA
decode("12C0001062")
#> <ccn::Supplier>
#>  @ ccn      : chr "12C0001062"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "SF"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: chr NA
decode("240019A")
#> <ccn::Medicare>
#>  @ ccn      : chr "240019"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MN"
#>  .. @ name  : chr "Minnesota"
#>  .. @ region: chr "V"
#>  .. @ office: chr "CHI"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr "A"
decode("330125001")
#> <ccn::Medicare>
#>  @ ccn      : chr "330125"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "NY"
#>  .. @ name  : chr "New York"
#>  .. @ region: chr "II"
#>  .. @ office: chr "NYC"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr "001"
decode("000000000000")
#> <ccn::Supplier>
#>  @ ccn      : chr "0000000000"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "AZ"
#>  .. @ name  : chr "Arizona"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "SF"
#>  @ range    : chr NA
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr NA
#>  .. @ desc: chr NA
#>  @ extension: chr "00"
```
