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

index_types(x)
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
ccn("030113")
#> <ccn_vctr[1]>
#> [1] 030113
x <- ccn(get_pin("ccn")[20:50])
index_types(x)
#> <type_index>
#> medicare : 31
#>    TOTAL : 31
data.frame(x)
#>         x
#> 1  001541
#> 2  001545
#> 3  001550
#> 4  001552
#> 5  001556
#> 6  001557
#> 7  001561
#> 8  001562
#> 9  001563
#> 10 001568
#> 11 001570
#> 12 001571
#> 13 001572
#> 14 001574
#> 15 001575
#> 16 010001
#> 17 010005
#> 18 010006
#> 19 010007
#> 20 010008
#> 21 010011
#> 22 010012
#> 23 010016
#> 24 010018
#> 25 010019
#> 26 010021
#> 27 010022
#> 28 010023
#> 29 010024
#> 30 010029
#> 31 010033
tibble::tibble(x)
#> # A tibble: 31 × 1
#>    x     
#>    <ccn> 
#>  1 001541
#>  2 001545
#>  3 001550
#>  4 001552
#>  5 001556
#>  6 001557
#>  7 001561
#>  8 001562
#>  9 001563
#> 10 001568
#> # ℹ 21 more rows
```
