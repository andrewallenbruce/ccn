# Medicaid Facility Types

Identify a Medicaid facility type

## Usage

``` r
is_medicaid_facility_type(x)
```

## Arguments

- x:

  A character vector, length 1

## Value

A logical vector

## Examples

``` r
is_medicaid_facility_type(LETTERS)
#>  [1]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [25] FALSE FALSE
```
