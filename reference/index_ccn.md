# Index a `ccn` object

Index a `ccn` object

## Usage

``` r
index_ccn(x)
```

## Arguments

- x:

  `<chr>` A vector of CCNs.

## Value

An S3 vector of class `<ccn_index>`

## Examples

``` r
index_ccn(as_ccn(get_pin("ccn")))
#> <ccn_index[54567]>
#>     Supplier :  5488
#> Medicaid_Ext :     1
#> Medicare_Ext :   327
#>     Unit_Ext :    14
#>    Emergency :   166
#>     Medicare : 45249
#>        Organ :    55
#>      Subunit :    49
#>         Unit :  3218
```
