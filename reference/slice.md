# Slice CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
slice_medicare(x)

slice_organ(x)

slice_emergency(x)

slice_supplier(x)

slice_medicaid(x)

slice_unit(x)

slice_subunit(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
slice_medicare("670055")
#> [1] "67"   "0055"
slice_organ("05P001")
#> [1] "05"  "P"   "001"
slice_emergency("12345E")
#> [1] "12"  "345" "E"  
slice_supplier("10C0001062")
#> [1] "10"      "C"       "0001062"
slice_medicaid("A5J508")
#> [1] "A5"  "J"   "508"
slice_unit("21T101")
#> [1] "21"  "T"   "101"
slice_subunit("02TA01")
#> [1] "02" "T"  "A"  "01"
```
