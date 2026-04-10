# Construct a `ccnr` object

Construct a `ccnr` object

## Usage

``` r
ccnr(
  ccn = character(),
  form = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
)

new_ccnr(
  ccn = character(),
  form = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
)

is_ccnr(x)

as_ccnr(x)

decode_ccnr(x)
```

## Arguments

- ccn:

  a vector

- form:

  a vector

- state:

  Passed on to methods

- number:

  a vector

- type:

  a vector

- parent:

  a vector

- ext:

  a vector

- x:

  object

## Value

An S3 vector of class `<ccnr>`

## Examples

``` r
collapse::rsplit(decode_ccnr(get_pin("ccn")), ~ form)
#> $caid
#> # A tibble: 1 × 6
#>   ccn    state number type  parent ext  
#>   <chr>  <chr>  <int> <chr> <chr>  <chr>
#> 1 78A005 IL         5 A     NA     BP   
#> 
#> $care
#> # A tibble: 43,353 × 6
#>    ccn    state number type  parent ext  
#>    <chr>  <chr>  <int> <chr> <chr>  <chr>
#>  1 001500 AZ      1500 NA    NA     NA   
#>  2 001502 AZ      1502 NA    NA     NA   
#>  3 001503 AZ      1503 NA    NA     NA   
#>  4 001509 AZ      1509 NA    NA     NA   
#>  5 001510 AZ      1510 NA    NA     NA   
#>  6 001511 AZ      1511 NA    NA     NA   
#>  7 001513 AZ      1513 NA    NA     NA   
#>  8 001514 AZ      1514 NA    NA     NA   
#>  9 001515 AZ      1515 NA    NA     NA   
#> 10 001517 AZ      1517 NA    NA     NA   
#> # ℹ 43,343 more rows
#> 
#> $erh
#> # A tibble: 166 × 6
#>    ccn    state number type  parent ext  
#>    <chr>  <chr>  <int> <chr> <chr>  <chr>
#>  1 01014F AL        14 F     NA     NA   
#>  2 01019F AL        19 F     NA     NA   
#>  3 01021F AL        21 F     NA     NA   
#>  4 02013F AK        13 F     NA     NA   
#>  5 02014F AK        14 F     NA     NA   
#>  6 03012F AZ        12 F     NA     NA   
#>  7 03013F AZ        13 F     NA     NA   
#>  8 03033F AZ        33 F     NA     NA   
#>  9 04009F AR         9 F     NA     NA   
#> 10 04010F AR        10 F     NA     NA   
#> # ℹ 156 more rows
#> 
#> $sub
#> # A tibble: 49 × 6
#>    ccn    state number type  parent ext  
#>    <chr>  <chr>  <int> <chr> <chr>  <chr>
#>  1 02TA01 AK         1 T     A      NA   
#>  2 04SD38 AR        38 S     D      NA   
#>  3 05TA46 CA        46 T     A      NA   
#>  4 06TA09 CO         9 T     A      NA   
#>  5 10TA09 FL         9 T     A      NA   
#>  6 10TA10 FL        10 T     A      NA   
#>  7 10TA15 FL        15 T     A      NA   
#>  8 10TA20 FL        20 T     A      NA   
#>  9 10TA24 FL        24 T     A      NA   
#> 10 10TA25 FL        25 T     A      NA   
#> # ℹ 39 more rows
#> 
#> $supp
#> # A tibble: 5,488 × 6
#>    ccn        state number type  parent ext  
#>    <chr>      <chr>  <int> <chr> <chr>  <chr>
#>  1 01C0001000 AL      1000 C     NA     NA   
#>  2 01C0001002 AL      1002 C     NA     NA   
#>  3 01C0001008 AL      1008 C     NA     NA   
#>  4 01C0001009 AL      1009 C     NA     NA   
#>  5 01C0001010 AL      1010 C     NA     NA   
#>  6 01C0001011 AL      1011 C     NA     NA   
#>  7 01C0001013 AL      1013 C     NA     NA   
#>  8 01C0001014 AL      1014 C     NA     NA   
#>  9 01C0001017 AL      1017 C     NA     NA   
#> 10 01C0001018 AL      1018 C     NA     NA   
#> # ℹ 5,478 more rows
#> 
#> $unit
#> # A tibble: 3,213 × 6
#>    ccn    state number type  parent ext  
#>    <chr>  <chr>  <int> <chr> <chr>  <chr>
#>  1 01M307 AL       307 M     NA     NA   
#>  2 01M308 AL       308 M     NA     NA   
#>  3 01S007 AL         7 S     NA     NA   
#>  4 01S011 AL        11 S     NA     NA   
#>  5 01S012 AL        12 S     NA     NA   
#>  6 01S016 AL        16 S     NA     NA   
#>  7 01S021 AL        21 S     NA     NA   
#>  8 01S023 AL        23 S     NA     NA   
#>  9 01S033 AL        33 S     NA     NA   
#> 10 01S034 AL        34 S     NA     NA   
#> # ℹ 3,203 more rows
#> 
```
