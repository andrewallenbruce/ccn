# Hospital Units

An alpha character in the third position of a CCN identifies either
hospitals with swing-bed approval, rehabilitation units, or psychiatric
units excluded from IPPS payment.

The first 2 digits identify the State in which the provider is located.
The third position (which is alpha) identifies the type of unit or
swing-bed designation.

**The last 3 digits must match the last 3 digits of the parent
provider.**

## Usage

``` r
unit(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Unit>`.

## Examples

``` r
medicare("210101")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
unit("21T101")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
unit("21S101")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
unit("21U101")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
unit("28Z348")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
medicare("281348")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
