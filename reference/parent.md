# IPPS Excluded Unit Codes

Convert various codes to their associated names.

## Usage

``` r
is_type_ipps_excluded_unit(x)

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
x <- LETTERS
x[is_type_ipps_excluded_unit(x)]
#>  [1] "A" "B" "C" "D" "E" "F" "G" "H" "J" "K"
ipps_excluded_unit_abbr(x[is_type_ipps_excluded_unit(x)])
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'
ipps_excluded_unit_prefix(x[is_type_ipps_excluded_unit(x)])
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'

x <- c("02TA01", "04SD38", "52TA05")
get_unit_sequence(x)
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'
get_parent_ccn(x)
#> Error: 'vec_recode_values' is not an exported object from 'namespace:vctrs'
```
