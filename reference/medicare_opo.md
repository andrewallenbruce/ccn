# Organ Procurement Organizations (OPO)

Organ Procurement Organizations (OPO) based on their codes.

## Usage

``` r
medicare_opo(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `MedicareOPO`.

## Examples

``` r
medicare_opo("05P001")
#> <ccn::MedicareOPO>
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
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"
```
