# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
emergency_hospital_name(x)

supplier_name(x)

state_abbr(x)

state_name(x)
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
state_abbr(ccn:::state_ccn_codes)
#>   [1] "AZ"   "AL"   "AK"   "AZ"   "AR"   "CA"   "CO"   "CT"   "DE"   "DC"  
#>  [11] "FL"   "GA"   "HI"   "ID"   "IL"   "IN"   "IA"   "KS"   "KY"   "LA"  
#>  [21] "ME"   "MD"   "MA"   "MI"   "MN"   "MS"   "MO"   "MT"   "NE"   "NV"  
#>  [31] "NH"   "NJ"   "NM"   "NY"   "NC"   "ND"   "OH"   "OK"   "OR"   "PA"  
#>  [41] "PR"   "RI"   "SC"   "SD"   "TN"   "TX"   "UT"   "VT"   "VI"   "VA"  
#>  [51] "WA"   "WV"   "WI"   "WY"   "ID"   "CA"   "CN"   "NY"   "WV"   "MX"  
#>  [61] "AS"   "GU"   "CNMI" "TX"   "FL"   "FL"   "KS"   "LA"   "OH"   "PA"  
#>  [71] "TX"   "CA"   "IA"   "MN"   "IL"   "MO"   "MD"   "CT"   "MA"   "NJ"  
#>  [81] "PR"   "GA"   "NC"   "SC"   "TN"   "AR"   "OK"   "CO"   "CA"   "OR"  
#>  [91] "WA"   "LA"   "NM"   "TX"   "FC"   "CA"   "CA"   "FL"   "LA"   "MI"  
#> [101] "MS"   "OH"   "PA"   "TN"   "TX"   "KY"   "WV"   "CA"  
state_name(ccn:::state_abbreviations)
#> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> 
#>   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA 
#> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> 
#>   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA 
#> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> 
#>   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA 
#> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> 
#>   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA   NA 
```
