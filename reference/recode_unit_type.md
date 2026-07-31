# Recode Unit Facility Types

Recode Unit Facility Types

## Usage

``` r
recode_unit_type(x, as = c("abbr", "full", "infix", "eipps"))
```

## Arguments

- x:

  `<chr>` vector of CCN Unit facility type characters.

- as:

  `<chr>` format to return; one of:

  - `"abbr"`: unit abbreviation (default)

  - `"full"`: unit name

  - `"infix"`: unit parent ccn infix

  - `"eipps"`: is type IPPS-excluded?

## Value

`<chr>` vector of Unit facility type names/abbreviations/parent
infixes/IPPS exclusion statuses

## Examples

``` r
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
```
