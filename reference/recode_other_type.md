# Recode Other Facility Types

Recode Other Facility Types

## Usage

``` r
recode_other_type(x, as = c("abbr", "full"))
```

## Arguments

- x:

  `<chr>` vector of CCN Other facility type characters.

- as:

  `<chr>` format to return; one of:

  - `"abbr"`: facility type abbreviation (default)

  - `"full"`: facility type name

## Value

`<chr>` vector of Other facility type names/abbreviations

## Examples

``` r
tibble::tibble(
  x = c("C", "D", "E", "F", "P", "X", NA_character_),
  abbr = recode_other_type(x, "abbr"),
  full = recode_other_type(x, "full")
)
#> # A tibble: 7 × 3
#>   x     abbr  full                            
#>   <chr> <chr> <chr>                           
#> 1 C     ASC   Ambulatory Surgical Center      
#> 2 D     CLIA  Clinical Laboratory             
#> 3 E     ERN   Emergency Hospital (Non-Federal)
#> 4 F     ERF   Emergency Hospital (Federal)    
#> 5 P     OPO   Organ Procurement Organization  
#> 6 X     PXRF  Portable X-Ray Facility         
#> 7 NA    NA    NA                              
```
