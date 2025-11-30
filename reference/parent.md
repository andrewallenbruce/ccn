# IPPS Excluded Unit Codes

Convert various codes to their associated names.

## Usage

``` r
ipps_excluded_unit_abbr(x)

ipps_excluded_unit_prefix(x)

get_unit_sequence(x)

get_parent_ccn(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
x <- c("02TA01", "04SD38", "52TA05")
get_unit_sequence(x)
#> [1] "2001" "3038" "2005"
get_parent_ccn(x)
#> [1] "022001" "043038" "522005"
```
