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
state(sample(ccn::state_codes$code, 1L))
#> <ccn::State>
#>  @ abbr: chr "OH"
#>  @ name: chr "Ohio"
```
