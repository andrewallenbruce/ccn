# Medicare Supplier

Convert various codes to their associated names.

## Usage

``` r
is_supplier_type(x)

is_supplier(x)

supplier_sequence(x)

supplier_type_abbr(x)

supplier_type_desc(x)

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
supplier_sequence("10C0001062")
#> Warning: NAs introduced by coercion
#> Warning: NAs introduced by coercion
#> <ccn::Sequence>
#>  @ number: chr "10C0001062"
#>  @ range : chr NA
is_supplier_type(c("C", "D", "X"))
#> [1] TRUE TRUE TRUE
supplier_type_abbr(c("C", "D", "X"))
#> [1] "ASC"  "CLIA" "XRAY"
supplier_type_desc(c("C", "D", "X"))
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             
```
