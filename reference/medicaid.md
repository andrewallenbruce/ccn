# Medicaid-Only Providers

CCNs assigned to Medicaid-only hospitals and facilities.

## Usage

``` r
medicaid(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Medicaid>`.

## Details

Title XIX-only providers are identified by a 6-position alphanumeric
CCN.

Positions one and two identify the state in which the provider is
located.

Position three, an alpha character, identifies the type of facility, by
either level or type of care being provided.

Positions four, five and six represent a sequence beginning with `001`.

## Examples

``` r
medicaid("01L008")
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
medicaid("22B201")
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
medicaid("23E301")
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
medicaid("34F401")
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
medicaid("01J008")
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
medicaid("A5J508")
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
```
