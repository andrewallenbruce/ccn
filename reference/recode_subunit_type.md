# Recode Subunit Facility Types

Recode Subunit Facility Types

## Usage

``` r
recode_subunit_type(x, as = c("prefix", "abbr"))
```

## Arguments

- x:

  `<chr>` vector of CCN Subunit facility type characters.

- as:

  `<chr>` format to return; one of:

  - `"prefix"`: subunit parent ccn infix (default)

  - `"abbr"`: subunit abbreviation

## Value

`<chr>` vector of Subunit facility type abbreviations/parent prefixes

## Examples

``` r
tibble::tibble(
  x = ccn::subunit_types[["code"]],
  prefix = recode_subunit_type(x, "prefix"),
  abbr = recode_subunit_type(x, "abbr")
)
#> # A tibble: 11 × 3
#>    x     prefix abbr 
#>    <chr> <chr>  <chr>
#>  1 A     20     LTCH 
#>  2 B     21     LTCH 
#>  3 C     22     LTCH 
#>  4 D     30     IRF  
#>  5 E     33     Child
#>  6 F     40     Psych
#>  7 G     41     Psych
#>  8 H     42     Psych
#>  9 J     43     Psych
#> 10 K     44     Psych
#> 11 NA    NA     NA   
```
