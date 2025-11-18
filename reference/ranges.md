# Lookups for Facility Ranges

Convert various codes to their associated names.

## Usage

``` r
get_opo_abbr(x)

get_opo_name(x)

get_care_range(x)

get_care_range_abbr(x)

get_care_range_name(x)

get_caid_range(x)

get_caid_range_abbr(x)

get_caid_range_name(x)

get_opo_range(x)

get_supplier_range(x)
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
#> [1] "ACUTE"         "SNF"           "OPIOID (FREE)"
#> [1] "Short-Term Hospital (General & Specialty)"
#> [2] "Skilled Nursing Facility"                 
#> [3] "Freestanding Opioid Treatment Program"    

get_caid_range(c("055", "232", "599")) |>
 print() |>
 get_caid_range_abbr() |>
 print() |>
 get_caid_range_name()
#> [1] "001-099" "200-299" "500-599"
#> [1] "ACUTE" "CPH"   "LTCH" 
#> [1] "Medicaid-Only Short-Term Acute Care Hospital" 
#> [2] "Medicaid-Only Children's Psychiatric Hospital"
#> [3] "Medicaid-Only Long-Term Hospital"             
```
