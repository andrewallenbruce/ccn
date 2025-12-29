# Create a ccn vector

A ccn vector here is one where all entries are character scalars with a
length between 6 and 14

## Usage

``` r
ccn(x = character())

is_ccn(x)

as_ccn(x)
```

## Arguments

- x:

  A character vector of ccns

## Value

a `ccn` vector

## Examples

``` r
ccn(c("670055", "21034E", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589"))
#> <ccn[8]>
#> [1]     670055     21034E     01L008     01J008     05P001     21U101     21TA26
#> [8] 45D0634589
```
