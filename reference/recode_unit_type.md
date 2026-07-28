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
  x = c("M", "T", "Z"),
  abbr = recode_unit_type(x, "abbr"),
  full = recode_unit_type(x, "full"),
  infix = recode_unit_type(x, "infix"),
  eipps = recode_unit_type(x, "eipps"),
)
#> # A tibble: 3 × 5
#>   x     abbr        full                     infix eipps
#>   <chr> <chr>       <chr>                    <chr> <lgl>
#> 1 M     Psych (CAH) Psychiatric Unit (CAH)   "1"   TRUE 
#> 2 T     Rehab       Rehabilitation Unit      ""    TRUE 
#> 3 Z     Swing (CAH) Swing-Bed Approval (CAH) "1"   FALSE
```
