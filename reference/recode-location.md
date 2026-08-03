# Recode CMS State/Region Codes

Recode CMS State/Region Codes

## Usage

``` r
recode_state(x, as = c("abbr", "full"))

recode_region(x, as = c("code", "roman", "abbr", "full"))

as_region(x)
```

## Arguments

- x:

  `<chr>` vector of CCN state codes.

- as:

  `<chr>` format to return; one of:

  For `recode_state()`:

  - `"abbr"`: state abbreviation (default)

  - `"full"`: state name

  For `recode_region()`:

  - `"code"`: CMS region code (default)

  - `"roman"`: CMS region code as a roman numeral

  - `"abbr"`: CMS region's office location abbreviation

  - `"full"`: CMS region's office location name

## Value

`<chr>` vector of CMS state/region/office names/abbreviations

## Examples

``` r
tibble::tibble(
  x = ccn::states[["code"]],
  state = recode_state(x, "abbr"),
  region = as_region(state)
)
#> # A tibble: 139 × 3
#>    x     state region            
#>    <chr> <chr> <chr>             
#>  1 00    AZ    (IX) San Francisco
#>  2 01    AL    (IV) Atlanta      
#>  3 02    AK    (X) Seattle       
#>  4 03    AZ    (IX) San Francisco
#>  5 04    AR    (VI) Dallas       
#>  6 05    CA    (IX) San Francisco
#>  7 06    CO    (VIII) Denver     
#>  8 07    CT    (I) Boston        
#>  9 08    DE    (III) Philadelphia
#> 10 09    DC    (III) Philadelphia
#> # ℹ 129 more rows
```
