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
#>  @ code: chr "A5"
#>  @ abbr: chr "MS"
#>  @ name: chr "Mississippi"
state(sample(ccn::state_codes$code, 5L)) # should only accept length 1
#> <ccn::State>
#>  @ code: chr [1:5] "82" "80" "01" "65" "54"
#>  @ abbr: chr [1:5] "MA" "MD" "AL" "GU" "ID"
#>  @ name: chr [1:5] "Massachusetts" "Maryland" "Alabama" "Guam" "Idaho"
```
