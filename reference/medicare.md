# Medicare Providers

Convert various codes to their associated names.

## Usage

``` r
medicare(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicare`.

## Examples

``` r
medicare("670055")
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
medicare("123456")
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
medicare("119802")
#> <ccn::Medicare>
#>  @ ccn      : chr "119802"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "GA"
#>  .. @ name  : chr "Georgia"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "9800-9899"
#>  .. @ abbr  : chr "TXC"
#>  .. @ desc  : chr "Transplant Center"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
medicare("114036") # Greenleaf
#> <ccn::Medicare>
#>  @ ccn      : chr "114036"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "GA"
#>  .. @ name  : chr "Georgia"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "4000-4499"
#>  .. @ abbr  : chr "PH"
#>  .. @ desc  : chr "Psychiatric Hospital"
#>  .. @ eipps : logi TRUE
#>  @ extension: chr NA
medicare("110122") # SGMC
#> <ccn::Medicare>
#>  @ ccn      : chr "110122"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "GA"
#>  .. @ name  : chr "Georgia"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range    : <ccn::RangeMCR>
#>  .. @ series: chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  .. @ eipps : logi FALSE
#>  @ extension: chr NA
```
