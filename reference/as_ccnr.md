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
#> # A tibble: 52,287 × 4
#>    x          ccnr ccn         ccnr2
#>    <chr>    <ccnr> <ccn>      <ccnr>
#>  1 001500 Medicare MEDICARE Medicare
#>  2 001502 Medicare MEDICARE Medicare
#>  3 001503 Medicare MEDICARE Medicare
#>  4 001509 Medicare MEDICARE Medicare
#>  5 001510 Medicare MEDICARE Medicare
#>  6 001511 Medicare MEDICARE Medicare
#>  7 001513 Medicare MEDICARE Medicare
#>  8 001514 Medicare MEDICARE Medicare
#>  9 001515 Medicare MEDICARE Medicare
#> 10 001517 Medicare MEDICARE Medicare
#> # ℹ 52,277 more rows
```
