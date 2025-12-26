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
#> # A tibble: 1 × 9
#>   ccn    entity   state      region   range     eipps type          parent ext  
#>   <chr>  <chr>    <chr>      <chr>    <chr>     <lgl> <chr>         <chr>  <chr>
#> 1 670055 Medicare TX (Texas) VI (DAL) 0001-0879 FALSE STC (Short-T… NA     NA   
data_frame("21034E")
#> # A tibble: 1 × 9
#>   ccn    entity             state         region  range eipps type  parent ext  
#>   <chr>  <chr>              <chr>         <chr>   <chr> <lgl> <chr> <chr>  <chr>
#> 1 21034E Emergency Hospital MD (Maryland) III (P… 001-… NA    NF (… NA     NA   
data_frame("01L008")
#> # A tibble: 1 × 9
#>   ccn    entity        state        region   range   eipps type     parent ext  
#>   <chr>  <chr>         <chr>        <chr>    <chr>   <lgl> <chr>    <chr>  <chr>
#> 1 01L008 Medicaid-Only AL (Alabama) IV (ATL) 001-999 NA    PRTF (P… NA     NA   
data_frame("01J008")
#> # A tibble: 1 × 9
#>   ccn    entity        state        region   range   eipps type     parent ext  
#>   <chr>  <chr>         <chr>        <chr>    <chr>   <lgl> <chr>    <chr>  <chr>
#> 1 01J008 Medicaid-Only AL (Alabama) IV (ATL) 001-099 NA    STC (Sh… NA     NA   
data_frame("05P001")
#> # A tibble: 1 × 9
#>   ccn    entity   state           region  range   eipps type        parent ext  
#>   <chr>  <chr>    <chr>           <chr>   <chr>   <lgl> <chr>       <chr>  <chr>
#> 1 05P001 Medicare CA (California) IX (SF) 001-099 NA    OPO (Organ… NA     NA   
data_frame("21U101")
#> # A tibble: 1 × 9
#>   ccn    entity state         region    range   eipps type          parent ext  
#>   <chr>  <chr>  <chr>         <chr>     <chr>   <lgl> <chr>         <chr>  <chr>
#> 1 21U101 Unit   MD (Maryland) III (PHL) 001-999 FALSE SBA (Swing-B… 210101 NA   
data_frame("21TA26")
#> # A tibble: 1 × 9
#>   ccn    entity  state         region    range eipps type           parent ext  
#>   <chr>  <chr>   <chr>         <chr>     <chr> <lgl> <chr>          <chr>  <chr>
#> 1 21TA26 Subunit MD (Maryland) III (PHL) NA    TRUE  IRFu (Rehabil… 212026 NA   
data_frame("45D0634589")
#> # A tibble: 1 × 9
#>   ccn        entity   state      region   range         eipps type  parent ext  
#>   <chr>      <chr>    <chr>      <chr>    <chr>         <lgl> <chr> <chr>  <chr>
#> 1 45D0634589 Supplier TX (Texas) VI (DAL) 0000001-9999… NA    CLIA… NA     NA   
```
