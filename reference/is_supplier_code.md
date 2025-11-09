# Supplier Types

Identify a Medicaid supplier type

## Usage

``` r
is_supplier_code(x)
```

## Arguments

- x:

  A character vector, length 1

## Value

A logical vector

## Examples

``` r
is_supplier_code(LETTERS)
#>  [1] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
#> [25] FALSE FALSE
```
