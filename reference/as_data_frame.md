# Convert to a data.frame

Convert various codes to their associated names.

## Usage

``` r
as_data_frame(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

data.frame

## Examples

``` r
if (FALSE) {
x = list("670055", "21034E", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589")

purrr::map(x, \(x) as.data.frame(parse(x))) |> purrr::list_rbind()

purrr::map(x, \(x) as_data_frame(x)) |> purrr::list_rbind()

collapse::join(
  purrr::map(x, \(x) as.data.frame(parse(x))) |>
  purrr::list_rbind() |>
  rlang::set_names(c("class", "ccn", "cd_ste", "cd_seq", "cd_typ", "cd_par")),
  purrr::map(x, \(x) as_data_frame(x)) |>
  purrr::list_rbind(),
  verbose = 0L)
}
```
