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
decode_ccnr(c(get_pin("ccn"), "01J008"))
#> # A tibble: 52,288 × 8
#>    ccn    form  state facility parent ext   number type 
#>    <chr>  <chr> <chr> <chr>    <chr>  <chr>  <int> <chr>
#>  1 001500 care  AZ    HOSPICE  NA     NA      1500 NA   
#>  2 001502 care  AZ    HOSPICE  NA     NA      1502 NA   
#>  3 001503 care  AZ    HOSPICE  NA     NA      1503 NA   
#>  4 001509 care  AZ    HOSPICE  NA     NA      1509 NA   
#>  5 001510 care  AZ    HOSPICE  NA     NA      1510 NA   
#>  6 001511 care  AZ    HOSPICE  NA     NA      1511 NA   
#>  7 001513 care  AZ    HOSPICE  NA     NA      1513 NA   
#>  8 001514 care  AZ    HOSPICE  NA     NA      1514 NA   
#>  9 001515 care  AZ    HOSPICE  NA     NA      1515 NA   
#> 10 001517 care  AZ    HOSPICE  NA     NA      1517 NA   
#> # ℹ 52,278 more rows
```
