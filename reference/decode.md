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
#> ────<ccn::Medicare>
#> ◉ CCN: <670055>
#> ◉ State: TX - Texas
#> ◉ Facility Type: STC - Short-Term Hospital (General & Specialty)
#> ◉ IPPS-Excluded: ✖
decode("123456")
#> ────<ccn::Medicare>
#> ◉ CCN: <123456>
#> ◉ State: HI - Hawaii
#> ◉ Facility Type: RHC - Rural Health Clinic (Provider-based)
#> ◉ IPPS-Excluded: ✖
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
#> ────<ccn::Medicare>
#> ◉ CCN: <210101>
#> ◉ State: MD - Maryland
#> ◉ Facility Type: STC - Short-Term Hospital (General & Specialty)
#> ◉ IPPS-Excluded: ✖
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
```
