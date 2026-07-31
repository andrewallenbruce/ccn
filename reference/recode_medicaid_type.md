# Recode Medicaid Facility Types

Recode Medicaid Facility Types

## Usage

``` r
recode_medicaid_type(x, as = c("abbr", "full"))
```

## Arguments

- x:

  `<chr>` vector of CCN Medicaid facility type characters.

- as:

  `<chr>` format to return; one of:

  - `"abbr"`: facility type abbreviation (default)

  - `"full"`: facility type name

## Value

`<chr>` vector of Medicaid facility type names/abbreviations

## Examples

``` r
tibble::tibble(
  x = ccn::medicaid_types[["code"]],
  abbr = recode_medicaid_type(x, "abbr"),
  full = recode_medicaid_type(x, "full")
)
#> # A tibble: 10 × 3
#>    x     abbr  full                                      
#>    <chr> <chr> <chr>                                     
#>  1 A     SNF   Skilled Nursing Facility                  
#>  2 B     SNF   Skilled Nursing Facility                  
#>  3 E     SNF   Skilled Nursing Facility                  
#>  4 F     SNF   Skilled Nursing Facility                  
#>  5 G     ICF   Intermediate Care Facility                
#>  6 H     ICF   Intermediate Care Facility                
#>  7 J     MOH   Medicaid-Only Hospital                    
#>  8 K     HHA   Home Health Agency                        
#>  9 L     PRTF  Psychiatric Residential Treatment Facility
#> 10 NA    NA    NA                                        
```
