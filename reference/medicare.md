# Medicare Provider Ranges

Convert various codes to their associated names.

## Usage

``` r
medicare_range(x)

medicare_range_abbr(x)

medicare_range_desc(x)

medicare_sequence(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
medicare_range("9000")
#> [1] "9000-9799"
medicare_range_abbr("9000-9799")
#> [1] "HHA"
medicare_range_desc("9000-9799")
#> [1] "Home Health Agency"
medicare_sequence("9000")
#> <ccn::MedicareSequence>
#>  @ number: chr "9000"
#>  @ range : chr "9000-9799"
#>  @ abbr  : chr "HHA"
#>  @ desc  : chr "Home Health Agency"
```
