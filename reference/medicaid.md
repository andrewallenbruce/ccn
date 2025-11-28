# Medicaid-Only

Convert various codes to their associated names.

## Usage

``` r
medicaid_only_range(x)

medicaid_only_range_abbr(x)

medicaid_only_range_desc(x)

medicaid_only_sequence(x)

is_type_medicaid_only(x)

medicaid_only_type_abbr(x)

medicaid_only_type_desc(x)

medicaid_only_type(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
medicaid_only_range(150)
#> [1] "100-199"
medicaid_only_range_abbr("100-199")
#> [1] "CHILD"
medicaid_only_range_desc("100-199")
#> [1] "Medicaid-Only Children's Hospital"
medicaid_only_sequence("250")
#> <ccn::MedicaidOnlySequence>
#>  @ number: chr "250"
#>  @ range : chr "200-299"
#>  @ abbr  : chr "CPH"
#>  @ desc  : chr "Medicaid-Only Children's Psychiatric Hospital"
is_type_medicaid_only(c("A", "J", "L"))
#> [1] TRUE TRUE TRUE
medicaid_only_type_abbr(c("A", "J", "L"))
#> [1] "NF (SNF)" "MCD HOSP" "PRTF"    
medicaid_only_type_desc(c("A", "J", "L"))
#> [1] "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#> [2] "Medicaid-Only Hospital"                                                   
#> [3] "Psychiatric Residential Treatment Facility"                               
medicaid_only_type("A")
#> <ccn::MedicaidOnlyType>
#>  @ code: chr "A"
#>  @ desc: chr "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)"
#>  @ abbr: chr "NF (SNF)"
```
