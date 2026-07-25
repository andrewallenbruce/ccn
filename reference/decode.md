# Decode CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
decode(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicare`.

## Examples

``` r
x = c("670055", "21034E", "01L008", "01J008",
      "05P001", "21U101", "21TA26", "45D0634589")

purrr::map(x, decode)
#> Warning: Unknown or uninitialised column: `name`.
#> Error in purrr::map(x, decode): ℹ In index: 1.
#> Caused by error in `kit::vswitch()`:
#> ! Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
