# Recode CMS Facility Types

Recode CMS Facility Types

## Usage

``` r
recode_medicaid_type(x, as = c("abbr", "full"))

recode_unit_type(x, as = c("abbr", "full", "infix", "eipps"))

recode_subunit_type(x, as = c("prefix", "abbr"))

recode_other_type(x, as = c("abbr", "full"))
```

## Arguments

- x:

  `<chr>` vector of CCN facility type characters.

- as:

  `<chr>` format to return; one of:

  For `recode_medicaid_type()`:

  - `"abbr"`: facility type abbreviation (default)

  - `"full"`: facility type name

  For `recode_unit_type()`:

  - `"abbr"`: unit abbreviation (default)

  - `"full"`: unit name

  - `"infix"`: unit parent ccn infix

  - `"eipps"`: is type IPPS-excluded?

  For `recode_subunit_type()`:

  - `"prefix"`: subunit parent ccn infix (default)

  - `"abbr"`: subunit abbreviation

  For `recode_other_type()`:

  - `"abbr"`: facility type abbreviation (default)

  - `"full"`: facility type name

## Value

`<chr>` vector of facility type names/abbreviations

## Examples

``` r
tibble::tibble(
  x = ccn::medicaid_types[["code"]],
  abbr = recode_medicaid_type(x, "abbr"),
  full = recode_medicaid_type(x, "full")
)
#> # A tibble: 10 × 3
#>    x     abbr  full                                      
#>    <chr> <chr> <chr>                                     
#>  1 A     SNF   Skilled Nursing Facility                  
#>  2 B     SNF   Skilled Nursing Facility                  
#>  3 E     SNF   Skilled Nursing Facility                  
#>  4 F     SNF   Skilled Nursing Facility                  
#>  5 G     ICF   Intermediate Care Facility                
#>  6 H     ICF   Intermediate Care Facility                
#>  7 J     MOH   Medicaid-Only Hospital                    
#>  8 K     HHA   Home Health Agency                        
#>  9 L     PRTF  Psychiatric Residential Treatment Facility
#> 10 NA    NA    NA                                        

tibble::tibble(
  x = ccn::unit_types[["code"]],
  abbr = recode_unit_type(x, "abbr"),
  full = recode_unit_type(x, "full"),
  infix = recode_unit_type(x, "infix"),
  eipps = recode_unit_type(x, "eipps"),
)
#> # A tibble: 10 × 5
#>    x     abbr          full                       infix eipps
#>    <chr> <chr>         <chr>                      <chr> <lgl>
#>  1 M     Psych (CAH)   Psychiatric Unit (CAH)     "1"   TRUE 
#>  2 R     Rehab (CAH)   Rehabilitation Unit (CAH)  "1"   TRUE 
#>  3 S     Psych         Psychiatric Unit           ""    TRUE 
#>  4 T     Rehab         Rehabilitation Unit        ""    TRUE 
#>  5 U     Swing (Acute) Swing-Bed Approval (Acute) "0"   FALSE
#>  6 V     ADU           Alcohol-Drug Unit          ""    TRUE 
#>  7 W     Swing (LTC)   Swing-Bed Approval (LTC)   "2"   FALSE
#>  8 Y     Swing (IRF)   Swing-Bed Approval (IRF)   "3"   FALSE
#>  9 Z     Swing (CAH)   Swing-Bed Approval (CAH)   "1"   FALSE
#> 10 NA    NA            NA                          NA   NA   

tibble::tibble(
  x = ccn::subunit_types[["code"]],
  prefix = recode_subunit_type(x, "prefix"),
  abbr = recode_subunit_type(x, "abbr")
)
#> # A tibble: 11 × 3
#>    x     prefix abbr 
#>    <chr> <chr>  <chr>
#>  1 A     20     LTCH 
#>  2 B     21     LTCH 
#>  3 C     22     LTCH 
#>  4 D     30     IRF  
#>  5 E     33     Child
#>  6 F     40     Psych
#>  7 G     41     Psych
#>  8 H     42     Psych
#>  9 J     43     Psych
#> 10 K     44     Psych
#> 11 NA    NA     NA   

tibble::tibble(
  x = c("C", "D", "E", "F", "P", "X"),
  abbr = recode_other_type(x, "abbr"),
  full = recode_other_type(x, "full")
)
#> # A tibble: 6 × 3
#>   x     abbr  full                            
#>   <chr> <chr> <chr>                           
#> 1 C     ASC   Ambulatory Surgical Center      
#> 2 D     CLIA  Clinical Laboratory             
#> 3 E     ERN   Emergency Hospital (Non-Federal)
#> 4 F     ERF   Emergency Hospital (Federal)    
#> 5 P     OPO   Organ Procurement Organization  
#> 6 X     PXRF  Portable X-Ray Facility         
```
