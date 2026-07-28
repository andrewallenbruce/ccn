# Decode a `ccnr` object

Decode a `ccnr` object

## Usage

``` r
decode_ccnr(x)
```

## Arguments

- x:

  `<chr>` a vector of CCNs

## Value

An S3 vector of class `<ccnr>`

## Examples

``` r
decode_ccnr(get_pin("ccn"))
#> # A tibble: 52,287 × 6
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
#> # ℹ 52,277 more rows
```
