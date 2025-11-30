# Organ Procurement Organizations (OPO)

Functions for identifying and describing Organ Procurement Organizations
(OPO) based on their codes.

## Usage

``` r
new_opo(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
new_opo("05P001")
#> <ccn::OPO>
#>  @ ccn     : chr "05P001"
#>  @ entity  : chr "Medicare Provider"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "05"
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "001"
#>  .. @ range : chr "001-099"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "P"
#>  .. @ desc: chr "Organ Procurement Organization"
#>  .. @ abbr: chr "OPO"
```
