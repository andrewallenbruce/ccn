# Facility Ranges

Convert various codes to their associated names.

## Usage

``` r
range_opo(x)

sequence_opo(x)

range_emergency(x)

sequence_emergency(x)

range_supplier(x)

sequence_supplier(x)

range_medicaid_only(x)

range_medicaid_abbr(x)

range_medicaid_desc(x)

range_medicare(x)

range_medicare_abbr(x)

range_medicare_desc(x)

sequence_medicare(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
range_medicare(c("0055", "5232", "9999"))
#> [1] "0001-0879" "5000-6499" "9900-9999"
range_medicare_abbr("3500-3699")
#> [1] "RDF-H (SAT)"
range_medicare_desc("3500-3699")
#> [1] "Hospital-based Satellite Renal Dialysis Facility"

range_medicaid_only(c("055", "232", "599"))
#> [1] "001-099" "200-299" "500-599"
# range_medicaid_abbr("100-199")
# range_medicaid_desc("100-199")

range_supplier(9000000L)
#> [1] "0000001-9999999"
range_emergency(500L)
#> [1] "001-999"
range_opo(50L)
#> [1] "001-099"
```
