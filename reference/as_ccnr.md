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
head(as_ccnr(get_pin("ccn")))
#> <ccn_rcrd[6]>
#> [1] 001500 001502 001503 001509 001510 001511
```
