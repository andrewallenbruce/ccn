# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
emergency_hospital_name(x)

supplier_name(x)

state_name(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
emergency_hospital_name(LETTERS)
#>  [1] NA                               NA                              
#>  [3] NA                               NA                              
#>  [5] "Non-Federal Emergency Hospital" "Federal Emergency Hospital"    
#>  [7] NA                               NA                              
#>  [9] NA                               NA                              
#> [11] NA                               NA                              
#> [13] NA                               NA                              
#> [15] NA                               NA                              
#> [17] NA                               NA                              
#> [19] NA                               NA                              
#> [21] NA                               NA                              
#> [23] NA                               NA                              
#> [25] NA                               NA                              
supplier_name(LETTERS)
#>  [1] NA                                                                    
#>  [2] NA                                                                    
#>  [3] "Ambulatory Surgical Center"                                          
#>  [4] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  [5] NA                                                                    
#>  [6] NA                                                                    
#>  [7] NA                                                                    
#>  [8] NA                                                                    
#>  [9] NA                                                                    
#> [10] NA                                                                    
#> [11] NA                                                                    
#> [12] NA                                                                    
#> [13] NA                                                                    
#> [14] NA                                                                    
#> [15] NA                                                                    
#> [16] NA                                                                    
#> [17] NA                                                                    
#> [18] NA                                                                    
#> [19] NA                                                                    
#> [20] NA                                                                    
#> [21] NA                                                                    
#> [22] NA                                                                    
#> [23] NA                                                                    
#> [24] "Portable X-Ray Facility"                                             
#> [25] NA                                                                    
#> [26] NA                                                                    
state_name(c("00", "01", "83", "A0"))
#> [1] "Arizona"    "Alabama"    "New Jersey" "California"
```
