# Recode CMS Facility Ranges

Recode CMS Facility Ranges

## Usage

``` r
recode_medicare_range(x, as = c("abbr", "full", "range"))

recode_medicaid_range(x, as = c("abbr", "full", "range"))
```

## Arguments

- x:

  `<int>` vector of CCN facility ranges.

- as:

  `<chr>` format to return; one of:

  - `"abbr"`: facility range abbreviation (default)

  - `"full"`: facility range full description

  - `"range"`: facility range text representation

## Value

`<chr>` vector of CMS facility range information

## Examples

``` r
tibble::tibble(
  x = c(1L, 2099L),
  abbr = recode_medicare_range(x, "abbr"),
  range = recode_medicare_range(x, "range"),
  facility = recode_medicare_range(x, "full")
)
#> # A tibble: 2 × 4
#>       x abbr  range     facility                                 
#>   <int> <chr> <chr>     <chr>                                    
#> 1     1 Acute 0001-0879 Short-Term Hospital (General & Specialty)
#> 2  2099 LTCH  2000-2299 Long-Term Care Hospital                  

tibble::tibble(
  x = c(1L, 2099L),
  abbr = recode_medicaid_range(x, "abbr"),
  range = recode_medicaid_range(x, "range"),
  facility = recode_medicaid_range(x, "full")
)
#> # A tibble: 2 × 4
#>       x abbr  range   facility                      
#>   <int> <chr> <chr>   <chr>                         
#> 1     1 Acute 001-099 Short-Term Acute Care Hospital
#> 2  2099 NA    NA      NA                            
```
