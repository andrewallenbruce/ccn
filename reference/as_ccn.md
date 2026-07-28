# Convert to a `ccn` object

Convert to a `ccn` object

## Usage

``` r
as_ccn(x, ...)

# Default S3 method
as_ccn(x, ...)

# S3 method for class 'character'
as_ccn(x, ...)

# S3 method for class 'ccn'
as_ccn(x, ...)

# S3 method for class 'ccnr'
as_ccn(x, ...)
```

## Arguments

- x:

  `<chr>` A vector of CCNs.

- ...:

  Passed on to methods.

## Value

An S3 vector of class `<ccn>`

## Examples

``` r
tibble::tibble(
  x = get_pin("ccn"),
  ccn = as_ccn(x),
  ccnr = as_ccnr(ccn),
  ccn2 = as_ccn(ccnr)
)
#> # A tibble: 52,287 × 4
#>    x      ccn        ccnr ccn2    
#>    <chr>  <ccn>    <ccnr> <ccn>   
#>  1 001500 001500 Medicare MEDICARE
#>  2 001502 001502 Medicare MEDICARE
#>  3 001503 001503 Medicare MEDICARE
#>  4 001509 001509 Medicare MEDICARE
#>  5 001510 001510 Medicare MEDICARE
#>  6 001511 001511 Medicare MEDICARE
#>  7 001513 001513 Medicare MEDICARE
#>  8 001514 001514 Medicare MEDICARE
#>  9 001515 001515 Medicare MEDICARE
#> 10 001517 001517 Medicare MEDICARE
#> # ℹ 52,277 more rows
```
