# State Codes

Convert state codes to their abbreviations or full names.

## Usage

``` r
state(x)

states
```

## Format

### `states`

A data frame with 108 rows and 3 columns:

- code:

  State code

- abbr:

  State abbreviation

- name:

  State full name

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
