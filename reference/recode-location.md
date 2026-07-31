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

  ### for `recode_state()`:

  - `"abbr"`: state abbreviation (default)

  - `"full"`: state name

  ### for `recode_region()`:

  - `"code"`: CMS region code (default)

  - `"roman"`: CMS region code as a roman numeral

  - `"abbr"`: CMS region's office location abbreviation

  - `"full"`: CMS region's office location name

## Value

`<chr>` vector of CMS state/region/office names/abbreviations

## Examples

``` r
tibble::tibble(
  x = c("00", "01", "A5", "B3", "B4", "B5", "D6"),
  state = recode_state(x, "abbr"),
  region = recode_region(state, "code"),
  office = recode_region(state, "full")
)
#> # A tibble: 7 × 4
#>   x     state region office       
#>   <chr> <chr>  <int> <chr>        
#> 1 00    AZ         9 San Francisco
#> 2 01    AL         4 Atlanta      
#> 3 A5    MS         4 Atlanta      
#> 4 B3    CA         9 San Francisco
#> 5 B4    CA         9 San Francisco
#> 6 B5    CA         9 San Francisco
#> 7 D6    CA         9 San Francisco
```
