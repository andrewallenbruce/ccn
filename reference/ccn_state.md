# Create a state vector

A state vector here is one where all entries are two-character scalars
that correspond to a US state or territory code as defined by CMS.

## Usage

``` r
ccn_state(x = character())
```

## Arguments

- x:

  A character vector of state codes

## Value

an S3 vector of class `ccn_state`

## Examples

``` r
ccn_state(c("00", "01", "02", "72", "78", "99"))
#> <state[6]>
#> [1] 00 01 02 72 78 99
```
