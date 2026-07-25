# Unit Parents

Convert various codes to their associated names.

## Usage

``` r
parent(x, ...)
```

## Arguments

- x:

  character vector of codes to look up.

- ...:

  additional arguments (not used).

## Value

S7 object of class `Medicare`.

## Examples

``` r
parent("21AE26")
#> ✖ 21AE26 (a <medicaid> object) has no <parent> unit.
parent("21SE26")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
parent("21SB26")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
parent("21SD26")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
