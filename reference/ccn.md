# Construct a `ccn` object

- `new_ccn()` is a low-level constructor that takes a vector.

- `ccn()` constructs an npi object from a vector.

- `as_ccn()` and `is_ccn()` forward to
  [`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
  and [`inherits()`](https://rdrr.io/r/base/class.html), respectively.

## Usage

``` r
ccn(x = character())

new_ccn(x = character())

is_ccn(x)

as_ccn(x, ...)

# Default S3 method
as_ccn(x, ...)

# S3 method for class 'character'
as_ccn(x, ...)

infer_form(x)
```

## Arguments

- x:

  a vector

- ...:

  Passed on to methods.

## Value

An S3 vector of class `<ccn>`

## Examples

``` r
new_ccn()
#> <ccn[0]>
ccn()
#> <ccn[0]>
ccn("030113")
#> <ccn[1]>
#> [1] 030113
x <- get_pin("ccn")[1:20]
x <- ccn(x)
x
#> <ccn[20]>
#>  [1] 001500 001502 001503 001509 001510 001511 001513 001514 001515 001517
#> [11] 001518 001524 001527 001528 001529 001530 001534 001535 001536 001541
str(x)
#>  ccn [1:20] 001500, 001502, 001503, 001509, 001510, 001511, 001513, 001514,...
infer_form(x)
#> <infer_index>
#> medicare : 20
#>    total : 20
data.frame(x)
#>         x
#> 1  001500
#> 2  001502
#> 3  001503
#> 4  001509
#> 5  001510
#> 6  001511
#> 7  001513
#> 8  001514
#> 9  001515
#> 10 001517
#> 11 001518
#> 12 001524
#> 13 001527
#> 14 001528
#> 15 001529
#> 16 001530
#> 17 001534
#> 18 001535
#> 19 001536
#> 20 001541
tibble::tibble(x)
#> # A tibble: 20 × 1
#>    x     
#>    <ccn> 
#>  1 001500
#>  2 001502
#>  3 001503
#>  4 001509
#>  5 001510
#>  6 001511
#>  7 001513
#>  8 001514
#>  9 001515
#> 10 001517
#> 11 001518
#> 12 001524
#> 13 001527
#> 14 001528
#> 15 001529
#> 16 001530
#> 17 001534
#> 18 001535
#> 19 001536
#> 20 001541
```
