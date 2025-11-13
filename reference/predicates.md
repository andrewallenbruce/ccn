# Logical Predicates

Logical tests for various code types

## Usage

``` r
type_medicaid(x)

type_excluded(x)

type_emergency(x)

type_supplier(x)

type_opo(x)

is_state_code(x)
```

## Arguments

- x:

  character vector of codes to test.

## Value

logical vector indicating if codes are of the specified type.

## Examples

``` r
x <- LETTERS
x[type_medicaid(x)]
#> [1] "A" "B" "E" "F" "G" "H" "J" "K" "L"
x[type_excluded(x)]
#> [1] "M" "R" "S" "T" "U" "W" "Y" "Z"
x[type_emergency(x)]
#> [1] "E" "F"
x[type_supplier(x)]
#> [1] "C" "D" "X"
x[type_opo(x)]
#> [1] "P"
all(is_state_code(ccn:::state_codes))
#> [1] TRUE
```
