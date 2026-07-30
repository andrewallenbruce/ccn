# Recode CMS State/Region Codes

Recode CMS State/Region Codes

## Usage

``` r
recode_state(x, as = c("abbr", "full"))

recode_region(x, as = c("number", "roman", "abbr", "full"))
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

  - `"number"`: CMS region number (default)

  - `"roman"`: CMS region number as a roman numeral

  - `"abbr"`: CMS region's office location abbreviation

  - `"full"`: CMS region's office location name

## Value

`<chr>` vector of CMS state/region/office names/abbreviations

## Examples

``` r
tibble::tibble(
  x = c("00", "01", "A5"),
  state = recode_state(x, "abbr"),
  number = recode_region(x, "number"),
  office = recode_region(x, "full")
)
#> # A tibble: 3 × 4
#>   x     state number office       
#>   <chr> <chr> <chr>  <chr>        
#> 1 00    AZ    9      San Francisco
#> 2 01    AL    4      Atlanta      
#> 3 A5    MS    4      Atlanta      
```
