# Assemble Unit/Subunit Parent CCN

Assemble Unit/Subunit Parent CCN

## Usage

``` r
parent_unit(x)

parent_subunit(x)
```

## Arguments

- x:

  `<chr>` A vector of CCNs.

## Value

A `<chr>` vector of parent CCNs

## Examples

``` r
parent_unit(c("45S788", "25U050", "39S027", "34S155", "29Z307"))
#> [1] NA       "250050" NA       NA       "291307"
parent_subunit(c("21SA26", "21TA26", "02TA01", "04SD38", "52TA05"))
#> [1] "212026" "212026" "022001" "043038" "522005"

x = ccn(get_pin("ccn"))

tibble::tibble(
  unit = x[index(x)$Unit],
  parent = parent_unit(x[index(x)$Unit])) |>
  collapse::na_omit()
#> # A tibble: 1,695 × 2
#>    unit   parent
#>    <ccn>  <ccn> 
#>  1 01M307 011307
#>  2 01M308 011308
#>  3 01U007 010007
#>  4 01U012 010012
#>  5 01U021 010021
#>  6 01U034 010034
#>  7 01U044 010044
#>  8 01U045 010045
#>  9 01U046 010046
#> 10 01U049 010049
#> # ℹ 1,685 more rows

tibble::tibble(
  subunit = x[index(x)$Subunit],
  parent = parent_subunit(x[index(x)$Subunit]))
#> # A tibble: 49 × 2
#>    subunit parent
#>    <ccn>   <chr> 
#>  1 02TA01  022001
#>  2 04SD38  043038
#>  3 05TA46  052046
#>  4 06TA09  062009
#>  5 10TA09  102009
#>  6 10TA10  102010
#>  7 10TA15  102015
#>  8 10TA20  102020
#>  9 10TA24  102024
#> 10 10TA25  102025
#> # ℹ 39 more rows
```
