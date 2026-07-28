# Convert to a `ccnr` object

Convert to a `ccnr` object

## Usage

``` r
as_ccnr(x, ...)

# S3 method for class 'character'
as_ccnr(x, ...)

# S3 method for class 'ccn'
as_ccnr(x, ...)

# S3 method for class 'ccnr'
as_ccnr(x, ...)
```

## Arguments

- x:

  `<chr>` A vector of CCNs.

- ...:

  Passed on to methods.

## Value

An S3 vector of class `<ccnr>`

## Examples

``` r
tibble::tibble(
  x = get_pin("ccn"),
  ccnr = as_ccnr(x),
  ccn = as_ccn(ccnr),
  ccnr2 = as_ccnr(ccnr)
)
#> # A tibble: 54,567 × 4
#>    x        ccnr ccn     ccnr2
#>    <chr>  <ccnr> <ccn>  <ccnr>
#>  1 001500 001500 001500 001500
#>  2 001502 001502 001502 001502
#>  3 001503 001503 001503 001503
#>  4 001509 001509 001509 001509
#>  5 001510 001510 001510 001510
#>  6 001511 001511 001511 001511
#>  7 001513 001513 001513 001513
#>  8 001514 001514 001514 001514
#>  9 001515 001515 001515 001515
#> 10 001517 001517 001517 001517
#> # ℹ 54,557 more rows
```
