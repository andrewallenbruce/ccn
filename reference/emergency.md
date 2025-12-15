# Emergency Hospitals

S7 class for CCNs assigned to Emergency Hospitals (both Federal and
non-Federal) that do not participate in the Medicare program.

## Usage

``` r
emergency(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Emergency`.

## Further Information

The CCN for emergency hospitals is a 6-position alphanumeric code. The
first 2 digits are the State code. The third, fourth, and fifth digits
represent a sequence number. The first emergency number in a State would
contain the sequence number `001`. In the sixth position use the letter
`E` for non-Federal emergency hospitals, or `F` for Federal emergency
hospitals.

For example, the 34th emergency hospital issued a CCN in Maryland would
have the number `21-034E`. The RO assigns the CCN in strict numerical
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
#>  .. @ abbr: chr "NFEH"
#>  .. @ desc: chr "Emergency Hospital (Non-Federal)"
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
#>  .. @ abbr: chr "FEH"
#>  .. @ desc: chr "Emergency Hospital (Federal)"
```
