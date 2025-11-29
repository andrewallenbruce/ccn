# CCN State Codes

From Section 2779A1: CCN for Medicare Providers (pgs. 403-404) (Rev.
226; Issued: 12-06-24; Effective: 12-06-24; Implementation: 12-06-24)

From Section 2779A1: CCN for Medicare Providers (pgs. 405-406) (Rev.
226; Issued: 12-06-24; Effective: 12-06-24; Implementation: 12-06-24)

From Section 2779B: CMS Certification Numbers for Medicaid Providers
(pgs. 407-408) (Rev. 123; Issued: 10-03-14; Effective: 10-03-14;
Implementation: 10-03-14)

From Section 2779B: CMS Certification Numbers for Medicaid Providers
(pgs. 407-408) (Rev. 123; Issued: 10-03-14; Effective: 10-03-14;
Implementation: 10-03-14)

From Section 2779B: CMS Certification Numbers for Medicaid Providers
(pgs. 407-408) (Rev. 123; Issued: 10-03-14; Effective: 10-03-14;
Implementation: 10-03-14)

## Usage

``` r
state_codes

medicare_ranges

medicaid_ranges

medicaid_types

medicaid_data
```

## Format

### `state_codes`

A data frame with 108 rows and 3 columns:

- code:

  State code

- abbr:

  State abbreviation

- name:

  State full name

### `medicare_ranges`

A data frame with 39 rows and 3 columns:

- range:

  Facility range

- abbr:

  Facility abbreviation

- desc:

  Facility description

### `medicaid_ranges`

A data frame with 7 rows and 3 columns:

- code:

  Facility type code

- range:

  Facility type range

- abbr:

  Facility type abbreviation

- desc:

  Facility type description

### `medicaid_types`

A data frame with 9 rows and 3 columns:

- code:

  Facility type code

- abbr:

  Facility type abbreviation

- desc:

  Facility type description

### `medicaid_data`

A data frame with 15 rows and 4 columns:

- code:

  Facility type code

- range:

  Facility type range

- abbr:

  Facility type abbreviation

- desc:

  Facility type description

## Source

<https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf>

## Examples

``` r
state_codes
#> # A tibble: 108 × 3
#>    code  abbr  name                
#>    <chr> <chr> <chr>               
#>  1 00    AZ    Arizona             
#>  2 01    AL    Alabama             
#>  3 02    AK    Alaska              
#>  4 03    AZ    Arizona             
#>  5 04    AR    Arkansas            
#>  6 05    CA    California          
#>  7 06    CO    Colorado            
#>  8 07    CT    Connecticut         
#>  9 08    DE    Delaware            
#> 10 09    DC    District of Columbia
#> # ℹ 98 more rows
medicare_ranges
#> # A tibble: 39 × 3
#>    range     abbr        desc                                                   
#>    <chr>     <chr>       <chr>                                                  
#>  1 0001-0879 ACUTE       Short-Term Hospital (General & Specialty)              
#>  2 0880-0899 ORD         Hospital Participating in ORD Demonstration Project    
#>  3 0900-0999 MHCMC (RET) Multiple Hospital Component in a Medical Complex (Reti…
#>  4 1000-1199 FQHC        Federally Qualified Health Center                      
#>  5 1200-1224 ADH (RET)   Alcohol-Drug Hospital (Retired)                        
#>  6 1225-1299 MAF         Medical Assistance Facility                            
#>  7 1300-1399 CAH         Critical Access Hospital                               
#>  8 1400-1499 CMHC        Community Mental Health Center                         
#>  9 1500-1799 HOSPICE     Hospice                                                
#> 10 1800-1989 FQHC        Federally Qualified Health Center                      
#> # ℹ 29 more rows
medicaid_ranges
#> # A tibble: 7 × 3
#>   range   abbr     desc                                         
#>   <chr>   <chr>    <chr>                                        
#> 1 001-099 ACUTE    Medicaid-Only Short-Term Acute Care Hospital 
#> 2 100-199 CHILD    Medicaid-Only Children's Hospital            
#> 3 200-299 CPH      Medicaid-Only Children's Psychiatric Hospital
#> 4 300-399 PSYCH    Medicaid-Only Psychiatric Hospital           
#> 5 400-499 REHAB    Medicaid-Only Rehabilitation Hospital        
#> 6 500-599 LTCH     Medicaid-Only Long-Term Hospital             
#> 7 600-999 RESERVED Reserved for Future Use                      
medicaid_types
#> # A tibble: 9 × 3
#>   code  abbr     desc                                                           
#>   <chr> <chr>    <chr>                                                          
#> 1 A     NF (SNF) Nursing Facility (Formerly Assigned to Medicaid Skilled Nursin…
#> 2 B     NF (SNF) Nursing Facility (Formerly Assigned to Medicaid Skilled Nursin…
#> 3 E     NF (ICF) Nursing Facility (Formerly Assigned to Intermediate Care Facil…
#> 4 F     NF (ICF) Nursing Facility (Formerly Assigned to Intermediate Care Facil…
#> 5 G     ICF-IID  Intermediate Care Facility for Individuals with Intellectual D…
#> 6 H     ICF-IID  Intermediate Care Facility for Individuals with Intellectual D…
#> 7 J     MCD HOSP Medicaid-Only Hospital                                         
#> 8 K     MCD HHA  Medicaid Home Health Agency                                    
#> 9 L     PRTF     Psychiatric Residential Treatment Facility                     
medicaid_data
#> # A tibble: 15 × 4
#>    code  range   abbr            desc                                           
#>    <chr> <chr>   <chr>           <chr>                                          
#>  1 A     001-999 NF (Fm SNF)     Nursing Facility (Formerly assigned to Medicai…
#>  2 B     001-999 NF (Fm SNF)     Nursing Facility (Formerly assigned to Medicai…
#>  3 E     001-999 NF (Fm ICF)     Nursing Facility (Formerly assigned to Interme…
#>  4 F     001-999 NF (Fm ICF)     Nursing Facility (Formerly assigned to Interme…
#>  5 G     001-999 ICF/IID         Intermediate Care Facility for Individuals wit…
#>  6 H     001-999 ICF/IID         Intermediate Care Facility for Individuals wit…
#>  7 J     001-099 MCD ACUTE       Medicaid-Only Short-Term Acute Care Hospital   
#>  8 J     100-199 MCD CHILD       Medicaid-Only Children’s Hospital              
#>  9 J     200-299 MCD CHILD PSYCH Medicaid-Only Children's Psychiatric Hospital  
#> 10 J     300-399 MCD PSYCH       Medicaid-Only Psychiatric Hospital             
#> 11 J     400-499 MCD REHAB       Medicaid-Only Rehabilitation Hospital          
#> 12 J     500-599 MCD LTCH        Medicaid-Only Long-Term Hospital               
#> 13 J     600-999 RESERVED        Reserved for Future Use                        
#> 14 K     001-999 MCD HHA         Medicaid Home Health Agency                    
#> 15 L     001-999 PRTF            Psychiatric Residential Treatment Facility     
```
