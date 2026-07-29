# Decode `ccn`/`ccnr` objects

Decode `ccn`/`ccnr` objects

## Usage

``` r
decode(x, ...)

# S3 method for class 'ccn'
decode(x, ...)

# S3 method for class 'ccnr'
decode(x, ...)
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
x = get_pin("ccn")
decode(as_ccn(x))
decode(as_ccnr(x))
#> # A tibble: 54,567 × 6
#>    ccn    entity   state facility number type 
#>    <chr>  <chr>    <chr> <chr>     <int> <chr>
#>  1 001500 Medicare AZ    Hospice    1500 NA   
#>  2 001502 Medicare AZ    Hospice    1502 NA   
#>  3 001503 Medicare AZ    Hospice    1503 NA   
#>  4 001509 Medicare AZ    Hospice    1509 NA   
#>  5 001510 Medicare AZ    Hospice    1510 NA   
#>  6 001511 Medicare AZ    Hospice    1511 NA   
#>  7 001513 Medicare AZ    Hospice    1513 NA   
#>  8 001514 Medicare AZ    Hospice    1514 NA   
#>  9 001515 Medicare AZ    Hospice    1515 NA   
#> 10 001517 Medicare AZ    Hospice    1517 NA   
#> # ℹ 54,557 more rows
```
