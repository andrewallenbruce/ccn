# IPPS-Excluded Hospital Units/Swing-Bed Approvals

Convert various codes to their associated names.

## Usage

``` r
excluded_abbr(x)

excluded_desc(x)

excluded_type(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
x <- c("M", "R", "S", "T", "U", "W", "Y", "Z")
excluded_abbr(x)
#> [1] "PSYCH (CAH)" "REHAB (CAH)" "PSYCH"       "REHAB"       "SBA (ACUTE)"
#> [6] "SBA (LTCH)"  "SBA (REHAB)" "SBA (CAH)"  
excluded_desc(c("E", "F"))
#> [1] NA NA
excluded_type("E")
#> <ccn::Type>
#>  @ code: chr "E"
#>  @ desc: chr NA
#>  @ abbr: chr NA
```
