# Slice CMS Certification Numbers

Convert various codes to their associated names.

## Usage

``` r
slice(x)

switch_provider(x)

switch_ccn(x)

slice_provider_ext(x)

slice_medicare(x)

slice_organ(x)

slice_emergency(x)

slice_supplier(x)

slice_supplier_ext(x)

slice_medicaid(x)

slice_unit(x)

slice_subunit(x)

# S3 method for class 'medicare'
print(x, ...)

# S3 method for class 'organ'
print(x, ...)

# S3 method for class 'emergency'
print(x, ...)

# S3 method for class 'supplier'
print(x, ...)

# S3 method for class 'medicaid'
print(x, ...)

# S3 method for class 'unit'
print(x, ...)

# S3 method for class 'subunit'
print(x, ...)
```

## Arguments

- x:

  character vector of codes to look up.

- ...:

  additional arguments passed to methods.

## Value

character vector of names associated with codes.

## Examples

``` r
slice("670055")
#> ────<parsed::medicare>
#>      ccn: 670055
#>    state: 67
#> sequence: 0055
slice("05P001")
#> ────<parsed::organ>
#>      ccn: 05P001
#>    state: 05
#>     type: P
#> sequence: 001
slice("12345E")
#> ────<parsed::emergency>
#>      ccn: 12345E
#>    state: 12
#> sequence: 345
#>     type: E
slice("10C0001062")
#> ────<parsed::supplier>
#>      ccn: 10C0001062
#>    state: 10
#>     type: C
#> sequence: 0001062
slice("A5J508")
#> ────<parsed::medicaid>
#>      ccn: A5J508
#>    state: A5
#>     type: J
#> sequence: 508
slice("21T101")
#> ────<parsed::unit>
#>      ccn: 21T101
#>    state: 21
#>     type: T
#> sequence: 101
slice("02TA01")
#> ────<parsed::subunit>
#>      ccn: 02TA01
#>    state: 02
#>     type: T
#>   parent: A
#> sequence: 01
slice("240019A")
#> ────<parsed::medicare>
#>       ccn: 240019
#>     state: 24
#>  sequence: 0019
#> extension: A
slice("330125001")
#> ────<parsed::medicare>
#>       ccn: 330125
#>     state: 33
#>  sequence: 0125
#> extension: 001
slice("000000000")
#> ────<parsed::medicare>
#>       ccn: 000000
#>     state: 00
#>  sequence: 0000
#> extension: 000
slice("000000000000")
#> ────<parsed::supplier>
#>       ccn: 0000000000
#>     state: 00
#>      type: 0
#>  sequence: 0000000
#> extension: 00
# slice("0000000000000000")
# slice("")
# slice("IIIIII")
```
