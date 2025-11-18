# Lookups for Various Codes

Convert various codes to their associated names.

## Usage

``` r
get_emergency_abbr(x)

get_emergency_name(x)

get_supplier_abbr(x)

get_supplier_name(x)

get_caid_abbr(x)

get_caid_name(x)

get_ipps_abbr(x)

get_ipps_name(x)

get_parent_prefix(x)

get_parent_abbr(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
c("E", "F") |>
get_emergency_abbr() |>
print() |>
get_emergency_name()
#> [1] "ER (NF)" "ER (F)" 
#> [1] "Non-Federal Emergency Hospital (Non-Participating)"
#> [2] "Federal Emergency Hospital (Non-Participating)"    

c("C", "D", "X") |>
get_supplier_abbr() |>
print() |>
get_supplier_name()
#> [1] "ASC"  "CLIA" "XRAY"
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             

c("A", "B", "E", "F", "G", "H", "J", "K", "L") |>
get_caid_abbr() |>
print() |>
get_caid_name()
#> [1] "NF (SNF)" "NF (SNF)" "NF (ICF)" "NF (ICF)" "ICF-IID"  "ICF-IID"  "MCD HOSP"
#> [8] "MCD HHA"  "PRTF"    
#> [1] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#> [2] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#> [3] "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"       
#> [4] "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"       
#> [5] "Intermediate Care Facility for Individuals with Intellectual Disabilities"
#> [6] "Intermediate Care Facility for Individuals with Intellectual Disabilities"
#> [7] "Medicaid-Only Hospital"                                                   
#> [8] "Medicaid Home Health Agency"                                              
#> [9] "Psychiatric Residential Treatment Facility"                               

c("M", "R", "S", "T", "U", "W", "Y", "Z") |>
get_ipps_abbr() |>
print() |>
get_ipps_name()
#> [1] "PSYCH (CAH)" "REHAB (CAH)" "PSYCH"       "REHAB"       "SBA (STH)"  
#> [6] "SBA (LTCH)"  "SBA (REHAB)" "SBA (CAH)"  
#> [1] "Psychiatric Unit of a Critical Access Hospital"                                        
#> [2] "Rehabilitation Unit of a Critical Access Hospital"                                     
#> [3] "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"   
#> [4] "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#> [5] "Swing-Bed Approval for Short-Term Hospital"                                            
#> [6] "Swing-Bed Approval for Long-Term Care Hospital"                                        
#> [7] "Swing-Bed Approval for Rehabilitation Hospital"                                        
#> [8] "Swing-Bed Approval for Critical Access Hospital"                                       
```
