# Convert to a data.frame

Convert various codes to their associated names.

## Usage

``` r
data_frame(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

data.frame

## Examples

``` r
data_frame("670055")
#>      ccn   entity state region     range eipps type parent  ext
#> 1 670055 medicare    TX     VI 0001-0879 FALSE  STC   <NA> <NA>
data_frame("21034E")
#>      ccn    entity state region   range eipps type parent  ext
#> 1 21034E emergency    MD    III 001-999    NA   NF   <NA> <NA>
data_frame("01L008")
#>      ccn   entity state region   range eipps type parent  ext
#> 1 01L008 medicaid    AL     IV 001-999    NA PRTF   <NA> <NA>
data_frame("01J008")
#>      ccn   entity state region   range eipps type parent  ext
#> 1 01J008 medicaid    AL     IV 001-099    NA STAC   <NA> <NA>
data_frame("05P001")
#>      ccn entity state region   range eipps type parent  ext
#> 1 05P001  organ    CA     IX 001-099    NA  OPO   <NA> <NA>
data_frame("21U101")
#>      ccn entity state region   range eipps type parent  ext
#> 1 21U101   unit    MD    III 001-999 FALSE  SBA 210101 <NA>
data_frame("21TA26")
#>      ccn  entity state region range eipps type parent  ext
#> 1 21TA26 subunit    MD    III  <NA>  TRUE  IRF 212026 <NA>
data_frame("45D0634589")
#>          ccn   entity state region           range eipps type parent  ext
#> 1 45D0634589 supplier    TX     VI 0000001-9999999    NA CLIA   <NA> <NA>
```
