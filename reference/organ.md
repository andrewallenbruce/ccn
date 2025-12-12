# Organ Procurement Organizations (OPO)

Organ Procurement Organizations (OPO) based on their codes.

## Usage

``` r
organ(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Organ`.

## Examples

``` r
organ("05P001")
#> <ccn::Organ>
#>  @ ccn     : chr "05P001"
#>  @ state   : <ccn::State>
#>  .. @ abbr: chr "CA"
#>  .. @ name: chr "California"
#>  @ sequence: chr "001"
#>  @ range   : chr "001-099"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "P"
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"
```
