# Recode CMS State/Region Codes

Recode CMS State/Region Codes

## Usage

``` r
recode_state(x, as = c("abbr", "full"))

recode_region(x, as = c("code", "roman", "abbr", "full"))
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
  region = recode_region(state, "code"),
  office = recode_region(state, "full")
)
#> # A tibble: 139 × 4
#>    x     state region office       
#>    <chr> <chr>  <int> <chr>        
#>  1 00    AZ         9 San Francisco
#>  2 01    AL         4 Atlanta      
#>  3 02    AK        10 Seattle      
#>  4 03    AZ         9 San Francisco
#>  5 04    AR         6 Dallas       
#>  6 05    CA         9 San Francisco
#>  7 06    CO         8 Denver       
#>  8 07    CT         1 Boston       
#>  9 08    DE         3 Philadelphia 
#> 10 09    DC         3 Philadelphia 
#> # ℹ 129 more rows
```
