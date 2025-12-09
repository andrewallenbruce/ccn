# Slice CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
slice(x)

switch_provider(x)

switch_ccn(x)

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
#>     entity      state   sequence 
#> "medicare"       "67"     "0055" 
slice("05P001")
#>    state     type sequence 
#>     "05"      "P"    "001" 
slice("12345E")
#>    state sequence     type 
#>     "12"    "345"      "E" 
slice("10C0001062")
#>     state      type  sequence 
#>      "10"       "C" "0001062" 
slice("A5J508")
#>    state     type sequence 
#>     "A5"      "J"    "508" 
slice("21T101")
#>    state     type sequence 
#>     "21"      "T"    "101" 
slice("02TA01")
#>    state     type   parent sequence 
#>     "02"      "T"      "A"     "01" 
slice("240019A")
#>     entity      state   sequence        ext 
#> "medicare"       "24"     "0019"        "A" 
slice("330125001")
#>     entity      state   sequence        ext 
#> "medicare"       "33"     "0125"      "001" 
```
