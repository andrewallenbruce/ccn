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
#>    x      ccn      ccnr
#>    <chr>  <ccn>  <ccnr>
#>  1 001500 001500 001500
#>  2 001502 001502 001502
#>  3 001503 001503 001503
#>  4 001509 001509 001509
#>  5 001510 001510 001510
#>  6 001511 001511 001511
#>  7 001513 001513 001513
#>  8 001514 001514 001514
#>  9 001515 001515 001515
#> 10 001517 001517 001517
#> # ℹ 52,277 more rows
```
