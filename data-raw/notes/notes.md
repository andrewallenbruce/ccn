# Sources

  - [CMS Manual](https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/som107c02.pdf)
  - [ResDAC 1](https://resdac.org/cms-data/variables/full-cms-certification-number-provider)
  - [ResDAC 2](https://resdac.org/cms-data/variables/provider-number)
  - [The Joint Commission](https://manual.jointcommission.org/releases/TJC2025A/DataElem0276.html)
  - [QCOR](https://qcor.cms.gov/main.jsp)
  - [HHA Branch Identification Numbers](https://www.cms.gov/Regulations-and-Guidance/Guidance/Transmittals/Downloads/R2SOM.pdf)

# CCN

The _CMS Certification Number (CCN)_ is a unique identifier assigned to
healthcare providers certified by Medicare, used for quality reporting and
verification of services. It consists of six digits, where the first two
indicate the state, and the remaining digits specify the provider type and a
unique counter.

## Definition _(ResDAC)_:
The provider identification number of the institutional provider, certified
by Medicare. 

The first two digits indicate the state where the provider is located. As 
two-digit state codes have been exhausted, CMS has implemented a two-position 
alpha-numeric coding system for State Codes. 

The middle two characters indicate the type of provider. The last two digits 
are used as a __counter for the number of providers within that state__ and 
type of provider (i.e., a unique but not necessarily sequential number).

## CCN for Medicare Providers

_[2779A] (Rev. 226; Issued: 12-06-24; Effective: 12-06-24; Implementation: 12-06-24)_

The CCN for providers and suppliers paid under Medicare Part A have 6 digits. The first
2 digits identify the State in which the provider is located. The last 4 digits identify the
type of facility.

> A `V` in the 5th position identifies a __VA__ demo.

### Critical Access Hospital (CAH)
  - First two digits are the state code.
  - Third digit of `0` == __Acute Facility__.
  - Third digit of `1` && fourth digit of `3` == __CAH__.

### HHA Branch Identification Numbers

_[2779K] (Rev. 2, Issued 08-20-04, Effective: N/A Implementation: N/A)_

__HHA Branches__ are identified by the assignment of a __10-digit alpha-numeric number__.
Each branch is numbered with the same provider identification number as the parent 
or subunit with two modifications: 

  1. The letter `Q` will be in the third position, between the state code and 
  the 4-digit provider designation.
  2. Three additional digits are added to the end of the number. The last 3 
  digits are a one up number for each consecutive branch. These digits allow 
  the capability of assigning up to 999 branches to one parent or sub-unit HHA. 

Branch identification numbers will be used only once. In the event that an 
HHA branch closes, its unique branch identification number is terminated and 
will not be reused to identify another branch of that HHA or sub-unit.


> Example: ABC Home Health Agency has three branches. It's provider identification
number is __`017001`__. ABC's three branches would be assigned the branch 
identification numbers __`01Q7001001`__, __`01Q7001002`__, and __`01Q7001003`__.
