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
get_pin("ccn") |>
  as_ccnr() |>
  vctrs::vec_data() |>
  tibble::tibble()
#> # A tibble: 52,270 × 7
#>    ccn    form  state number type  parent ext  
#>    <chr>  <chr> <chr> <chr>  <chr> <chr>  <chr>
#>  1 001500 care  00    1500   NA    NA     NA   
#>  2 001502 care  00    1502   NA    NA     NA   
#>  3 001503 care  00    1503   NA    NA     NA   
#>  4 001509 care  00    1509   NA    NA     NA   
#>  5 001510 care  00    1510   NA    NA     NA   
#>  6 001511 care  00    1511   NA    NA     NA   
#>  7 001513 care  00    1513   NA    NA     NA   
#>  8 001514 care  00    1514   NA    NA     NA   
#>  9 001515 care  00    1515   NA    NA     NA   
#> 10 001517 care  00    1517   NA    NA     NA   
#> # ℹ 52,260 more rows
```
