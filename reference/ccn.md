# Decode a CCN

Decode a CCN into its component parts.

## Usage

``` r
ccn(x)
```

## Arguments

- x:

  character vector of CCNs.

## Value

list of CCN components.

## Examples

``` r
ccn("67P055")
#> <ccn::Provider>
#>  @ raw            : chr "67P055"
#>  @ std            : chr "67P055"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "6" "7" "P" "0" "5" "5"
#>  @ ccn            : chr "67P055"
#>  @ state_code     : chr "67"
#>  @ state_abbr     : chr "TX"
#>  @ state_name     : chr "Texas"
#>  @ sequence_number: chr ""
ccn("670055")
#> <ccn::MedicareProvider>
#>  @ raw            : chr "670055"
#>  @ std            : chr "670055"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "6" "7" "0" "0" "5" "5"
#>  @ ccn            : chr "670055"
#>  @ state_code     : chr "67"
#>  @ state_abbr     : chr "TX"
#>  @ state_name     : chr "Texas"
#>  @ sequence_number: chr "0055"
#>  @ facility_range : chr "0001-0879"
#>  @ facility_abbr  : chr "STH"
#>  @ facility_name  : chr "Short-Term Hospital (General & Specialty)"
ccn("21-0101")
#> <ccn::MedicareProvider>
#>  @ raw            : chr "21-0101"
#>  @ std            : chr "210101"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "0" "1" "0" "1"
#>  @ ccn            : chr "210101"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "0101"
#>  @ facility_range : chr "0001-0879"
#>  @ facility_abbr  : chr "STH"
#>  @ facility_name  : chr "Short-Term Hospital (General & Specialty)"
ccn("21-T101")
#> <ccn::IPPSExcludedProvider>
#>  @ raw            : chr "21-T101"
#>  @ std            : chr "21T101"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "2" "1" "T" "1" "0" "1"
#>  @ ccn            : chr "21T101"
#>  @ state_code     : chr "21"
#>  @ state_abbr     : chr "MD"
#>  @ state_name     : chr "Maryland"
#>  @ sequence_number: chr "101"
#>  @ facility_type  : chr "T"
#>  @ parent_ccn     : chr "210101"
ccn("12345E")
#> <ccn::EmergencyHospital>
#>  @ raw            : chr "12345E"
#>  @ std            : chr "12345E"
#>  @ chr            : int 6
#>  @ vec            : chr [1:6] "1" "2" "3" "4" "5" "E"
#>  @ ccn            : chr "12345E"
#>  @ state_code     : chr "12"
#>  @ state_abbr     : chr "HI"
#>  @ state_name     : chr "Hawaii"
#>  @ sequence_number: chr "345"
#>  @ emergency_type : chr "E"
#>  @ emergency_abbr : chr "ERH-NF"
#>  @ emergency_name : chr "Non-Federal Emergency Hospital (Non-Participating)"
ccn("12C4567890")
#> <ccn::Supplier>
#>  @ raw            : chr "12C4567890"
#>  @ std            : chr "12C4567890"
#>  @ chr            : int 10
#>  @ vec            : chr [1:10] "1" "2" "C" "4" "5" "6" "7" "8" "9" "0"
#>  @ ccn            : chr "12C4567890"
#>  @ state_code     : chr "12"
#>  @ state_abbr     : chr "HI"
#>  @ state_name     : chr "Hawaii"
#>  @ sequence_number: chr "4567890"
#>  @ supplier_type  : chr "C"
#>  @ supplier_abbr  : chr "ASC"
#>  @ supplier_name  : chr "Ambulatory Surgical Center"
ccn("0-12C4567890")
#> <ccn::Unknown>
#>  @ raw: chr "0-12C4567890"
#>  @ std: chr "012C4567890"
#>  @ chr: int 11
#>  @ vec: chr [1:11] "0" "1" "2" "C" "4" "5" "6" "7" "8" "9" "0"
```
