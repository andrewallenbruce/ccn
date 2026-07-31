# Recode CMS Facility Ranges

Recode CMS Facility Ranges

## Usage

``` r
recode_medicare_range(x, as = c("abbr", "full", "range"))

recode_medicaid_range(x, as = c("abbr", "full", "range"))
```

## Arguments

- x:

  `<int>` vector of CCN facility ranges.

- as:

  `<chr>` format to return; one of:

  - `"abbr"`: facility range abbreviation (default)

  - `"full"`: facility range full description

  - `"range"`: facility range text representation

## Value

`<chr>` vector of CMS facility range information

## Examples

``` r
tibble::tibble(
  x = ccn::medicare_ranges[["start"]],
  abbr = recode_medicare_range(x, "abbr"),
  range = recode_medicare_range(x, "range"),
  facility = recode_medicare_range(x, "full")
)
#> # A tibble: 43 × 4
#>        x abbr    range     facility                                             
#>    <int> <chr>   <chr>     <chr>                                                
#>  1     1 Acute   0001-0879 Short-Term Hospital (General & Specialty)            
#>  2   880 OCM     0880-0899 Hospital in Oncology Care Model Demonstration Project
#>  3   900 MHCMC   0900-0999 Multiple Hospital Component in a Medical Complex (Re…
#>  4  1000 FQHC    1000-1199 Federally Qualified Health Center                    
#>  5  1200 ADH     1200-1224 Alcohol-Drug Hospital (Retired)                      
#>  6  1225 MAF     1225-1299 Medical Assistance Facility                          
#>  7  1300 CAH     1300-1399 Critical Access Hospital                             
#>  8  1400 CMHC    1400-1499 Community Mental Health Center                       
#>  9  1500 Hospice 1500-1799 Hospice                                              
#> 10  1800 FQHC    1800-1989 Federally Qualified Health Center                    
#> # ℹ 33 more rows

tibble::tibble(
  x = ccn::medicare_ranges[["start"]],
  abbr = recode_medicaid_range(x, "abbr"),
  range = recode_medicaid_range(x, "range"),
  facility = recode_medicaid_range(x, "full")
)
#> # A tibble: 43 × 4
#>        x abbr     range   facility                      
#>    <int> <chr>    <chr>   <chr>                         
#>  1     1 Acute    001-099 Short-Term Acute Care Hospital
#>  2   880 Reserved 600-999 Reserved for Future Use       
#>  3   900 Reserved 600-999 Reserved for Future Use       
#>  4  1000 NA       NA      NA                            
#>  5  1200 NA       NA      NA                            
#>  6  1225 NA       NA      NA                            
#>  7  1300 NA       NA      NA                            
#>  8  1400 NA       NA      NA                            
#>  9  1500 NA       NA      NA                            
#> 10  1800 NA       NA      NA                            
#> # ℹ 33 more rows
```
