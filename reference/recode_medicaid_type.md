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
  x = c("A", "K"),
  abbr = recode_medicaid_type(x, "abbr"),
  full = recode_medicaid_type(x, "full")
)
#> # A tibble: 2 × 3
#>   x     abbr  full                    
#>   <chr> <chr> <chr>                   
#> 1 A     SNF   Skilled Nursing Facility
#> 2 K     HHA   Home Health Agency      
```
