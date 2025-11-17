CCN Notes
================
2025-11-17

``` r
utils::packageVersion("ccn")
```

    [1] '0.0.0.9013'

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

*\[2779A\] (Rev. 226; Issued: 12-06-24; Effective: 12-06-24;
Implementation: 12-06-24)*

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
| ACUTE     | 0001-0879 |
| ADH (RET) | 1200-1224 |
| CAH       | 1300-1399 |
| CHILD     | 3300-3399 |
| CMHC      | 1400-1499 |
| CMHC      | 4600-4799 |
| CMHC      | 4900-4999 |
| CORF      | 3200-3299 |
| CORF      | 4500-4599 |
| CORF      | 4800-4899 |

*Examples*: **CMHCs in Florida**

``` r
ccn("681400")
```

    <ccn::MedicareProvider>
     @ number        : chr "681400"
     @ sequence      : chr "1400"
     @ state_code    : chr "68"
     @ state_abbr    : chr "FL"
     @ state_name    : chr "Florida"
     @ facility_range: chr "1400-1499"
     @ facility_abbr : chr "CMHC"
     @ facility_desc : chr "Community Mental Health Center"

``` r
ccn("684702")
```

    <ccn::MedicareProvider>
     @ number        : chr "684702"
     @ sequence      : chr "4702"
     @ state_code    : chr "68"
     @ state_abbr    : chr "FL"
     @ state_name    : chr "Florida"
     @ facility_range: chr "4600-4799"
     @ facility_abbr : chr "CMHC"
     @ facility_desc : chr "Community Mental Health Center"

``` r
ccn("691400")
```

    <ccn::MedicareProvider>
     @ number        : chr "691400"
     @ sequence      : chr "1400"
     @ state_code    : chr "69"
     @ state_abbr    : chr "FL"
     @ state_name    : chr "Florida"
     @ facility_range: chr "1400-1499"
     @ facility_abbr : chr "CMHC"
     @ facility_desc : chr "Community Mental Health Center"

### Organ Procurement Organizations (OPOs)

OPOs are assigned a 6-digit alphanumeric CCN. The first 2 digits
identify the State Code. The third digit is the alpha character “P.” The
remaining 3 digits are the unique facility identifier.

``` r
ccn("01P001")
```

    <ccn::MedicareOPO>
     @ number        : chr "01P001"
     @ sequence      : chr "001"
     @ state_code    : chr "01"
     @ state_abbr    : chr "AL"
     @ state_name    : chr "Alabama"
     @ type_code     : chr "P"
     @ facility_range: chr "001-099"
     @ facility_abbr : chr "OPO"
     @ facility_name : chr "Organ Procurement Organization"

``` r
ccn("05P001")
```

    <ccn::MedicareOPO>
     @ number        : chr "05P001"
     @ sequence      : chr "001"
     @ state_code    : chr "05"
     @ state_abbr    : chr "CA"
     @ state_name    : chr "California"
     @ type_code     : chr "P"
     @ facility_range: chr "001-099"
     @ facility_abbr : chr "OPO"
     @ facility_name : chr "Organ Procurement Organization"

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
ccn("10C0001062") # ASC
```

    <ccn::Supplier>
     @ number    : chr "10C0001062"
     @ sequence  : chr "0001062"
     @ state_code: chr "10"
     @ state_abbr: chr "FL"
     @ state_name: chr "Florida"
     @ type_code : chr "C"
     @ type_abbr : chr "ASC"
     @ type_desc : chr "Ambulatory Surgical Center"

``` r
ccn("45D0634589") # CLIA
```

    <ccn::Supplier>
     @ number    : chr "45D0634589"
     @ sequence  : chr "0634589"
     @ state_code: chr "45"
     @ state_abbr: chr "TX"
     @ state_name: chr "Texas"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("21X0009807") # Portable X-Ray
```

    <ccn::Supplier>
     @ number    : chr "21X0009807"
     @ sequence  : chr "0009807"
     @ state_code: chr "21"
     @ state_abbr: chr "MD"
     @ state_name: chr "Maryland"
     @ type_code : chr "X"
     @ type_abbr : chr "XRAY"
     @ type_desc : chr "Portable X-Ray Facility"

> More **CLIA** examples:

``` r
ccn("11D0265516") # DANIEL FELDMAN MD
```

    <ccn::Supplier>
     @ number    : chr "11D0265516"
     @ sequence  : chr "0265516"
     @ state_code: chr "11"
     @ state_abbr: chr "GA"
     @ state_name: chr "Georgia"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("02D0873639") # Artic Envestigations Program Laboratory, Anchorage, AK
```

    <ccn::Supplier>
     @ number    : chr "02D0873639"
     @ sequence  : chr "0873639"
     @ state_code: chr "02"
     @ state_abbr: chr "AK"
     @ state_name: chr "Alaska"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("40D0869394") # Dengue Laboratory, San Juan, PR
```

    <ccn::Supplier>
     @ number    : chr "40D0869394"
     @ sequence  : chr "0869394"
     @ state_code: chr "40"
     @ state_abbr: chr "PR"
     @ state_name: chr "Puerto Rico"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("11D1061576") # CDC/CGH/DGHA International Laboratory, Atlanta, GA
```

    <ccn::Supplier>
     @ number    : chr "11D1061576"
     @ sequence  : chr "1061576"
     @ state_code: chr "11"
     @ state_abbr: chr "GA"
     @ state_name: chr "Georgia"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("11D0668319") # Infectious Diseases Laboratory, Atlanta, GA
```

    <ccn::Supplier>
     @ number    : chr "11D0668319"
     @ sequence  : chr "0668319"
     @ state_code: chr "11"
     @ state_abbr: chr "GA"
     @ state_name: chr "Georgia"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("11D0668290") # National Center for Environmental Health, Division of Laboratory Science, Atlanta, GA
