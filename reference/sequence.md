# Sequence Class and Constructors

Convert various codes to their associated names.

## Usage

``` r
sequence_medicare(x)

sequence_medicaid_only(x)

sequence_supplier(x)

sequence_emergency(x)

sequence_opo(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
sequence_medicare("0055")
#> <ccn::Sequence>
#>  @ number: chr "0055"
#>  @ range : chr "0001-0879"
#>  @ abbr  : chr "ACUTE"
#>  @ desc  : chr "Short-Term Hospital (General & Specialty)"
sequence_medicaid_only("232")
#> <ccn::Sequence>
#>  @ number: chr "232"
#>  @ range : chr "200-299"
#>  @ abbr  : chr "CPH"
#>  @ desc  : chr "Medicaid-Only Children's Psychiatric Hospital"
sequence_supplier("9000000")
#> <ccn::Sequence>
#>  @ number: chr "9000000"
#>  @ range : chr "0000001-9999999"
#>  @ abbr  : chr NA
#>  @ desc  : chr NA
sequence_emergency("500")
#> <ccn::Sequence>
#>  @ number: chr "500"
#>  @ range : chr "001-999"
#>  @ abbr  : chr NA
#>  @ desc  : chr NA
sequence_opo("50")
#> <ccn::Sequence>
#>  @ number: chr "50"
#>  @ range : chr "001-099"
#>  @ abbr  : chr NA
#>  @ desc  : chr NA
```
