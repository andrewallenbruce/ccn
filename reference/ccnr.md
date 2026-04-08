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
x <- ccnr(
  c("670005", "12345E", NA, "05P001", "21T101", "02TA01", "10C0001062", "000001A001"),
  c("care", "erh", NA, "opo", "unit", "sub", "supp", "care"),
  c("67", "12", NA, "05", "21", "02", "10", "00"),
  c("0005", "345", NA, "001", "101", "01", "0001062", "0001"),
  c(NA, "E", NA, "P", "T", "T", "C", NA),
  c(NA, NA, NA, NA, NA, "A", NA, NA),
  c(NA, NA, NA, NA, NA, NA, NA, "A001"))
x
#> <ccn_rcrd[8]>
#> [1]     670005     12345E <NA>           05P001     21T101     02TA01 10C0001062
#> [8] 000001A001
tibble::tibble(x, ccn = as_ccn(x))
#> # A tibble: 8 × 2
#>            x ccn       
#>       <ccnr> <ccn>     
#> 1     670005     670005
#> 2     12345E     12345E
#> 3         NA NA        
#> 4     05P001     05P001
#> 5     21T101     21T101
#> 6     02TA01     02TA01
#> 7 10C0001062 10C0001062
#> 8 000001A001 000001A001
tibble::as_tibble(vctrs::vec_data(x))
#> # A tibble: 8 × 7
#>   ccn        form  state number  type  parent ext  
#>   <chr>      <chr> <chr> <chr>   <chr> <chr>  <chr>
#> 1 670005     care  67    0005    NA    NA     NA   
#> 2 12345E     erh   12    345     E     NA     NA   
#> 3 NA         NA    NA    NA      NA    NA     NA   
#> 4 05P001     opo   05    001     P     NA     NA   
#> 5 21T101     unit  21    101     T     NA     NA   
#> 6 02TA01     sub   02    01      T     A      NA   
#> 7 10C0001062 supp  10    0001062 C     NA     NA   
#> 8 000001A001 care  00    0001    NA    NA     A001 
```
