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
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
get_emergency_abbr(c("E", "F")) |>
print() |>
get_emergency_name()
#> [1] "ERH-NF" "ERH-F" 
#> [1] "Non-Federal Emergency Hospital (Non-Participating)"
#> [2] "Federal Emergency Hospital (Non-Participating)"    

get_supplier_abbr(c("C", "D", "X")) |>
print() |>
get_supplier_name()
#> [1] "ASC"  "CLIA" "XRAY"
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             

get_caid_abbr(LETTERS[1:12]) |>
print() |>
get_caid_name()
#>  [1] "NF (SNF)" "NF (SNF)" NA         NA         "NF (ICF)" "NF (ICF)"
#>  [7] "ICF-IID"  "ICF-IID"  NA         "MCD HOSP" "MCD HHA"  "PRTF"    
#>  [1] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#>  [2] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#>  [3] NA                                                                         
#>  [4] NA                                                                         
#>  [5] "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"       
#>  [6] "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"       
#>  [7] "Intermediate Care Facility for Individuals with Intellectual Disabilities"
#>  [8] "Intermediate Care Facility for Individuals with Intellectual Disabilities"
#>  [9] NA                                                                         
#> [10] "Medicaid-Only Hospital"                                                   
#> [11] "Medicaid Home Health Agency"                                              
#> [12] "Psychiatric Residential Treatment Facility"                               
```
