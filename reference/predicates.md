# Logical Predicates

Logical tests for various code types

## Usage

``` r
is_medicaid_facility_type(x)

is_ipps_excluded_type(x)

is_emergency_hospital_code(x)

is_supplier_code(x)
```

## Arguments

- x:

  character vector of codes to test.

## Value

logical vector indicating if codes are of the specified type.

## Examples

``` r
is_medicaid_facility_type(LETTERS)
#>  [1]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [25] FALSE FALSE
is_ipps_excluded_type(LETTERS)
#>  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
#> [25] FALSE  TRUE
is_emergency_hospital_code(LETTERS)
#>  [1] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [25] FALSE FALSE
is_supplier_code(LETTERS)
#>  [1] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
#> [25] FALSE FALSE
```
