# Emergency Hospital

Convert various codes to their associated names.

## Usage

``` r
is_type_emergency(x)

emergency_abbr(x)

emergency_desc(x)

emergency_type(x)

emergency_sequence(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
is_type_emergency(c("E", "F"))
#> [1] TRUE TRUE
emergency_abbr(c("E", "F"))
#> [1] "ER (NF)" "ER (F)" 
emergency_desc(c("E", "F"))
#> [1] "Non-Federal Emergency Hospital (Non-Participating)"
#> [2] "Federal Emergency Hospital (Non-Participating)"    
emergency_type("E")
#> <ccn::Type>
#>  @ code: chr "E"
#>  @ desc: chr "Non-Federal Emergency Hospital (Non-Participating)"
#>  @ abbr: chr "ER (NF)"
```
