# Create a ccn vector

A `ccn` vector here is one where all entries are character scalars with
a length between 6 and 14

## Usage

``` r
ccn(x = character())
```

## Arguments

- x:

  A character vector of ccn codes

## Value

an S3 vector of class `ccn`

## Examples

``` r
ccn(c("67-0055", "21034e", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589"))
#> <ccn[8]>
#> [1]     670055     21034E     01L008     01J008     05P001     21U101     21TA26
#> [8] 45D0634589
```
