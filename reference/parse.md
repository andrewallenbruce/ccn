# Parse CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
parse(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
parse("670055")
#> <parsed:medicare>
#>      ccn: 670055
#>    state: 67
#> sequence: 0055
parse("05P001")
#> <parsed:organ>
#>      ccn: 05P001
#>    state: 05
#>     type: P
#> sequence: 001
parse("12345E")
#> <parsed:emergency>
#>      ccn: 12345E
#>    state: 12
#> sequence: 345
#>     type: E
parse("10C0001062")
#> <parsed:supplier>
#>      ccn: 10C0001062
#>    state: 10
#>     type: C
#> sequence: 0001062
parse("A5J508")
#> <parsed:medicaid>
#>      ccn: A5J508
#>    state: A5
#>     type: J
#> sequence: 508
parse("21T101")
#> <parsed:unit>
#>      ccn: 21T101
#>    state: 21
#>     type: T
#> sequence: 101
parse("02TA01")
#> <parsed:subunit>
#>      ccn: 02TA01
#>    state: 02
#>     type: T
#>   parent: A
#> sequence: 01
parse("240019A")
#> <parsed:medicare>
#>       ccn: 240019
#>     state: 24
#>  sequence: 0019
#> extension: A
parse("330125001")
#> <parsed:medicare>
#>       ccn: 330125
#>     state: 33
#>  sequence: 0125
#> extension: 001
parse("000000000")
#> <parsed:medicare>
#>       ccn: 000000
#>     state: 00
#>  sequence: 0000
#> extension: 000
parse("00000000000000")
#> <parsed:supplier>
#>       ccn: 0000000000
#>     state: 00
#>      type: 0
#>  sequence: 0000000
#> extension: 0000
```
