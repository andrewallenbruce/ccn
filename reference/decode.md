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
x = list("670055", "21034E", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589")
purrr::map(x, decode)
#> [[1]]
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
#> 
#> [[2]]
#> <ccn::Emergency>
#>  @ ccn  : chr "21034E"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "NF"
#>  .. @ desc: chr "Non-Federal"
#> 
#> [[3]]
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
#> 
#> [[4]]
#> <ccn::Medicaid>
#>  @ ccn  : chr "01J008"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "AL"
#>  .. @ name  : chr "Alabama"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range: <ccn::RangeMOH>
#>  .. @ series: chr "001-099"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Acute Care Hospital"
#>  @ type : <ccn::TypeMOF>
#>  .. @ abbr: chr "MOH"
#>  .. @ desc: chr "Medicaid-Only Hospital"
#> 
#> [[5]]
#> <ccn::Organ>
#>  @ ccn  : chr "05P001"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "CA"
#>  .. @ name  : chr "California"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "San Francisco"
#>  @ range: chr "001-099"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"
#> 
#> [[6]]
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
#>  .. @ desc : chr "Swing-Bed Approval [STC]"
#>  .. @ eipps: logi FALSE
#>  @ parent: chr "210101"
#> 
#> [[7]]
#> <ccn::Subunit>
#>  @ ccn   : chr "21TA26"
#>  @ state : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ type  : <ccn::TypeUnit>
#>  .. @ abbr : chr "IRFu"
#>  .. @ desc : chr "Rehabilitation Unit"
#>  .. @ eipps: logi TRUE
#>  @ parent: chr "212026"
#> 
#> [[8]]
#> <ccn::Supplier>
#>  @ ccn      : chr "45D0634589"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "TX"
#>  .. @ name  : chr "Texas"
#>  .. @ region: chr "VI"
#>  .. @ office: chr "Dallas"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  @ extension: chr NA
#> 
```
