# Logical Predicates

Logical tests for various code types

## Usage

``` r
type_medicaid(x)

type_excluded(x)

type_parent(x)

type_emergency(x)

type_supplier(x)

type_opo(x)
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
x[type_parent(x)]
#>  [1] "A" "B" "C" "D" "E" "F" "G" "H" "J" "K"
x[type_emergency(x)]
#> [1] "E" "F"
x[type_supplier(x)]
#> [1] "C" "D" "X"
x[type_opo(x)]
#> [1] "P"
```
