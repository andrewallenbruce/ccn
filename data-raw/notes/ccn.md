CCN Notes
================
2025-11-12

> SEC 2779A, PG 403 (som107c02.pdf)

*Rev. 152, ISS: `03-25-16`, EFF: `04-04-16`, IMP: `04-04-16`*

**CCN** replaced the terms *Medicare Provider Number*, *Medicare
Identification Number* and *OSCAR Number* in 2007. It is used to verify
Medicare/Medicaid certification for survey and certification,
assessment-related activities and communications. Additionally, CMS data
systems use the CCN to identify each individual provider or supplier
that has or currently does participate in Medicare and/or Medicaid. The
RO, not the SA or MAC, assigns the CCN and maintains adequate controls.

## Medicare Providers

CCNs for Providers and Suppliers paid under *Medicare Part A* have **6
digits**.

The first 2 digits identify the State in which the provider is located.
The last 4 digits identify the type of facility.

The following is a list of all State Codes:

``` r
ccn:::STATE$CODE |> 
   ccn:::make_df(c("State", "Code")) |> 
   head(10) |> 
   knitr::kable()
```

| State | Code |
|:------|:-----|
| AK    | 02   |
| AL    | 01   |
| AR    | 04   |
| AR    | 89   |
| AS    | 64   |
| AZ    | 00   |
| AZ    | 03   |
| CA    | 05   |
| CA    | 55   |
| CA    | 75   |

The last 4 digits identify the facility type, sequentially from within
the following range:

``` r
ccn:::MEDICARE$ABBR |> 
   ccn:::make_df(c("Facility", "Range")) |> 
   head(10) |> 
   knitr::kable()
```

| Facility  | Range     |
|:----------|:----------|
| ADH (RET) | 1200-1224 |
| CAH       | 1300-1399 |
| CHILD     | 3300-3399 |
| CMHC      | 1400-1499 |
| CMHC      | 4600-4799 |
| CMHC      | 4900-4999 |
| CORF      | 3200-3299 |
| CORF      | 4500-4599 |
| CORF      | 4800-4899 |
| FQHC      | 1000-1199 |

*Examples*: **CMHCs in Florida**

``` r
ccn("681400")
```

    ## <ccn::MedicareProvider>
    ##  @ raw            : chr "681400"
    ##  @ std            : chr "681400"
    ##  @ chr            : int 6
    ##  @ vec            : chr [1:6] "6" "8" "1" "4" "0" "0"
    ##  @ ccn            : chr "681400"
    ##  @ state_code     : chr "68"
    ##  @ state_abbr     : chr "FL"
    ##  @ state_name     : chr "Florida"
    ##  @ sequence_number: chr "1400"
    ##  @ facility_range : chr "1400-1499"
    ##  @ facility_abbr  : chr "CMHC"
    ##  @ facility_name  : chr "Community Mental Health Center"

``` r
ccn("684702")
```

    ## <ccn::MedicareProvider>
    ##  @ raw            : chr "684702"
    ##  @ std            : chr "684702"
    ##  @ chr            : int 6
    ##  @ vec            : chr [1:6] "6" "8" "4" "7" "0" "2"
    ##  @ ccn            : chr "684702"
    ##  @ state_code     : chr "68"
    ##  @ state_abbr     : chr "FL"
    ##  @ state_name     : chr "Florida"
    ##  @ sequence_number: chr "4702"
    ##  @ facility_range : chr "4600-4799"
    ##  @ facility_abbr  : chr "CMHC"
    ##  @ facility_name  : chr "Community Mental Health Center"

``` r
ccn("691400")
```

    ## <ccn::MedicareProvider>
    ##  @ raw            : chr "691400"
    ##  @ std            : chr "691400"
    ##  @ chr            : int 6
    ##  @ vec            : chr [1:6] "6" "9" "1" "4" "0" "0"
    ##  @ ccn            : chr "691400"
    ##  @ state_code     : chr "69"
    ##  @ state_abbr     : chr "FL"
    ##  @ state_name     : chr "Florida"
    ##  @ sequence_number: chr "1400"
    ##  @ facility_range : chr "1400-1499"
    ##  @ facility_abbr  : chr "CMHC"
    ##  @ facility_name  : chr "Community Mental Health Center"

### Organ Procurement Organizations (OPOs)

