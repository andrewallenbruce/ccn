# Suppliers

CCNs assigned to Medicare suppliers that are paid by Part B carriers

## Usage

``` r
supplier(x)
```

## Arguments

- x:

  `<character>` 10-position alphanumeric code.

## Value

S7 object of class `<Supplier>`.

## Details

Suppliers have a 10-digit alphanumeric CCN. The first 2 digits identify
the State in which the supplier is located. The third digit is an alpha
character that identifies the type of facility. The remaining 7 digits
are the unique facility identifier.

The RO (Regional Office) assigns the following alpha-characters in the
third position as indicated:

- `C`: Ambulatory Surgical Centers (ASC)

- `D`: Clinical Laboratory Improvement Amendments of 1988 Laboratories
  (CLIA)

- `X`: Portable X-Ray Facilities (PXRF)

## Examples

``` r
supplier("10C0001062")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
supplier("45D0634589")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
supplier("21X0009807")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
supplier("12C0001062")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
