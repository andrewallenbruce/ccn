# Convert to a `ccn`/`ccnr` object

Convert to a `ccn`/`ccnr` object

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

as_ccnr(x, ...)

# Default S3 method
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

An S3 vector of class `<ccn>` or `<ccnr>`

## Examples

``` r
x = get_pin("ccn")

head(as_ccn(x))
#> <ccn_vctr[6]>
#> [1] 001500 001502 001503 001509 001510 001511

head(as_ccnr(x))
#> <ccn_rcrd[6]>
#> [1] 001500 001502 001503 001509 001510 001511
```
