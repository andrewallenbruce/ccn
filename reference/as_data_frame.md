# Convert to data.frame

Convert to data.frame

## Usage

``` r
as_data_frame(x, ...)
```

## Arguments

- x:

  ccn object

- ...:

  additional arguments

## Value

data.frame

## Examples

``` r
c("670055", "05P001", "210101", "21T101", "21S101", "21U101", "01L008",
"12345E", "10C0001062", "45D0634589", "21X0009807", "02TA01", "04SD38",
"52TA05", "212026", "21SA26", "21TA26", "24T019A", "33S23401", "330027001") |>
purrr::map(\(x) as_data_frame(ccn(x))) |>
purrr::list_rbind() |>
ccn:::tbl()
#> # A tibble: 20 × 15
#>    category  number seq_number seq_range seq_abbr seq_desc state_code state_abbr
#>    <chr>     <chr>  <chr>      <chr>     <chr>    <chr>    <chr>      <chr>     
#>  1 Medicare… 670055 0055       0001-0879 ACUTE    Short-T… 67         TX        
#>  2 Medicare… 05P001 001        001-099   NA       NA       05         CA        
#>  3 Medicare… 210101 0101       0001-0879 ACUTE    Short-T… 21         MD        
#>  4 IPPS-Exc… 21T101 101        100-199   CHILD    Medicai… 21         MD        
#>  5 IPPS-Exc… 21S101 101        100-199   CHILD    Medicai… 21         MD        
#>  6 IPPS-Exc… 21U101 101        100-199   CHILD    Medicai… 21         MD        
#>  7 Medicaid… 01L008 008        001-099   ACUTE    Medicai… 01         AL        
#>  8 Emergenc… 12345E 345        001-999   NA       NA       12         HI        
#>  9 Medicare… 10C00… 0001062    000001-9… NA       NA       10         FL        
#> 10 Medicare… 45D06… 0634589    000001-9… NA       NA       45         TX        
#> 11 Medicare… 21X00… 0009807    000001-9… NA       NA       21         MD        
#> 12 IPPS-Exc… 02TA01 2001       2000-2299 LTCH     Long-Te… 02         AK        
#> 13 IPPS-Exc… 04SD38 3038       3025-3099 REHAB    Rehabil… 04         AR        
#> 14 IPPS-Exc… 52TA05 2005       2000-2299 LTCH     Long-Te… 52         WI        
#> 15 Medicare… 212026 2026       2000-2299 LTCH     Long-Te… 21         MD        
#> 16 IPPS-Exc… 21SA26 2026       2000-2299 LTCH     Long-Te… 21         MD        
#> 17 IPPS-Exc… 21TA26 2026       2000-2299 LTCH     Long-Te… 21         MD        
#> 18 IPPS-Exc… 24T019 019        001-099   ACUTE    Medicai… 24         MN        
#> 19 IPPS-Exc… 33S234 234        200-299   CPH      Medicai… 33         NY        
#> 20 Medicare… 330027 0027       0001-0879 ACUTE    Short-T… 33         NY        
#> # ℹ 7 more variables: state_name <chr>, extension <chr>, type_code <chr>,
#> #   type_abbr <chr>, type_desc <chr>, parent_code <chr>, parent_number <chr>
```
