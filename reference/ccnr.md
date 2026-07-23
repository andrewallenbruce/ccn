# Construct a `ccnr` object

Construct a `ccnr` object

## Usage

``` r
ccnr(
  ccn = character(),
  entity = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
)

new_ccnr(
  ccn = character(),
  entity = character(),
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

- entity:

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
x <- get_pin("ccn")

tibble::tibble(
  x = x,
  ccn = as_ccn(x),
  ccnr = as_ccnr(ccn))
#> # A tibble: 52,287 × 3
#>    x      ccn      ccnr
#>    <chr>  <ccn>  <ccnr>
#>  1 001500 001500 001500
#>  2 001502 001502 001502
#>  3 001503 001503 001503
#>  4 001509 001509 001509
#>  5 001510 001510 001510
#>  6 001511 001511 001511
#>  7 001513 001513 001513
#>  8 001514 001514 001514
#>  9 001515 001515 001515
#> 10 001517 001517 001517
#> # ℹ 52,277 more rows

y <- decode_ccnr(x) |>
  collapse::roworderv(c("entity", "state", "facility", "number")) |>
  collapse::rsplit(~entity)

tibble::tibble(
  parent0 = y$Unit$parent,
  parent1 = as_ccn(parent0),
  parent2 = as_ccnr(parent0)
)
#> # A tibble: 3,230 × 3
#>    parent0 parent1 parent2
#>    <chr>   <ccn>    <ccnr>
#>  1 02 008   02008   02 008
#>  2 02 017   02017   02 017
#>  3 020006  020006   020006
#>  4 020024  020024   020024
#>  5 021301  021301   021301
#>  6 021302  021302   021302
#>  7 021304  021304   021304
#>  8 021305  021305   021305
#>  9 021306  021306   021306
#> 10 021307  021307   021307
#> # ℹ 3,220 more rows

y
#> $Emergency
#> # A tibble: 166 × 7
#>    ccn    state facility parent ext   number type 
#>    <chr>  <chr> <chr>    <chr>  <chr>  <int> <chr>
#>  1 02013F AK    FED      NA     NA        13 F    
#>  2 02014F AK    FED      NA     NA        14 F    
#>  3 01014F AL    FED      NA     NA        14 F    
#>  4 01019F AL    FED      NA     NA        19 F    
#>  5 01021F AL    FED      NA     NA        21 F    
#>  6 04009F AR    FED      NA     NA         9 F    
#>  7 04010F AR    FED      NA     NA        10 F    
#>  8 03012F AZ    FED      NA     NA        12 F    
#>  9 03013F AZ    FED      NA     NA        13 F    
#> 10 03033F AZ    FED      NA     NA        33 F    
#> # ℹ 156 more rows
#> 
#> $Medicaid
#> # A tibble: 1 × 7
#>   ccn    state facility parent ext   number type 
#>   <chr>  <chr> <chr>    <chr>  <chr>  <int> <chr>
#> 1 78A005 IL    SNF-NF   NA     BP         5 A    
#> 
#> $Medicare
#> # A tibble: 43,353 × 7
#>    ccn    state facility parent ext   number type 
#>    <chr>  <chr> <chr>    <chr>  <chr>  <int> <chr>
#>  1 020001 AK    Acute    NA     NA         1 NA   
#>  2 020006 AK    Acute    NA     NA         6 NA   
#>  3 020008 AK    Acute    NA     NA         8 NA   
#>  4 020012 AK    Acute    NA     NA        12 NA   
#>  5 020017 AK    Acute    NA     NA        17 NA   
#>  6 020018 AK    Acute    NA     NA        18 NA   
#>  7 020024 AK    Acute    NA     NA        24 NA   
#>  8 020026 AK    Acute    NA     NA        26 NA   
#>  9 021301 AK    CAH      NA     NA      1301 NA   
#> 10 021302 AK    CAH      NA     NA      1302 NA   
#> # ℹ 43,343 more rows
#> 
#> $Subunit
#> # A tibble: 49 × 7
#>    ccn    state facility parent ext   number type 
#>    <chr>  <chr> <chr>    <chr>  <chr>  <int> <chr>
#>  1 02TA01 AK    Rehab    022001 NA         1 T    
#>  2 04SD38 AR    Psych    043038 NA        38 S    
#>  3 05TA46 CA    Rehab    052046 NA        46 T    
#>  4 06TA09 CO    Rehab    062009 NA         9 T    
#>  5 10TA09 FL    Rehab    102009 NA         9 T    
#>  6 10TA10 FL    Rehab    102010 NA        10 T    
#>  7 10TA15 FL    Rehab    102015 NA        15 T    
#>  8 10TA20 FL    Rehab    102020 NA        20 T    
#>  9 10TA24 FL    Rehab    102024 NA        24 T    
#> 10 10TA25 FL    Rehab    102025 NA        25 T    
#> # ℹ 39 more rows
#> 
#> $Supplier
#> # A tibble: 5,488 × 7
#>    ccn        state facility parent ext   number type 
#>    <chr>      <chr> <chr>    <chr>  <chr>  <int> <chr>
#>  1 02C0001000 AK    ASC      NA     NA      1000 C    
#>  2 02C0001001 AK    ASC      NA     NA      1001 C    
#>  3 02C0001002 AK    ASC      NA     NA      1002 C    
#>  4 02C0001004 AK    ASC      NA     NA      1004 C    
#>  5 02C0001005 AK    ASC      NA     NA      1005 C    
#>  6 02C0001007 AK    ASC      NA     NA      1007 C    
#>  7 02C0001008 AK    ASC      NA     NA      1008 C    
#>  8 02C0001011 AK    ASC      NA     NA      1011 C    
#>  9 02C0001012 AK    ASC      NA     NA      1012 C    
#> 10 02C0001014 AK    ASC      NA     NA      1014 C    
#> # ℹ 5,478 more rows
#> 
#> $Unit
#> # A tibble: 3,230 × 7
#>    ccn    state facility      parent ext   number type 
#>    <chr>  <chr> <chr>         <chr>  <chr>  <int> <chr>
#>  1 02S008 AK    Psych         02 008 NA         8 S    
#>  2 02T017 AK    Rehab         02 017 NA        17 T    
#>  3 02U006 AK    Swing (Acute) 020006 NA         6 U    
#>  4 02U024 AK    Swing (Acute) 020024 NA        24 U    
#>  5 02Z301 AK    Swing (CAH)   021301 NA       301 Z    
#>  6 02Z302 AK    Swing (CAH)   021302 NA       302 Z    
#>  7 02Z304 AK    Swing (CAH)   021304 NA       304 Z    
#>  8 02Z305 AK    Swing (CAH)   021305 NA       305 Z    
#>  9 02Z306 AK    Swing (CAH)   021306 NA       306 Z    
#> 10 02Z307 AK    Swing (CAH)   021307 NA       307 Z    
#> # ℹ 3,220 more rows
#> 
```
