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
x = list("670055", "21034E", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589")

purrr::map(x, \(x) as.data.frame(parse(x))) |> purrr::list_rbind()
#> # A tibble: 8 × 6
#>   entity    ccn        state sequence type  parent
#>   <chr>     <chr>      <chr> <chr>    <chr> <chr> 
#> 1 medicare  670055     67    0055     NA    NA    
#> 2 emergency 21034E     21    034      E     NA    
#> 3 medicaid  01L008     01    008      L     NA    
#> 4 medicaid  01J008     01    008      J     NA    
#> 5 organ     05P001     05    001      P     NA    
#> 6 unit      21U101     21    101      U     NA    
#> 7 subunit   21TA26     21    26       T     A     
#> 8 supplier  45D0634589 45    0634589  D     NA    

purrr::map(x, \(x) data_frame(x)) |> purrr::list_rbind()
#> # A tibble: 8 × 9
#>   ccn        entity             state      region range eipps type  parent ext  
#>   <chr>      <chr>              <chr>      <chr>  <chr> <lgl> <chr> <chr>  <chr>
#> 1 670055     Medicare           TX (Texas) VI (D… 0001… FALSE STC … NA     NA   
#> 2 21034E     Emergency Hospital MD (Maryl… III (… 001-… NA    NF (… NA     NA   
#> 3 01L008     Medicaid-Only      AL (Alaba… IV (A… 001-… NA    PRTF… NA     NA   
#> 4 01J008     Medicaid-Only      AL (Alaba… IV (A… 001-… NA    STC … NA     NA   
#> 5 05P001     Medicare           CA (Calif… IX (S… 001-… NA    OPO … NA     NA   
#> 6 21U101     Unit               MD (Maryl… III (… 001-… FALSE SBA … 210101 NA   
#> 7 21TA26     Subunit            MD (Maryl… III (… NA    TRUE  IRFu… 212026 NA   
#> 8 45D0634589 Supplier           TX (Texas) VI (D… 0000… NA    CLIA… NA     NA   
```
