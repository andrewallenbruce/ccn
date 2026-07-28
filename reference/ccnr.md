# Construct a `ccnr` object

Construct a `ccnr` object

## Usage

``` r
ccnr(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
)

new_ccnr(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
)

is_ccnr(x)
```

## Arguments

- entity:

  `<chr>` a vector of CCN Entity types

- ccn:

  `<chr>` A vector of CCNs

- state:

  `<chr>` Passed on to methods

- number:

  `<chr>` a vector

- type:

  `<chr>` a vector

## Value

An S3 vector of class `<ccnr>`

## Examples

``` r
tibble::tibble(
  x = get_pin("ccn"),
  ccn = as_ccn(x),
  ccnr = as_ccnr(ccn))
#> # A tibble: 52,287 × 3
#>    x      ccn        ccnr
#>    <chr>  <ccn>    <ccnr>
#>  1 001500 001500 Medicare
#>  2 001502 001502 Medicare
#>  3 001503 001503 Medicare
#>  4 001509 001509 Medicare
#>  5 001510 001510 Medicare
#>  6 001511 001511 Medicare
#>  7 001513 001513 Medicare
#>  8 001514 001514 Medicare
#>  9 001515 001515 Medicare
#> 10 001517 001517 Medicare
#> # ℹ 52,277 more rows
```
