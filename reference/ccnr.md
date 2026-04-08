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
  ccn = c("670005", "12345E", NA, "05P001", "21T101", "02TA01", "10C0001062", "000001A001"),
  form = c("medicare", "emergency", NA, "organ", "unit", "subunit", "supplier", "medicare"),
  state = c("67", "12", NA, "05", "21", "02", "10", "00"),
  number = c("0005", "345", NA, "001", "101", "01", "0001062", "0001"),
  type = c(NA, "E", NA, "P", "T", "T", "C", NA),
  parent = c(NA, NA, NA, NA, NA, "A", NA, NA),
  ext = c(NA, NA, NA, NA, NA, NA, NA, "A001"))

x
#> <ccn_rcrd[8]>
#> [1]     670005     12345E <NA>           05P001     21T101     02TA01 10C0001062
#> [8] 000001A001

tibble::tibble(x)
#> # A tibble: 8 × 1
#>            x
#>       <ccnr>
#> 1     670005
#> 2     12345E
#> 3         NA
#> 4     05P001
#> 5     21T101
#> 6     02TA01
#> 7 10C0001062
#> 8 000001A001
```
