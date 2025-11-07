# IPPS-Excluded Types

Identify an IPPS-excluded type

## Usage

``` r
is_ipps_excluded_type(x)
```

## Arguments

- x:

  character vector

## Value

logical vector

## Examples

``` r
is_ipps_excluded_type(LETTERS)
#>  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
#> [25] FALSE  TRUE
```
