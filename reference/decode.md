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
b = as_ccnr(x)
decode(as_ccn(x))
#> # A tibble: 54,567 × 5
#>    ccn    entity   state number type 
#>    <chr>  <chr>    <chr>  <int> <chr>
#>  1 001500 Medicare 00      1500 NA   
#>  2 001502 Medicare 00      1502 NA   
#>  3 001503 Medicare 00      1503 NA   
#>  4 001509 Medicare 00      1509 NA   
#>  5 001510 Medicare 00      1510 NA   
#>  6 001511 Medicare 00      1511 NA   
#>  7 001513 Medicare 00      1513 NA   
#>  8 001514 Medicare 00      1514 NA   
#>  9 001515 Medicare 00      1515 NA   
#> 10 001517 Medicare 00      1517 NA   
#> # ℹ 54,557 more rows
decode(b)
#> # A tibble: 54,567 × 6
#>    ccn    state region             entity   facility range    
#>    <chr>  <chr> <chr>              <chr>    <chr>    <chr>    
#>  1 001500 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  2 001502 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  3 001503 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  4 001509 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  5 001510 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  6 001511 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  7 001513 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  8 001514 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#>  9 001515 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#> 10 001517 AZ    (IX) San Francisco Medicare Hospice  1500-1799
#> # ℹ 54,557 more rows
collapse::qDF(collapse::fcountv(decode(b), c("entity", "facility")))
#>       entity      facility     N
#> 1   Medicare       Hospice  5114
#> 2   Medicare         Acute  3234
#> 3   Medicare           CAH  1382
#> 4   Medicare          LTCH   332
#> 5   Medicare        ESRD-H   220
#> 6   Medicare        ESRD-I  7211
#> 7   Medicare           IRF   407
#> 8   Medicare         Child    95
#> 9   Medicare         Psych   667
#> 10  Medicare           SNF 14674
#> 11  Medicare           HHA 10121
#> 12  Medicare        HHA-NP  1019
#> 13  Medicare        HHA-SL   715
#> 14  Medicare           TXC   233
#> 15  Medicare       ESRD-HS   139
#> 16  Medicare          FQHC     2
#> 17  Medicare       ESRD-IP     1
#> 18  Medicare           OCM     9
#> 19  Medicare       ESRD-HP     1
#> 20  Medicaid           SNF     1
#> 21      Unit   Psych (CAH)    46
#> 22      Unit         Psych   745
#> 23      Unit         Rehab   792
#> 24      Unit Swing (Acute)   297
#> 25      Unit   Swing (CAH)  1342
#> 26      Unit   Rehab (CAH)     7
#> 27      Unit   Swing (LTC)     2
#> 28      Unit   Swing (IRF)     1
#> 29   Subunit         Rehab    41
#> 30   Subunit         Psych     8
#> 31     Organ           OPO    55
#> 32 Emergency           ERF   164
#> 33 Emergency           ERN     2
#> 34  Supplier           ASC  5473
#> 35  Supplier          CLIA     9
#> 36  Supplier          PXRF     6
```
