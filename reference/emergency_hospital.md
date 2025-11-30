# Emergency Hospital CCNs

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

## Usage

``` r
new_emergency(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `EmergencyHospital`.

## Examples

``` r
new_emergency("21034E")
#> <ccn::EmergencyHospital>
#>  @ ccn     : chr "21034E"
#>  @ entity  : chr "Emergency Hospital"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "034"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "E"
#>  .. @ desc: chr "Non-Federal Emergency Hospital"
#>  .. @ abbr: chr "NFEH"
new_emergency("12345F")
#> <ccn::EmergencyHospital>
#>  @ ccn     : chr "12345F"
#>  @ entity  : chr "Emergency Hospital"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "12"
#>  .. @ abbr: chr "HI"
#>  .. @ name: chr "Hawaii"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "345"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "F"
#>  .. @ desc: chr "Federal Emergency Hospital"
#>  .. @ abbr: chr "FEH"
```
