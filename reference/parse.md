# Parse CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
parse_medicare_provider(x)

parse_eipps_unit(x)

parse_medicare_opo(x)

parse_emergency_hospital(x)

parse_medicare_supplier(x)

parse_medicaid_only_hospital(x)

parse_medicaid_only_facility(x)

parse_eipps_provider(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
parse_medicare_provider("670055")
#>                 ccn              entity               state            sequence 
#>            "670055" "Medicare Provider"                "67"              "0055" 
parse_medicare_opo("05P001")
#>                 ccn              entity               state                type 
#>            "05P001" "Medicare Provider"                "05"                 "P" 
#>            sequence 
#>               "001" 
parse_emergency_hospital("12345E")
#>                  ccn               entity                state 
#>             "12345E" "Emergency Hospital"                 "12" 
#>                 type             sequence 
#>                  "E"                "345" 
parse_medicare_supplier("10C0001062")
#>                 ccn              entity               state                type 
#>        "10C0001062" "Medicare Supplier"                "10"                 "C" 
#>            sequence 
#>           "0001062" 
parse_medicaid_only_hospital("A5J508")
#>                      ccn                   entity                    state 
#>                 "A5J508" "Medicaid-Only Provider"                     "A5" 
#>                     type                 sequence 
#>                      "J"                    "508" 
parse_medicaid_only_facility("23E301")
#>                      ccn                   entity                    state 
#>                 "23E301" "Medicaid-Only Provider"                     "23" 
#>                     type                 sequence 
#>                      "E"                    "301" 
parse_eipps_provider("21T101")
#>                      ccn                   entity                    state 
#>                 "21T101" "IPPS-Excluded Provider"                     "21" 
#>                     type                 sequence 
#>                      "T"                    "101" 
parse_eipps_unit("02TA01")
#>                  ccn               entity                state 
#>             "02TA01" "IPPS-Excluded Unit"                 "02" 
#>                 type               parent             sequence 
#>                  "T"                  "A"                 "01" 
```
