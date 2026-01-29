# Emergency Hospitals

CCNs assigned to Emergency Hospitals (both Federal and non-Federal) that
do not participate in the Medicare program.

## Usage

``` r
emergency(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Emergency>`.

## Details

Emergency hospitals are identified by a 6-position alphanumeric CCN.

Positions one and two identify the state in which the hospital is
located.

Position six, an alpha character, identifies whether the hospital is
Federal (`F`) or non-Federal (`E`).

Positions three, four and five represent a sequence beginning with
`001`. This sequence identifies the order, by state, in which the CCN
was issued.

For example, the CCN of the 34th emergency hospital in Maryland would be
`21034E`. The Regional Office assigns the CCN in strict numerical
sequence without regard to the Federal or non-Federal status.

## Examples

``` r
emergency("21034E")
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
emergency("12345F")
#> <ccn::Emergency>
#>  @ ccn  : chr "12345F"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "San Francisco"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "F"
#>  .. @ desc: chr "Federal"
emergency("11038F") # USAF Hospital (Moody)
#> <ccn::Emergency>
#>  @ ccn  : chr "11038F"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "GA"
#>  .. @ name  : chr "Georgia"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "F"
#>  .. @ desc: chr "Federal"
```
