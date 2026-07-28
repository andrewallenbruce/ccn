# Recode State Codes

Recode State Codes

## Usage

``` r
recode_state(x, as = c("abbr", "full"))
```

## Arguments

- x:

  `<chr>` vector of CCN state codes.

- as:

  `<chr>` format to return; one of:

  - "abbr": state abbreviation (default)

  - "full": state name

## Value

`<chr>` vector of state names/abbreviations

## Examples

``` r
tibble::tibble(
  code = c("00", "01", "A5", NA),
  abbr = recode_state(code, "abbr"),
  full = recode_state(code, "full")
)
#> # A tibble: 4 × 3
#>   code  abbr  full       
#>   <chr> <chr> <chr>      
#> 1 00    AZ    Arizona    
#> 2 01    AL    Alabama    
#> 3 A5    MS    Mississippi
#> 4 NA    NA    NA         
```
