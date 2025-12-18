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
#>   ccn    entity   state      region      range     eipps type       parent ext  
#>   <chr>  <chr>    <chr>      <chr>       <chr>     <lgl> <chr>      <chr>  <chr>
#> 1 670055 Medicare TX (Texas) VI (Dallas) 0001-0879 FALSE STC (Shor… NA     NA   
data_frame("21034E")
#> # A tibble: 1 × 9
#>   ccn    entity             state         region  range eipps type  parent ext  
#>   <chr>  <chr>              <chr>         <chr>   <chr> <lgl> <chr> <chr>  <chr>
#> 1 21034E Emergency Hospital MD (Maryland) III (P… 001-… NA    NF (… NA     NA   
data_frame("01L008")
#> # A tibble: 1 × 9
#>   ccn    entity        state        region       range  eipps type  parent ext  
#>   <chr>  <chr>         <chr>        <chr>        <chr>  <lgl> <chr> <chr>  <chr>
#> 1 01L008 Medicaid-Only AL (Alabama) IV (Atlanta) 001-9… NA    PRTF… NA     NA   
data_frame("01J008")
#> # A tibble: 1 × 9
#>   ccn    entity        state        region       range  eipps type  parent ext  
#>   <chr>  <chr>         <chr>        <chr>        <chr>  <lgl> <chr> <chr>  <chr>
#> 1 01J008 Medicaid-Only AL (Alabama) IV (Atlanta) 001-0… NA    STAC… NA     NA   
data_frame("05P001")
#> # A tibble: 1 × 9
#>   ccn    entity   state           region          range eipps type  parent ext  
#>   <chr>  <chr>    <chr>           <chr>           <chr> <lgl> <chr> <chr>  <chr>
#> 1 05P001 Medicare CA (California) IX (San Franci… 001-… NA    OPO … NA     NA   
data_frame("21U101")
#> # A tibble: 1 × 9
#>   ccn    entity state         region             range  eipps type  parent ext  
#>   <chr>  <chr>  <chr>         <chr>              <chr>  <lgl> <chr> <chr>  <chr>
#> 1 21U101 Unit   MD (Maryland) III (Philadelphia) 001-9… FALSE SBA … 210101 NA   
data_frame("21TA26")
#> # A tibble: 1 × 9
#>   ccn    entity  state         region             range eipps type  parent ext  
#>   <chr>  <chr>   <chr>         <chr>              <chr> <lgl> <chr> <chr>  <chr>
#> 1 21TA26 Subunit MD (Maryland) III (Philadelphia) NA    TRUE  IRF … 212026 NA   
data_frame("45D0634589")
#> # A tibble: 1 × 9
#>   ccn        entity   state      region      range      eipps type  parent ext  
#>   <chr>      <chr>    <chr>      <chr>       <chr>      <lgl> <chr> <chr>  <chr>
#> 1 45D0634589 Supplier TX (Texas) VI (Dallas) 0000001-9… NA    CLIA… NA     NA   
```
