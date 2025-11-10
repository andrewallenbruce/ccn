# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
get_emergency_hospital_name(x)

get_supplier_name(x)

get_state_abbr(x)

get_state_name(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
get_emergency_hospital_name(c("E", "F"))
#> [1] "ER (NF)" "ER (F)" 
get_supplier_name(c("C", "D", "X"))
#> [1] "ASC"  "CLIA" "XRAY"
get_state_abbr(ccn:::state_ccn_codes)
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
get_state_name(ccn:::state_abbreviations)
#>  [1] "Alaska"                                           
#>  [2] "Alabama"                                          
#>  [3] "Arkansas"                                         
#>  [4] "American Samoa"                                   
#>  [5] "Arizona"                                          
#>  [6] "California"                                       
#>  [7] "Canada"                                           
#>  [8] "Commonwealth of the Northern Marianas Islands"    
#>  [9] "Colorado"                                         
#> [10] "Connecticut"                                      
#> [11] "District of Columbia"                             
#> [12] "Delaware"                                         
#> [13] "Foreign Countries (exceptions: Canada and Mexico)"
#> [14] "Florida"                                          
#> [15] "Georgia"                                          
#> [16] "Guam"                                             
#> [17] "Hawaii"                                           
#> [18] "Iowa"                                             
#> [19] "Idaho"                                            
#> [20] "Illinois"                                         
#> [21] "Indiana"                                          
#> [22] "Kansas"                                           
#> [23] "Kentucky"                                         
#> [24] "Louisiana"                                        
#> [25] "Massachusetts"                                    
#> [26] "Maryland"                                         
#> [27] "Maine"                                            
#> [28] "Michigan"                                         
#> [29] "Minnesota"                                        
#> [30] "Missouri"                                         
#> [31] "Mississippi"                                      
#> [32] "Montana"                                          
#> [33] "Mexico"                                           
#> [34] "North Carolina"                                   
#> [35] "North Dakota"                                     
#> [36] "Nebraska"                                         
#> [37] "New Hampshire"                                    
#> [38] "New Jersey"                                       
#> [39] "New Mexico"                                       
#> [40] "Nevada"                                           
#> [41] "New York"                                         
#> [42] "Ohio"                                             
#> [43] "Oklahoma"                                         
#> [44] "Oregon"                                           
#> [45] "Pennsylvania"                                     
#> [46] "Puerto Rico"                                      
#> [47] "Rhode Island"                                     
#> [48] "South Carolina"                                   
#> [49] "South Dakota"                                     
#> [50] "Tennessee"                                        
#> [51] "Texas"                                            
#> [52] "Utah"                                             
#> [53] "Virginia"                                         
#> [54] "Virgin Islands"                                   
#> [55] "Vermont"                                          
#> [56] "Washington"                                       
#> [57] "Wisconsin"                                        
#> [58] "West Virginia"                                    
#> [59] "Wyoming"                                          
```
