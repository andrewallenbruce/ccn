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
#> [1] "54" "42" "65" "B1" "04"
is_state(x)
#> [1] TRUE TRUE TRUE TRUE TRUE
state_abbr(x)
#> [1] "ID" "SC" "GU" "WV" "AR"
state_name(x)
#> [1] "Idaho"          "South Carolina" "Guam"           "West Virginia" 
#> [5] "Arkansas"      

extract_state(c("A5XXX", "14XXXXX"))
#> [1] "A5" "14"
state("A5XXX")
#> <ccn::State>
#>  @ code: chr "A5"
#>  @ abbr: chr "MS"
#>  @ name: chr "Mississippi"
```
