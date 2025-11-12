Numbering System for CCNs
================
Andrew Bruce
2025-11-12

> Section 2779A, Page 403 (som107c02.pdf)

*Rev. 152, Issued: `03-25-16`, Effective: `04-04-16`, Implementation:
`04-04-16`*

Effective in 2007, the CCN replaced the terms *Medicare Provider
Number*, *Medicare Identification Number* or *OSCAR Number*. The CCN is
used to verify Medicare/Medicaid certification for survey and
certification, assessment-related activities and communications.
Additionally, CMS data systems use the CCN to identify each individual
provider or supplier that has or currently does participate in Medicare
and/or Medicaid. The RO, not the SA or MAC, assigns the CCN and
maintains adequate controls.

## CCN for Medicare Providers

The CCN for providers and suppliers paid under Medicare Part A have 6
digits. The first 2 digits identify the State in which the provider is
located. The last 4 digits identify the type of facility.

Following is a list of all State Codes:

``` r
ccn:::make_df(ccn:::STATE$CODE, c("state", "code")) |> 
  head() |> 
  knitr::kable()
```

| state | code |
|:------|:-----|
| AK    | 02   |
| AL    | 01   |
| AR    | 04   |
| AR    | 89   |
| AS    | 64   |
| AZ    | 00   |

Assign the last 4 digits, which identify the facility type, sequentially
from within the appropriate CCN range. In a State that has more than one
State code and/or a facility type that has more than one CCN range
available, ensure that all the numbers available in one CCN range have
been assigned before implementing the use of a new State code or numbers
in a new CCN range.

Examples: CMHCs in Florida

``` r
ccn("681400")
```

    ## <ccn::MedicareProvider>
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
    ##  @ ccn            : chr "691400"
    ##  @ state_code     : chr "69"
    ##  @ state_abbr     : chr "FL"
    ##  @ state_name     : chr "Florida"
    ##  @ sequence_number: chr "1400"
    ##  @ facility_range : chr "1400-1499"
    ##  @ facility_abbr  : chr "CMHC"
    ##  @ facility_name  : chr "Community Mental Health Center"

> **NOTE:** Once the remaining pool of two digit State numeric codes are
> exhausted, CMS will implement a two digit alpha-numeric code system
> for State Codes. For example: A0, A1, A2,… B0, B1, B2,…, Z8, and
> finally Z9). This numbering system will provide a pool of 260 new
> State Codes for future use.

Use the following CCN ranges for the facility types indicated:

``` r
head(ccn:::make_df(ccn:::STATE$CODE, c("state", "code")), 10)
```

    ##    state code
    ## 1     AK   02
    ## 2     AL   01
    ## 3     AR   04
    ## 4     AR   89
    ## 5     AS   64
    ## 6     AZ   00
    ## 7     AZ   03
    ## 8     CA   05
    ## 9     CA   55
    ## 10    CA   75

> **NOTE:** Religious Nonmedical Health Care Institutions (RNHCI) are
> not certified by SAs. The CCN for RNHCIs are assigned by the Boston
> CMS RO.

> **EXCEPTION:** Organ procurement organizations (OPOs) are assigned a
> 6-digit alphanumeric CCN. The first 2 digits identify the State Code.
> The third digit is the alpha character “P.” The remaining 3 digits are
> the unique facility identifier.

> **EXCEPTION:** As of the cost reporting period beginning on or after
> October 1, 2019, an IPPS-excluded hospital is no longer precluded from
> having an IPPS-excluded psychiatric and/or rehabilitation unit. See
> section 2779C and 2779C1 for additional CCN numbering detail.
> **Note:** An IPPS-excluded hospital may not have an IPPS-excluded unit
> of the same type (psychiatric or rehabilitation) as the hospital (for
> example, an Inpatient Rehabilitation Facility (IRF) may not have an
> IRF unit).

## CCN for Suppliers

> Section 2779A2, Page 407

*Rev. 198, Issued: `01-17-20`, Effective: `01-17-20`, Implementation:
`01-17-20`*

Suppliers that are paid by Part B carriers have a 10-digit alphanumeric
CCN. The first 2 digits identify the State in which the supplier is
located. (See list of State Codes under subsection 2779A1.) The third
digit is an alpha character that identifies the type of facility. The
remaining 7 digits are the unique facility identifier. (Exception: CLIA
numbers will continue to be used for fee and certificate issuance.)

The RO assigns the following alpha-characters in the third position as
indicated:

- C - Ambulatory Surgical Centers
- D - Clinical Laboratory Improvement Amendments of 1988 (CLIA)
  Laboratories
- X - Portable X-Ray Facilities

> Exception: CLIA numbers are system generated by the database that
> maintains the CLIA application.

The last 7 digits of the CCN for the above suppliers will be within the
number series `0000001-9999999`.

Examples:

``` r
# ASC
ccn("10C0001062")
```

    ## <ccn::Supplier>
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
    ##  @ ccn            : chr "45D0634589"
    ##  @ state_code     : chr "45"
    ##  @ state_abbr     : chr "TX"
    ##  @ state_name     : chr "Texas"
    ##  @ sequence_number: chr "0634589"
    ##  @ supplier_type  : chr "D"
    ##  @ supplier_abbr  : chr "CLIA"
    ##  @ supplier_name  : chr "CLIA Laboratory"

``` r
# Portable X-Ray
ccn("21X0009807")
```

    ## <ccn::Supplier>
    ##  @ ccn            : chr "21X0009807"
    ##  @ state_code     : chr "21"
    ##  @ state_abbr     : chr "MD"
    ##  @ state_name     : chr "Maryland"
    ##  @ sequence_number: chr "0009807"
    ##  @ supplier_type  : chr "X"
    ##  @ supplier_abbr  : chr "XRAY"
    ##  @ supplier_name  : chr "Portable X-Ray Facility"
