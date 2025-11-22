# Facility Ranges

Convert various codes to their associated names.

## Usage

``` r
range_opo(x)

range_emergency(x)

range_supplier(x)

range_medicaid_only_abbr(x)

range_medicaid_only_desc(x)

range_medicaid_only(x)

range_medicare_abbr(x)

range_medicare_desc(x)

range_medicare(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
range_medicare(c("0055", "5232", "9999")) |>
 print() |>
 range_medicare_abbr() |>
 print() |>
 range_medicare_desc()
#> [1] "0001-0879" "5000-6499" "9900-9999"
#> [1] "ACUTE"         "SNF"           "OPIOID (FREE)"
#> [1] "Short-Term Hospital (General & Specialty)"
#> [2] "Skilled Nursing Facility"                 
#> [3] "Freestanding Opioid Treatment Program"    

range_medicaid_only(c("055", "232", "599")) |>
 print() |>
 range_medicaid_only_abbr() |>
 print() |>
 range_medicaid_only_desc()
#> [1] "001-099" "200-299" "500-599"
#> [1] "ACUTE" "CPH"   "LTCH" 
#> [1] "Medicaid-Only Short-Term Acute Care Hospital" 
#> [2] "Medicaid-Only Children's Psychiatric Hospital"
#> [3] "Medicaid-Only Long-Term Hospital"             

range_supplier("9999999")
#> [1] "0000001-9999999"
range_emergency("50")
#> [1] "001-999"
range_opo("50")
#> [1] "001-099"
```
