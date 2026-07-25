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
#> Warning: Unknown or uninitialised column: `region`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
state_office(abbr = "NY")
#> Warning: Unknown or uninitialised column: `office`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
state_abbr(code = c("00", "A5", "01", "99"))
#> [1] "AZ" "MS" "AL" "FC"
state_name(code = c("00", "A5", "01", "99"))
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
state(ccn = "A5XXX")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
state(ccn = "869999")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
