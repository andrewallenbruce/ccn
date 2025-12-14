# State Codes

Convert state codes to their abbreviations or full names.

## Usage

``` r
# S3 method for class '`ccn::State`'
print(x, ...)

state(x)
```

## Arguments

- x:

  character vector of state codes to look up.

- ...:

  unused.

## Value

S7 object of class `State`.

## Examples

``` r
state("A5XXX")
#> <ccn::State>
#> abbr: MS
#> name: Mississippi
state(sample(ccn::state_codes$code, 1L))
#> <ccn::State>
#> abbr: MI
#> name: Michigan
```
