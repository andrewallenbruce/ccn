# Construct a `ccnr` object

Construct a `ccnr` object

## Usage

``` r
ccnr(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
)
```

## Arguments

- entity:

  `<chr>` vector of ccn entity types

- ccn:

  `<chr>` vector of ccns

- state:

  `<chr>` vector of ccn state codes

- number:

  `<chr>` vector of ccn code sequence numbers

- type:

  `<chr>` vector of ccn code facility types

## Value

An S3 vector of class `<ccnr>`

## Examples

``` r
ccnr()
#> <ccn_rcrd[0]>

ccnr(
  entity = "Medicare",
  ccn = "001234",
  state = "00",
  number = "1234",
  type = NA_character_
 )
#> <ccn_rcrd[1]>
#> [1] 001234
```
