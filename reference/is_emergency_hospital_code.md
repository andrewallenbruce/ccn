# Supplier Types

Identify a Medicaid supplier type

## Usage

``` r
is_emergency_hospital_code(x)
```

## Arguments

- x:

  A character vector, length 1

## Value

A logical vector

## Examples

``` r
is_emergency_hospital_code(LETTERS)
#>  [1] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [25] FALSE FALSE
```
