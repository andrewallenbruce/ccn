# Organ Procurement Organizations

Organ procurement organizations (OPOs) are assigned a 6-digit
alphanumeric CCN. The first 2 digits identify the State code. The third
digit is the alpha character `P`. The remaining 3 digits are the unique
facility identifier.

## Usage

``` r
organ(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Organ>`.

## Examples

``` r
organ("05P001")
#> <ccn::Organ>
#>  @ ccn  : chr "05P001"
#>  @ state: <ccn::State>
#>  .. @ abbr  : chr "CA"
#>  .. @ name  : chr "California"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "SF"
#>  @ range: chr "001-099"
#>  @ type : <ccn::Type>
#>  .. @ abbr: chr "OPO"
#>  .. @ desc: chr "Organ Procurement Organization"
```
