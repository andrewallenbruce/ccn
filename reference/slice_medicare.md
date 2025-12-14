# Medicare Provider: 670055 -\> 67 0055

Medicare Provider: 670055 -\> 67 0055

Medicare OPO Provider: 05P001 -\> 05 P 001

Emergency Hospital: 12345E -\> 12 345 E

Medicare Supplier: 10C0001062 -\> 10 C 0001062

Medicare Supplier with Extension: 10C0001062EXT -\> 10 C 0001062 EXT

Medicaid-Only Facility: 01L008 -\> 01 L 008

IPPS-Excluded Provider: 21T101 -\> 21 T 101

IPPS-Excluded Unit: 02TA01 -\> 02 T A 01

## Usage

``` r
slice_medicare(x)

slice_provider_ext(x)

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

  additional arguments (not used).
