# Organ Procurement Organizations (OPO)

Functions for identifying and describing Organ Procurement Organizations
(OPO) based on their codes.

## Usage

``` r
is_type_opo(x)

opo_abbr(x)

opo_desc(x)

opo_sequence(x)

opo_type(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
is_type_opo("P")
#> [1] TRUE
opo_abbr(c("P", "X"))
#> [1] "OPO" NA   
opo_desc("P")
#> [1] "Organ Procurement Organization"
opo_sequence("001")
#> <ccn::Sequence>
#>  @ number: chr "001"
#>  @ range : chr "001-099"
opo_type("P")
#> <ccn::Type>
#>  @ code: chr "P"
#>  @ desc: chr "Organ Procurement Organization"
#>  @ abbr: chr "OPO"
```
