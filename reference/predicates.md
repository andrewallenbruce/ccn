# Logical Predicates

Logical tests for various code types

## Usage

``` r
is_medicaid_facility_type(x)

is_ipps_excluded_type(x)

is_emergency_hospital_type(x)

is_supplier_type(x)
```

## Arguments

- x:

  character vector of codes to test.

## Value

logical vector indicating if codes are of the specified type.

## Examples

``` r
x <- LETTERS
x[is_medicaid_facility_type(x)]
#> [1] "A" "B" "E" "F" "G" "H" "J" "K" "L"
x[is_ipps_excluded_type(x)]
#> [1] "M" "S" "T" "U" "W" "Z"
x[is_emergency_hospital_type(x)]
#> [1] "E" "F"
x[is_supplier_type(x)]
#> [1] "C" "D" "X"
```
