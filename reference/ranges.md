# Lookups for Facility Ranges

Convert various codes to their associated names.

## Usage

``` r
get_care_range(x)

get_care_range_abbr(x)

get_care_range_name(x)

get_caid_range(x)

get_caid_range_abbr(x)

get_caid_range_name(x)

get_opo_range(x)

get_opo_range_abbr(x)

get_opo_range_name(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
get_care_range(c("0055", "5232", "9999")) |>
 print() |>
 get_care_range_abbr() |>
 print() |>
 get_care_range_name()
#> [1] "0001-0879" "5000-6499" "9900-9999"
#> [1] "STH"               "SNF"               "RESERVED (FUTURE)"
#> [1] "Short-Term Hospital (General & Specialty)"
#> [2] "Skilled Nursing Facility"                 
#> [3] "Reserved for Future Use"                  

get_caid_range(c("055", "232", "599")) |>
 print() |>
 get_caid_range_abbr() |>
 print() |>
 get_caid_range_name()
#> [1] "001-099" "200-299" "500-599"
#> [1] "STAC" "CPH"  "LTCH"
#> [1] "Short-Term Acute Care Hospital"  "Children's Psychiatric Hospital"
#> [3] "Long-Term Hospital"             

 get_opo_range(c("001", "012", "099")) |>
 print() |>
 get_opo_range_abbr() |>
 print() |>
 get_opo_range_name()
#> [1] "001-099" "001-099" "001-099"
#> [1] "OPO" "OPO" "OPO"
#> [1] "Organ Procurement Organization" "Organ Procurement Organization"
#> [3] "Organ Procurement Organization"
```
