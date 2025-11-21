# State Codes, Abbreviations, and Names

Convert state codes to their abbreviations or full names.

## Usage

``` r
is_state_code(x)

get_state_code(x)

get_state_abbr(x)

get_state_name(x)
```

## Arguments

- x:

  character vector of state codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
get_state_code(c("A5XXX", "14XXXXX"))
#> [1] "A5" "14"

(x <- sample(ccn:::state_codes, 5L))
#> [1] "23" "82" "80" "01" "65"

all(is_state_code(x))
#> [1] TRUE

(x <- get_state_abbr(x))
#> [1] "MI" "MA" "MD" "AL" "GU"

get_state_name(x)
#> [1] "Michigan"      "Massachusetts" "Maryland"      "Alabama"      
#> [5] "Guam"         
```
