# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
emergency_hospital_name(x)

supplier_name(x)

state_name(x)

state_abbr(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
emergency_hospital_name(LETTERS)
#>  [1] NA        NA        NA        NA        "ER (NF)" "ER (F)"  NA       
#>  [8] NA        NA        NA        NA        NA        NA        NA       
#> [15] NA        NA        NA        NA        NA        NA        NA       
#> [22] NA        NA        NA        NA        NA       
supplier_name(LETTERS)
#>  [1] NA     NA     "ASC"  "CLIA" NA     NA     NA     NA     NA     NA    
#> [11] NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    
#> [21] NA     NA     NA     "XRAY" NA     NA    
state_name(c("00", "01", "83", "A0"))
#> [1] "Arizona"    "Alabama"    "New Jersey" "California"
state_abbr(c("Georgia", "Florida"))
#> [1] "GA" "FL"
```
