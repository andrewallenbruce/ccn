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
if (FALSE) { # interactive()
as_list(decode("670055"))
as_list(decode("05P001"))

c("670055", "05P001", "210101", "21T101", "21S101", "21U101",
  "01L008", "12345E", "10C0001062", "45D0634589", "21X0009807",
  "02TA01", "04SD38", "52TA05", "212026", "21SA26", "21TA26",
  "24T019A", "33S23401", "330027001") |>
purrr::map(decode) |>
as_data_frame()
}
```
