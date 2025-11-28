# Medicare Supplier

Convert various codes to their associated names.

## Usage

``` r
is_supplier(x)

is_supplier_type(x)

supplier_range(x)

supplier_sequence(x)

supplier_abbr(x)

supplier_desc(x)

supplier_type(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
is_supplier("10C0001062")
#> [1] TRUE
is_supplier_type(c("C", "D", "X"))
#> [1] TRUE TRUE TRUE
supplier_range("9000000")
#> [1] "0000001-9999999"
supplier_sequence("10C0001062")
#> <ccn::Sequence>
#>  @ number: chr "0001062"
#>  @ range : chr "0000001-9999999"
supplier_abbr(c("C", "D", "X"))
#> [1] "ASC"  "CLIA" "XRAY"
supplier_desc(c("C", "D", "X"))
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             
```
