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

  - "abbr": state abbreviation (default)

  - "full": state name

## Value

`<chr>` vector of Medicaid facility type names/abbreviations

## Examples

``` r
tibble::tibble(
  code = c("A", "K", NA),
  abbr = recode_medicaid_type(code, "abbr"),
  full = recode_medicaid_type(code, "full")
)
#> # A tibble: 3 × 3
#>   code  abbr  full                    
#>   <chr> <chr> <chr>                   
#> 1 A     SNF   Skilled Nursing Facility
#> 2 K     HHA   Home Health Agency      
#> 3 NA    NA    NA                      
```
