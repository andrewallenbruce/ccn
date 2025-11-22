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
#>  [1] "LTCH"  "LTCH"  "LTCH"  "REHAB" "CHILD" "PSYCH" "PSYCH" "PSYCH" "PSYCH"
#> [10] "PSYCH"
ipps_excluded_unit_prefix(x[is_type_ipps_excluded_unit(x)])
#>  [1] "20" "21" "22" "30" "33" "40" "41" "42" "43" "44"

x <- c("02TA01", "04SD38", "52TA05")
get_unit_sequence(x)
#> [1] "203020013805"
get_parent_ccn(x)
#> [1] "020452203020013805"
```
