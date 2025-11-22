# State Codes

Convert state codes to their abbreviations or full names.

## Usage

``` r
is_state_code(x)

state_code(x)

state_abbr(x)

state_name(x)

state(x)
```

## Arguments

- x:

  character vector of state codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
state("A5XXX")
#> <ccn::State>
#>  @ code: chr "A5"
#>  @ abbr: chr "MS"
#>  @ name: chr "Mississippi"
state_code(c("A5XXX", "14XXXXX"))
#> [1] "A5" "14"


(x <- sample(ccn:::state_codes, 5L))
#> [1] "A6" "76" "72" "04" "23"

is_state_code(x)
#> [1] TRUE TRUE TRUE TRUE TRUE

(x <- state_abbr(x))
#> [1] "OH" "IA" "OH" "AR" "MI"

state_name(x)
#> [1] "Ohio"      "Iowa"      "Ohio"      "Arkansas"  "Minnesota"
```
