# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
get_emergency_abbr(x)

get_emergency_name(x)

get_supplier_abbr(x)

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
get_emergency_abbr(c("E", "F"))
#> [1] "ERH-NF" "ERH-F" 
get_supplier_abbr(c("C", "D", "X"))
#> [1] "ASC"  "CLIA" "XRAY"
get_state_abbr(ccn:::state_codes)
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

get_emergency_name(get_emergency_abbr(c("E", "F")))
#> [1] "Non-Federal Emergency Hospital (Non-Participating)"
#> [2] "Federal Emergency Hospital (Non-Participating)"    
get_supplier_name(get_supplier_abbr(c("C", "D", "X")))
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             
get_state_name(get_state_abbr(ccn:::state_codes))
#>   [1] "Arizona"                                          
#>   [2] "Alabama"                                          
#>   [3] "Alaska"                                           
#>   [4] "Arizona"                                          
#>   [5] "Arkansas"                                         
#>   [6] "California"                                       
#>   [7] "Colorado"                                         
#>   [8] "Connecticut"                                      
#>   [9] "Delaware"                                         
#>  [10] "District of Columbia"                             
#>  [11] "Florida"                                          
#>  [12] "Georgia"                                          
#>  [13] "Hawaii"                                           
#>  [14] "Idaho"                                            
#>  [15] "Illinois"                                         
#>  [16] "Indiana"                                          
#>  [17] "Iowa"                                             
#>  [18] "Kansas"                                           
#>  [19] "Kentucky"                                         
#>  [20] "Louisiana"                                        
#>  [21] "Maine"                                            
#>  [22] "Maryland"                                         
#>  [23] "Massachusetts"                                    
#>  [24] "Michigan"                                         
#>  [25] "Minnesota"                                        
#>  [26] "Mississippi"                                      
#>  [27] "Missouri"                                         
#>  [28] "Montana"                                          
#>  [29] "Nebraska"                                         
#>  [30] "Nevada"                                           
#>  [31] "New Hampshire"                                    
#>  [32] "New Jersey"                                       
#>  [33] "New Mexico"                                       
#>  [34] "New York"                                         
#>  [35] "North Carolina"                                   
#>  [36] "North Dakota"                                     
#>  [37] "Ohio"                                             
#>  [38] "Oklahoma"                                         
#>  [39] "Oregon"                                           
#>  [40] "Pennsylvania"                                     
#>  [41] "Puerto Rico"                                      
#>  [42] "Rhode Island"                                     
#>  [43] "South Carolina"                                   
#>  [44] "South Dakota"                                     
#>  [45] "Tennessee"                                        
#>  [46] "Texas"                                            
#>  [47] "Utah"                                             
#>  [48] "Vermont"                                          
#>  [49] "Virgin Islands"                                   
#>  [50] "Virginia"                                         
#>  [51] "Washington"                                       
#>  [52] "West Virginia"                                    
#>  [53] "Wisconsin"                                        
#>  [54] "Wyoming"                                          
#>  [55] "Idaho"                                            
#>  [56] "California"                                       
#>  [57] "Canada"                                           
#>  [58] "New York"                                         
#>  [59] "West Virginia"                                    
#>  [60] "Mexico"                                           
#>  [61] "American Samoa"                                   
#>  [62] "Guam"                                             
#>  [63] "Commonwealth of the Northern Marianas Islands"    
#>  [64] "Texas"                                            
#>  [65] "Florida"                                          
#>  [66] "Florida"                                          
#>  [67] "Kansas"                                           
#>  [68] "Louisiana"                                        
#>  [69] "Ohio"                                             
#>  [70] "Pennsylvania"                                     
#>  [71] "Texas"                                            
#>  [72] "California"                                       
#>  [73] "Iowa"                                             
#>  [74] "Minnesota"                                        
#>  [75] "Illinois"                                         
#>  [76] "Missouri"                                         
#>  [77] "Maryland"                                         
#>  [78] "Connecticut"                                      
#>  [79] "Massachusetts"                                    
#>  [80] "New Jersey"                                       
#>  [81] "Puerto Rico"                                      
#>  [82] "Georgia"                                          
#>  [83] "North Carolina"                                   
#>  [84] "South Carolina"                                   
#>  [85] "Tennessee"                                        
#>  [86] "Arkansas"                                         
#>  [87] "Oklahoma"                                         
#>  [88] "Colorado"                                         
#>  [89] "California"                                       
#>  [90] "Oregon"                                           
#>  [91] "Washington"                                       
#>  [92] "Louisiana"                                        
#>  [93] "New Mexico"                                       
#>  [94] "Texas"                                            
#>  [95] "Foreign Countries (exceptions: Canada and Mexico)"
#>  [96] "California"                                       
#>  [97] "California"                                       
#>  [98] "Florida"                                          
#>  [99] "Louisiana"                                        
#> [100] "Michigan"                                         
#> [101] "Mississippi"                                      
#> [102] "Ohio"                                             
#> [103] "Pennsylvania"                                     
#> [104] "Tennessee"                                        
#> [105] "Texas"                                            
#> [106] "Kentucky"                                         
#> [107] "West Virginia"                                    
#> [108] "California"                                       
```
