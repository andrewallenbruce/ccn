# State Code Conversions

Convert CCN state codes to their abbreviations or full names. Convert
state abbreviations to their RO region or office (city).

## Usage

``` r
state_abbr(code)

state_name(code)

state_region(abbr)

state_office(abbr)

state(ccn)
```

## Arguments

- code:

  character vector of 2-character CCN state codes.

- abbr:

  character vector of 2-character state abbreviations.

- ccn:

  6-character CCN code.

## Value

S7 object of class `State`.

## Examples

``` r
state_region(abbr = "CA")
#> [1] "IX"
state_office(abbr = "NY")
#> [1] "New York City"
state_abbr(code = c("00", "A5", "01", "99"))
#> [1] "AZ" "MS" "AL" "FC"
state_name(code = c("00", "A5", "01", "99"))
#> [1] "Arizona"         "Mississippi"     "Alabama"         "Foreign Country"
state(ccn = "A5XXX")
#> <ccn::State>
#>  @ abbr  : chr "MS"
#>  @ name  : chr "Mississippi"
#>  @ region: chr "IV"
#>  @ office: chr "Atlanta"
state(ccn = "869999")
#> <ccn::State>
#>  @ abbr  : chr "NC"
#>  @ name  : chr "North Carolina"
#>  @ region: chr "IV"
#>  @ office: chr "Atlanta"
```
