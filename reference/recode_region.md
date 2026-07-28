# Recode CMS Region Codes

Recode CMS Region Codes

## Usage

``` r
recode_region(x, as = c("number", "roman", "abbr", "full"))
```

## Arguments

- x:

  `<chr>` vector of CCN state codes.

- as:

  `<chr>` format to return; one of:

  - `"number"`: CMS region number (default)

  - `"roman"`: CMS region number as a roman numeral

  - `"abbr"`: CMS region's office location abbreviation

  - `"full"`: CMS region's office location name

## Value

`<chr>` vector of CMS region/region office names/abbreviations

## Examples

``` r
tibble::tibble(
  x = c("00", "01", "A5"),
  number = recode_region(x, "number"),
  roman = recode_region(x, "roman"),
  abbr = recode_region(x, "abbr"),
  full = recode_region(x, "full")
)
#> # A tibble: 3 × 5
#>   x     number roman abbr  full         
#>   <chr> <chr>  <chr> <chr> <chr>        
#> 1 00    9      IX    SF    San Francisco
#> 2 01    4      IV    ATL   Atlanta      
#> 3 A5    4      IV    ATL   Atlanta      
```
