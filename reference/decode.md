# Decode a CCN

Decode a CCN into its component parts.

## Usage

``` r
decode(x)
```

## Arguments

- x:

  character vector of CCNs.

## Value

list of CCN components.

## Examples

``` r
decode("67P055")
#> <ccn::MedicareProviderCCN>
#>  @ ccn            : chr "67P055"
#>  @ state_code     : chr "67"
#>  @ sequence_number: chr "055"
#>  @ facility_type  : chr(0) 
decode("670055")
#> <ccn::MedicareProviderCCN>
#>  @ ccn            : chr "670055"
#>  @ state_code     : chr "67"
#>  @ sequence_number: chr "0055"
#>  @ facility_type  : chr(0) 
decode("21-0101")
#> <ccn::MedicareProviderCCN>
#>  @ ccn            : chr "210101"
#>  @ state_code     : chr "21"
#>  @ sequence_number: chr "0101"
#>  @ facility_type  : chr(0) 
decode("21-T101")
#> <ccn::MedicareProviderCCN>
#>  @ ccn            : chr "21T101"
#>  @ state_code     : chr "21"
#>  @ sequence_number: chr "T101"
#>  @ facility_type  : chr(0) 
decode("12345E")
#> <ccn::MedicareProviderCCN>
#>  @ ccn            : chr "12345E"
#>  @ state_code     : chr "12"
#>  @ sequence_number: chr "345E"
#>  @ facility_type  : chr(0) 
decode("12C4567890")
#> <ccn::SupplierCCN>
#>  @ ccn            : chr "12C4567890"
#>  @ state_code     : chr "12"
#>  @ sequence_number: chr "C4567890"
#>  @ supplier_type  : chr(0) 
decode("0-12C4567890")
#> <ccn::RawCCN>
#>  @ raw: chr "0-12C4567890"
#>  @ std: chr "012C4567890"
#>  @ chr: int 11
#>  @ vec: chr [1:11] "0" "1" "2" "C" "4" "5" "6" "7" "8" "9" "0"
```
