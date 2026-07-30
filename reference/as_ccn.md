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
head(as_ccn(get_pin("ccn")))
#> <ccn_vctr[6]>
#> [1] 001500 001502 001503 001509 001510 001511
```
