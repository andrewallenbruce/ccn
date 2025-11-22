# Facility Type Codes

Convert various codes to their associated names.

## Usage

``` r
is_type_supplier(x)

supplier_abbr(x)

supplier_desc(x)

type_supplier(x)

is_type_emergency(x)

emergency_abbr(x)

emergency_desc(x)

type_emergency(x)

is_type_opo(x)

opo_abbr(x)

opo_desc(x)

type_opo(x)

is_type_medicaid_only(x)

medicaid_only_abbr(x)

medicaid_only_desc(x)

type_medicaid_only(x)

is_type_ipps_excluded(x)

ipps_excluded_abbr(x)

ipps_excluded_desc(x)

type_ipps_excluded(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
x <- LETTERS

x[is_type_supplier(x)]
#> [1] "C" "D" "X"
supplier_abbr(x[is_type_supplier(x)])
#> [1] "ASC"  "CLIA" "XRAY"
supplier_desc(x[is_type_supplier(x)])
#> [1] "Ambulatory Surgical Center"                                          
#> [2] "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#> [3] "Portable X-Ray Facility"                                             
type_supplier("C")
#> <ccn::Type>
#>  @ code: chr "C"
#>  @ abbr: chr "ASC"
#>  @ desc: chr "Ambulatory Surgical Center"

x[is_type_emergency(x)]
#> [1] "E" "F"
emergency_abbr(c("E", "F"))
#> [1] "ER (NF)" "ER (F)" 
emergency_desc(c("E", "F"))
#> [1] "Non-Federal Emergency Hospital (Non-Participating)"
#> [2] "Federal Emergency Hospital (Non-Participating)"    
type_emergency("E")
#> <ccn::Type>
#>  @ code: chr "E"
#>  @ abbr: chr "ER (NF)"
#>  @ desc: chr "Non-Federal Emergency Hospital (Non-Participating)"

x[is_type_opo(x)]
#> [1] "P"
opo_abbr(x[is_type_opo(x)])
#> [1] "OPO"
opo_desc(x[is_type_opo(x)])
#> [1] "Organ Procurement Organization"
type_opo(x[is_type_opo(x)])
#> <ccn::Type>
#>  @ code: chr "P"
#>  @ abbr: chr "OPO"
#>  @ desc: chr "Organ Procurement Organization"

x[is_type_medicaid_only(x)]
#> [1] "A" "B" "E" "F" "G" "H" "J" "K" "L"
medicaid_only_abbr(x[is_type_medicaid_only(x)])
#> [1] "NF (SNF)" "NF (SNF)" "NF (ICF)" "NF (ICF)" "ICF-IID"  "ICF-IID"  "MCD HOSP"
#> [8] "MCD HHA"  "PRTF"    
medicaid_only_desc(x[is_type_medicaid_only(x)])
#> [1] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#> [2] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#> [3] "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"       
#> [4] "Nursing Facility (Formerly Assigned to Intermediate Care Facility)"       
#> [5] "Intermediate Care Facility for Individuals with Intellectual Disabilities"
#> [6] "Intermediate Care Facility for Individuals with Intellectual Disabilities"
#> [7] "Medicaid-Only Hospital"                                                   
#> [8] "Medicaid Home Health Agency"                                              
#> [9] "Psychiatric Residential Treatment Facility"                               
type_medicaid_only("A")
#> <ccn::Type>
#>  @ code: chr "A"
#>  @ abbr: chr "NF (SNF)"
#>  @ desc: chr "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"

x[is_type_ipps_excluded(x)]
#> [1] "M" "R" "S" "T" "U" "W" "Y" "Z"
ipps_excluded_abbr(x[is_type_ipps_excluded(x)])
#> [1] "PSYCH (CAH)" "REHAB (CAH)" "PSYCH"       "REHAB"       "SBA (ACUTE)"
#> [6] "SBA (LTCH)"  "SBA (REHAB)" "SBA (CAH)"  
ipps_excluded_desc(x[is_type_ipps_excluded(x)])
#> [1] "Psychiatric Unit of a Critical Access Hospital"                                        
#> [2] "Rehabilitation Unit of a Critical Access Hospital"                                     
#> [3] "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"   
#> [4] "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital"
#> [5] "Swing-Bed Approval for Short-Term Hospital"                                            
#> [6] "Swing-Bed Approval for Long-Term Care Hospital"                                        
#> [7] "Swing-Bed Approval for Rehabilitation Hospital"                                        
#> [8] "Swing-Bed Approval for Critical Access Hospital"                                       
type_ipps_excluded("M")
#> <ccn::Type>
#>  @ code: chr "M"
#>  @ abbr: chr "PSYCH (CAH)"
#>  @ desc: chr "Psychiatric Unit of a Critical Access Hospital"
```
