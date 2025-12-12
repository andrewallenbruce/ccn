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
#>  @ abbr: chr "MS"
#>  @ name: chr "Mississippi"
try(state(sample(ccn::state_codes$code, 5L))) # should only accept length 1
#> Error in state(sample(ccn::state_codes$code, 5L)) : 
#>   `str_ste(x)` must be length 1.
```
