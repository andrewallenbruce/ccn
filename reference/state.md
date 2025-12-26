# State Codes

Convert state codes to their abbreviations or full names.

## Usage

``` r
state(x)
```

## Arguments

- x:

  character vector of state codes to look up.

## Value

S7 object of class `State`.

## Examples

``` r
state("A5XXX")
#> <ccn::State>
#>  @ abbr  : chr "MS"
#>  @ name  : chr "Mississippi"
#>  @ region: chr "IV"
#>  @ office: chr "ATL"
state("00")
#> <ccn::State>
#>  @ abbr  : chr "AZ"
#>  @ name  : chr "Arizona"
#>  @ region: chr "IX"
#>  @ office: chr "SF"
```
