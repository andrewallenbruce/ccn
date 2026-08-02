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
#> Error in index(x): could not find function "index"

tibble::tibble(
  subunit = x[index(x)$Subunit],
  parent = parent_subunit(x[index(x)$Subunit]))
#> Error in index(x): could not find function "index"
```
