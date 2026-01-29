# Suppliers

CCNs assigned to Medicare suppliers that are paid by Part B carriers

## Usage

``` r
supplier(x)
```

## Arguments

- x:

  `<character>` 10-position alphanumeric code.

## Value

S7 object of class `<Supplier>`.

## Details

Suppliers have a 10-digit alphanumeric CCN. The first 2 digits identify
the State in which the supplier is located. The third digit is an alpha
character that identifies the type of facility. The remaining 7 digits
are the unique facility identifier.

The RO (Regional Office) assigns the following alpha-characters in the
third position as indicated:

- `C`: Ambulatory Surgical Centers (ASC)

- `D`: Clinical Laboratory Improvement Amendments of 1988 Laboratories
  (CLIA)

- `X`: Portable X-Ray Facilities (PXRF)

## Examples

``` r
supplier("10C0001062")
#> <ccn::Supplier>
#>  @ ccn      : chr "10C0001062"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "FL"
#>  .. @ name  : chr "Florida"
#>  .. @ region: chr "IV"
#>  .. @ office: chr "Atlanta"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: chr NA
supplier("45D0634589")
#> <ccn::Supplier>
#>  @ ccn      : chr "45D0634589"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "TX"
#>  .. @ name  : chr "Texas"
#>  .. @ region: chr "VI"
#>  .. @ office: chr "Dallas"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "CLIA"
#>  .. @ desc: chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"
#>  @ extension: chr NA
supplier("21X0009807")
#> <ccn::Supplier>
#>  @ ccn      : chr "21X0009807"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "MD"
#>  .. @ name  : chr "Maryland"
#>  .. @ region: chr "III"
#>  .. @ office: chr "Philadelphia"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "PXRF"
#>  .. @ desc: chr "Portable X-Ray Facility"
#>  @ extension: chr NA
supplier("12C0001062")
#> <ccn::Supplier>
#>  @ ccn      : chr "12C0001062"
#>  @ state    : <ccn::State>
#>  .. @ abbr  : chr "HI"
#>  .. @ name  : chr "Hawaii"
#>  .. @ region: chr "IX"
#>  .. @ office: chr "San Francisco"
#>  @ range    : chr "0000001-9999999"
#>  @ type     : <ccn::Type>
#>  .. @ abbr: chr "ASC"
#>  .. @ desc: chr "Ambulatory Surgical Center"
#>  @ extension: chr NA
```
