# Construct a `ccnr` object

Construct a `ccnr` object

## Usage

``` r
ccnr(
  ccn = character(),
  entity = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
)

new_ccnr(
  ccn = character(),
  entity = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
)

is_ccnr(x)

as_ccnr(x)

decode_ccnr(x)
```

## Arguments

- ccn:

  a vector

- entity:

  a vector

- state:

  Passed on to methods

- number:

  a vector

- type:

  a vector

- parent:

  a vector

- ext:

  a vector

- x:

  object

## Value

An S3 vector of class `<ccnr>`

## Examples

``` r
x <- get_pin("ccn")

tibble::tibble(
  x = x,
  ccn = as_ccn(x),
  ccnr = as_ccnr(ccn))
#> # A tibble: 52,287 × 3
#>    x      ccn      ccnr
#>    <chr>  <ccn>  <ccnr>
#>  1 001500 001500 001500
#>  2 001502 001502 001502
#>  3 001503 001503 001503
#>  4 001509 001509 001509
#>  5 001510 001510 001510
#>  6 001511 001511 001511
#>  7 001513 001513 001513
#>  8 001514 001514 001514
#>  9 001515 001515 001515
#> 10 001517 001517 001517
#> # ℹ 52,277 more rows

y <- decode_ccnr(x) |>
  collapse::roworderv(c("entity", "state", "facility", "number")) |>
  collapse::rsplit(~entity)
#> Error in unit_type_infix(xi[["type"]]): could not find function "unit_type_infix"

tibble::tibble(
  parent0 = y$Unit$parent,
  parent1 = as_ccn(parent0),
  parent2 = as_ccnr(parent0)
)
#> Error: object 'y' not found

y
#> Error: object 'y' not found
```
