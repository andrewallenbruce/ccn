# Logical Predicates

Logical tests for various code types

## Usage

``` r
is_type_medicaid(x)

is_type_excluded(x)

is_type_unit(x)

is_type_emergency(x)

is_type_supplier(x)

is_type_opo(x)
```

## Arguments

- x:

  character vector of codes to test.

## Value

logical vector indicating if codes are of the specified type.

## Examples

``` r
x <- LETTERS
x[is_type_medicaid(x)]
#> [1] "A" "B" "E" "F" "G" "H" "J" "K" "L"
x[is_type_excluded(x)]
#> [1] "M" "R" "S" "T" "U" "W" "Y" "Z"
x[is_type_unit(x)]
#>  [1] "A" "B" "C" "D" "E" "F" "G" "H" "J" "K"
x[is_type_emergency(x)]
#> [1] "E" "F"
x[is_type_supplier(x)]
#> [1] "C" "D" "X"
x[is_type_opo(x)]
#> [1] "P"
```