OPOs are assigned a 6-digit alphanumeric CCN. The first 2 digits
identify the State Code. The third digit is the alpha character “P.” The
remaining 3 digits are the unique facility identifier.

``` r
ccn("68P040")
```

    ## <ccn::Provider>
    ##  @ raw            : chr "68P040"
    ##  @ std            : chr "68P040"
    ##  @ chr            : int 6
    ##  @ vec            : chr [1:6] "6" "8" "P" "0" "4" "0"
    ##  @ ccn            : chr "68P040"
    ##  @ state_code     : chr "68"
    ##  @ state_abbr     : chr "FL"
    ##  @ state_name     : chr "Florida"
    ##  @ sequence_number: chr ""

## Medicare Suppliers

> Section 2779A2, Page 407

*Rev. 198, ISS: `01-17-20`, EFF: `01-17-20`, IMP: `01-17-20`*

Suppliers that are paid by Part B carriers have a 10-digit alphanumeric
CCN. The first 2 digits identify the State in which the supplier is
located. The third digit is an alpha character that identifies the type
of facility. The remaining 7 digits are the unique facility identifier.

The following characters in the third position indicate:

- C - Ambulatory Surgical Centers
- D - Clinical Laboratory Improvement Amendments of 1988 (CLIA)
  Laboratories
- X - Portable X-Ray Facilities

The last 7 digits of the CCN for the above suppliers will be within the
number series `0000001-9999999`.

*Examples*:

``` r
# ASC
ccn("10C0001062")
```

    ## <ccn::Supplier>
    ##  @ raw            : chr "10C0001062"
    ##  @ std            : chr "10C0001062"
    ##  @ chr            : int 10
    ##  @ vec            : chr [1:10] "1" "0" "C" "0" "0" "0" "1" "0" "6" "2"
    ##  @ ccn            : chr "10C0001062"
    ##  @ state_code     : chr "10"
    ##  @ state_abbr     : chr "FL"
    ##  @ state_name     : chr "Florida"
    ##  @ sequence_number: chr "0001062"
    ##  @ supplier_type  : chr "C"
    ##  @ supplier_abbr  : chr "ASC"
    ##  @ supplier_name  : chr "Ambulatory Surgical Center"

``` r
# CLIA
ccn("45D0634589")
```

    ## <ccn::Supplier>
    ##  @ raw            : chr "45D0634589"
    ##  @ std            : chr "45D0634589"
    ##  @ chr            : int 10
    ##  @ vec            : chr [1:10] "4" "5" "D" "0" "6" "3" "4" "5" "8" "9"
    ##  @ ccn            : chr "45D0634589"
    ##  @ state_code     : chr "45"
    ##  @ state_abbr     : chr "TX"
    ##  @ state_name     : chr "Texas"
    ##  @ sequence_number: chr "0634589"
    ##  @ supplier_type  : chr "D"
    ##  @ supplier_abbr  : chr "CLIA"
    ##  @ supplier_name  : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
# Portable X-Ray
ccn("21X0009807")
```

    ## <ccn::Supplier>
    ##  @ raw            : chr "21X0009807"
    ##  @ std            : chr "21X0009807"
    ##  @ chr            : int 10
    ##  @ vec            : chr [1:10] "2" "1" "X" "0" "0" "0" "9" "8" "0" "7"
    ##  @ ccn            : chr "21X0009807"
    ##  @ state_code     : chr "21"
    ##  @ state_abbr     : chr "MD"
    ##  @ state_name     : chr "Maryland"
    ##  @ sequence_number: chr "0009807"
    ##  @ supplier_type  : chr "X"
    ##  @ supplier_abbr  : chr "XRAY"
    ##  @ supplier_name  : chr "Portable X-Ray Facility"

> **EXCEPTION:** As of the cost reporting period beginning on or after
> October 1, 2019, an IPPS-excluded hospital is no longer precluded from
> having an IPPS-excluded psychiatric and/or rehabilitation unit. See
> section 2779C and 2779C1 for additional CCN numbering detail.
> **Note:** An IPPS-excluded hospital may not have an IPPS-excluded unit
> of the same type (psychiatric or rehabilitation) as the hospital (for
> example, an Inpatient Rehabilitation Facility (IRF) may not have an
> IRF unit).
