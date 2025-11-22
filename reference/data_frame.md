# Convert to list/data.frame

Convert to list/data.frame

## Usage

``` r
as_list(x, ...)

as_data_frame(x, ...)
```

## Arguments

- x:

  ccn object

- ...:

  additional arguments

## Value

list or data.frame

## Examples

``` r
as_list(ccn("670055"))
#> $category
#> [1] "Medicare Provider"
#> 
#> $number
#> [1] "670055"
#> 
#> $seq_number
#> [1] "0055"
#> 
#> $seq_range
#> [1] "0001-0879"
#> 
#> $seq_abbr
#> [1] "ACUTE"
#> 
#> $seq_desc
#> [1] "Short-Term Hospital (General & Specialty)"
#> 
#> $state_code
#> [1] "67"
#> 
#> $state_abbr
#> [1] "TX"
#> 
#> $state_name
#> [1] "Texas"
#> 
#> $type_code
#> [1] NA
#> 
#> $type_abbr
#> [1] NA
#> 
#> $type_desc
#> [1] NA
#> 
#> $parent_code
#> [1] NA
#> 
#> $parent_number
#> [1] NA
#> 
#> $extension
#> [1] NA
#> 
as_list(ccn("05P001"))
#> Error: 'if_else_' is not an exported object from 'namespace:cheapr'

c("670055", "05P001", "210101", "21T101", "21S101", "21U101",
  "01L008", "12345E", "10C0001062", "45D0634589", "21X0009807",
  "02TA01", "04SD38", "52TA05", "212026", "21SA26", "21TA26",
  "24T019A", "33S23401", "330027001") |>
purrr::map(ccn) |>
as_data_frame()
#> Error in purrr::map(c("670055", "05P001", "210101", "21T101", "21S101",     "21U101", "01L008", "12345E", "10C0001062", "45D0634589",     "21X0009807", "02TA01", "04SD38", "52TA05", "212026", "21SA26",     "21TA26", "24T019A", "33S23401", "330027001"), ccn): ℹ In index: 2.
#> Caused by error:
#> ! 'if_else_' is not an exported object from 'namespace:cheapr'
```
