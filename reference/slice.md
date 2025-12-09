# Slice CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
slice(x)

provider_slice(x)

ccn_slice(x)

slice_provider(x)

slice_provider_ext(x)

slice_medicare(x)

slice_organ(x)

slice_emergency(x)

slice_supplier(x)

slice_supplier_ext(x)

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
slice("670055")
#> [1] "67"   "0055"
slice("05P001")
#> [1] "05"  "P"   "001"
slice("12345E")
#> [1] "12"  "345" "E"  
slice("10C0001062")
#> [1] "10"      "C"       "0001062"
slice("A5J508")
#> [1] "A5"  "J"   "508"
slice("21T101")
#> [1] "21"  "T"   "101"
slice("02TA01")
#> [1] "02" "T"  "A"  "01"
slice("240019A")
#>                  ext 
#>   "24" "0019"    "A" 
slice("330125001")
#>                  ext 
#>   "33" "0125"  "001" 
```
