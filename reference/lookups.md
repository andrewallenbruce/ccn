# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
state_codes

state_names

emergency_hospital_name(x)

supplier_name(x)

state_name(x)

state_abbr(x)
```

## Format

An object of class `character` of length 108.

An object of class `character` of length 59.

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
LETTERS[emergency_hospital_name(LETTERS)]
#>  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#> [26] NA
LETTERS[supplier_name(LETTERS)]
#>  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#> [26] NA
state_name(state_codes)
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
state_abbr(state_names)
#>  [1] "AL"   "AK"   "AS"   "AZ"   "AR"   "CA"   "CN"   "CO"   "CNMI" "CT"  
#> [11] "DE"   "DC"   "FL"   "FC"   "GA"   "GU"   "HI"   "ID"   "IL"   "IN"  
#> [21] "IA"   "KS"   "KY"   "LA"   "ME"   "MD"   "MA"   "MX"   "MI"   "MN"  
#> [31] "MS"   "MO"   "MT"   "NE"   "NV"   "NH"   "NJ"   "NM"   "NY"   "NC"  
#> [41] "ND"   "OH"   "OK"   "OR"   "PA"   "PR"   "RI"   "SC"   "SD"   "TN"  
#> [51] "TX"   "UT"   "VT"   "VI"   "VA"   "WA"   "WV"   "WI"   "WY"  
```
