# Supplier Code Lookup Convert supplier codes to standard supplier names.

Supplier Code Lookup Convert supplier codes to standard supplier names.

## Usage

``` r
supplier_code(x)
```

## Arguments

- x:

  character vector of supplier codes.

## Value

character vector of supplier names.

## Examples

``` r
supplier_code(c("C", "D", "X"))
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             
```
