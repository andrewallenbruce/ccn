# Init CCN Parser

Convert various codes to their associated names.

## Usage

``` r
init(num = character(0), ext = NA_character_)
```

## Arguments

- num:

  ccn code as character vector.

- ext:

  optional extension code as character vector.

## Value

character vector of names associated with codes.

## Examples

``` r
init("670055")
#> <ccn::init>
#>  @ num: chr "670055"
#>  @ ste: chr "67"
#>  @ seq: chr "0055"
#>  @ typ: chr NA
#>  @ par: chr NA
#>  @ ext: chr NA
init("05P001")
#> <ccn::init>
#>  @ num: chr "05P001"
#>  @ ste: chr "05"
#>  @ seq: chr "001"
#>  @ typ: chr "P"
#>  @ par: chr NA
#>  @ ext: chr NA
init("12345E")
#> <ccn::init>
#>  @ num: chr "12345E"
#>  @ ste: chr "12"
#>  @ seq: chr "345"
#>  @ typ: chr "E"
#>  @ par: chr NA
#>  @ ext: chr NA
init("10C0001062")
#> <ccn::init>
#>  @ num: chr "10C0001062"
#>  @ ste: chr "10"
#>  @ seq: chr NA
#>  @ typ: chr NA
#>  @ par: chr NA
#>  @ ext: chr NA
init("A5J508")
#> <ccn::init>
#>  @ num: chr "A5J508"
#>  @ ste: chr "A5"
#>  @ seq: chr "508"
#>  @ typ: chr "J"
#>  @ par: chr NA
#>  @ ext: chr NA
init("21T101")
#> <ccn::init>
#>  @ num: chr "21T101"
#>  @ ste: chr "21"
#>  @ seq: chr "101"
#>  @ typ: chr "T"
#>  @ par: chr NA
#>  @ ext: chr NA
init("02TA01")
#> <ccn::init>
#>  @ num: chr "02TA01"
#>  @ ste: chr "02"
#>  @ seq: chr "01"
#>  @ typ: chr "T"
#>  @ par: chr "A"
#>  @ ext: chr NA
```
