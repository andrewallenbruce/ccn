# Organ Procurement Organizations

Organ procurement organizations (OPOs) are assigned a 6-digit
alphanumeric CCN. The first 2 digits identify the State code. The third
digit is the alpha character `P`. The remaining 3 digits are the unique
facility identifier.

## Usage

``` r
organ(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Organ>`.

## Examples

``` r
organ("05P001")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
