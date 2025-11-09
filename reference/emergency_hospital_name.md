# Emergency Hospital Codes

Convert emergency codes to standard emergency names.

## Usage

``` r
emergency_hospital_name(x)
```

## Arguments

- x:

  character vector of emergency codes.

## Value

character vector of emergency code names.

## Examples

``` r
emergency_hospital_name(c("E", "F"))
#> [1] "Non-Federal Emergency Hospital" "Federal Emergency Hospital"    
```
