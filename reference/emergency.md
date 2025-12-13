# Emergency Hospital CCNs

This S7 class represents CMS Certification Numbers (CCNs) assigned to
emergency hospitals (both Federal and non-Federal) that do not
participate in the Medicare program.

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

Emergency Hospital CMS Certification Numbers (Non-Participating
Hospitals) Rev. 29, Pg. 411, Iss. 04-20-07, Eff./Imp. 10-01-2007

The CCN for emergency hospitals is a 6-position alphanumeric code. The
first 2 digits are the State code. The third, fourth, and fifth digits
represent a sequence number. The first emergency number in a State would
contain the sequence number `"001"`. In the sixth position use the
letter `"E"` for non-Federal emergency hospitals, or `"F"` for Federal
emergency hospitals.

For example, the 34th emergency hospital issued a CCN in Maryland would
have the number `"21-034E"`. The RO assigns the CCN in strict numerical
sequence without regard to the Federal or non-Federal status. If a
terminated facility again qualifies as an emergency hospital, the RO
issues a new CCN. For a non-participating hospital that is now fully
participating, see subsection I.

## Examples

``` r
emergency("21034E")
#> <ccn::Emergency>
#>  @ ccn  : chr "21034E"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "NFEH"
#>  .. @ desc: chr "Emergency Hospital (Non-Federal)"
emergency("12345F")
#> <ccn::Emergency>
#>  @ ccn  : chr "12345F"
#>  @ state: <ccn::State>
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ range: chr "001-999"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "FEH"
#>  .. @ desc: chr "Emergency Hospital (Federal)"
```
