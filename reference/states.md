# State Codes

Convert state codes to their abbreviations or full names.

## Usage

``` r
is_state(x)

extract_state(x)

state(x)

state_abbr(x)

state_name(x)
```

## Arguments

- x:

  character vector of state codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
(x <- sample(ccn::state_codes$code, 5L))
#> [1] "65" "42" "04" "88" "43"
is_state(x)
#> [1] TRUE TRUE TRUE TRUE TRUE
state_abbr(x)
#> [1] "GU" "SC" "AR" "TN" "SD"
state_name(x)
#> [1] "Guam"           "South Carolina" "Arkansas"       "Tennessee"     
#> [5] "South Dakota"  

extract_state(c("A5XXX", "14XXXXX"))
#> [1] "A5" "14"
state("A5XXX")
#> <ccn::State>
#>  @ code: chr "A5"
#>  @ abbr: chr "MS"
#>  @ name: chr "Mississippi"
```
