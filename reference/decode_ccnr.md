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
#>    ccn      entity state facility number type 
#>    <chr>    <chr>  <chr> <chr>     <int> <chr>
#>  1 Medicare 001500 AZ    NA         1500 NA   
#>  2 Medicare 001502 AZ    NA         1502 NA   
#>  3 Medicare 001503 AZ    NA         1503 NA   
#>  4 Medicare 001509 AZ    NA         1509 NA   
#>  5 Medicare 001510 AZ    NA         1510 NA   
#>  6 Medicare 001511 AZ    NA         1511 NA   
#>  7 Medicare 001513 AZ    NA         1513 NA   
#>  8 Medicare 001514 AZ    NA         1514 NA   
#>  9 Medicare 001515 AZ    NA         1515 NA   
#> 10 Medicare 001517 AZ    NA         1517 NA   
#> # ℹ 52,277 more rows
```
