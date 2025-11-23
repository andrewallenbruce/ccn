# Parse CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
parse_excluded(x)

parse_medicaid_only(x)

parse_opo(x)

parse_medicare(x)

parse_emergency(x)

parse_supplier(x)

parse_excluded_unit(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
parse_medicare("670055")
#>                 ccn              entity               state            sequence 
#>            "670055" "Medicare Provider"                "67"              "0055" 
parse_opo("05P001")
#>                 ccn              entity               state                type 
#>            "05P001" "Medicare Provider"                "05"                 "P" 
#>            sequence 
#>               "001" 
parse_emergency("12345E")
#>                  ccn               entity                state 
#>             "12345E" "Emergency Hospital"                 "12" 
#>                 type             sequence 
#>                  "E"                "345" 
parse_supplier("10C0001062")
#>                 ccn              entity               state                type 
#>        "10C0001062" "Medicare Supplier"                "10"                 "C" 
#>            sequence 
#>           "0001062" 
parse_excluded("21T101")
#>                      ccn                   entity                    state 
#>                 "21T101" "IPPS Excluded Provider"                     "21" 
#>                     type                 sequence 
#>                      "T"                    "101" 
parse_excluded_unit("02TA01")
#>                 ccn              entity               state                type 
#>            "02TA01" "Medicare Supplier"                "02"                 "T" 
#>              parent            sequence 
#>                 "A"                "01" 
```