```

    <ccn::Supplier>
     @ number    : chr "11D0668290"
     @ sequence  : chr "0668290"
     @ state_code: chr "11"
     @ state_abbr: chr "GA"
     @ state_name: chr "Georgia"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("06D0880233") # Vector-Borne Diseases Laboratory, Fort Collins, CO
```

    <ccn::Supplier>
     @ number    : chr "06D0880233"
     @ sequence  : chr "0880233"
     @ state_code: chr "06"
     @ state_abbr: chr "CO"
     @ state_name: chr "Colorado"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

``` r
ccn("11D2306220") # Wiregrass Georgia Tech College Student Health Center, Valdosta, GA
```

    <ccn::Supplier>
     @ number    : chr "11D2306220"
     @ sequence  : chr "2306220"
     @ state_code: chr "11"
     @ state_abbr: chr "GA"
     @ state_name: chr "Georgia"
     @ type_code : chr "D"
     @ type_abbr : chr "CLIA"
     @ type_desc : chr "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory"

## Medicaid-Only Providers

> Section 2779B, Page 408

*Rev. 123, ISS: `10-03-14`, EFF: `10-03-14`, IMP: `10-03-14`*

For certification purposes, **Title XIX-Only Providers** are identified
by a 6-digit alphanumeric CCN. The first 2 digits identify the State in
which the provider is located. The third position, which is an alpha
character, identifies the type of facility by level or type of care
being provided. The last 3 digits make up a sequential number series
beginning with 001.

``` r
ccn("01L008")
```

    <ccn::MedicaidOnlyProvider>
     @ number        : chr "01L008"
     @ sequence      : chr "008"
     @ state_code    : chr "01"
     @ state_abbr    : chr "AL"
     @ state_name    : chr "Alabama"
     @ type_code     : chr "L"
     @ type_abbr     : chr "PRTF"
     @ type_name     : chr "Psychiatric Residential Treatment Facility"
     @ facility_range: chr "001-099"
     @ facility_abbr : chr "ACUTE"
     @ facility_name : chr "Medicaid-Only Short-Term Acute Care Hospital"

``` r
ccn:::MEDICAID$ABBR |> 
   ccn:::make_df(c("Facility", "Range")) |> 
   head(10) |> 
   knitr::kable()
```

| Facility | Range   |
|:---------|:--------|
| ACUTE    | 001-099 |
| CHILD    | 100-199 |
| CPH      | 200-299 |
| LTCH     | 500-599 |
| PSYCH    | 300-399 |
| REHAB    | 400-499 |
| RESERVED | 600-999 |

> **EXCEPTION:** As of October 1, 2019, an IPPS-excluded hospital is no
> longer precluded from having an IPPS-excluded psychiatric and/or
> rehabilitation unit. See section 2779C and 2779C1 for additional CCN
> numbering detail.

> **Note:** An IPPS-excluded hospital may not have an IPPS-excluded unit
> of the same type (psychiatric or rehabilitation) as the hospital (for
> example, an Inpatient Rehabilitation Facility (IRF) may not have an
> IRF unit).

# Sources

- [CMS
  Manual](https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf)
- [ResDAC
  1](https://resdac.org/cms-data/variables/full-cms-certification-number-provider)
- [ResDAC 2](https://resdac.org/cms-data/variables/provider-number)
- [The Joint
  Commission](https://manual.jointcommission.org/releases/TJC2025A/DataElem0276.html)
- [QCOR](https://qcor.cms.gov/main.jsp)
- [HHA Branch Identification
  Numbers](https://www.cms.gov/Regulations-and-Guidance/Guidance/Transmittals/Downloads/R2SOM.pdf)

# CCN Definition

The *CMS Certification Number (CCN)* is a unique identifier assigned to
healthcare providers certified by Medicare, used for quality reporting
and verification of services. It consists of six digits, where the first
two indicate the state, and the remaining digits specify the provider
type and a unique counter.

## *ResDAC*:

The provider identification number of the institutional provider,
certified by Medicare.

The first two digits indicate the state where the provider is located.
As two-digit state codes have been exhausted, CMS has implemented a
two-position alpha-numeric coding system for State Codes.

The middle two characters indicate the type of provider. The last two
digits are used as a **counter for the number of providers within that
state** and type of provider (i.e., a unique but not necessarily
sequential number).

> A `V` in the 5th position identifies a **VA** demo.

### Critical Access Hospital (CAH)

- First two digits are the state code.
- Third digit of `0` == **Acute Facility**.
- Third digit of `1` && fourth digit of `3` == **CAH**.

### HHA Branch Identification Numbers

*\[2779K\] (Rev. 2, Issued 08-20-04, Effective: N/A Implementation:
N/A)*

**HHA Branches** are identified by the assignment of a **10-digit
alpha-numeric number**. Each branch is numbered with the same provider
identification number as the parent or subunit with two modifications:

1.  The letter `Q` will be in the third position, between the state code
    and the 4-digit provider designation.
2.  Three additional digits are added to the end of the number. The last
    3 digits are a one up number for each consecutive branch. These
    digits allow the capability of assigning up to 999 branches to one
    parent or sub-unit HHA.

Branch identification numbers will be used only once. In the event that
an HHA branch closes, its unique branch identification number is
terminated and will not be reused to identify another branch of that HHA
or sub-unit.

> Example: ABC Home Health Agency has three branches. It’s provider
> identification number is **`017001`**. ABC’s three branches would be
> assigned the branch identification numbers **`01Q7001001`**,
> **`01Q7001002`**, and **`01Q7001003`**.
