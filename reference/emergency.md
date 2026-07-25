# Emergency Hospitals

CCNs assigned to Emergency Hospitals (both Federal and non-Federal) that
do not participate in the Medicare program.

## Usage

``` r
emergency(x)
```

## Arguments

- x:

  `<character>` 6-position alphanumeric code.

## Value

S7 object of class `<Emergency>`.

## Details

Emergency hospitals are identified by a 6-position alphanumeric CCN.

Positions one and two identify the state in which the hospital is
located.

Position six, an alpha character, identifies whether the hospital is
Federal (`F`) or non-Federal (`E`).

Positions three, four and five represent a sequence beginning with
`001`. This sequence identifies the order, by state, in which the CCN
was issued.

For example, the CCN of the 34th emergency hospital in Maryland would be
`21034E`. The Regional Office assigns the CCN in strict numerical
sequence without regard to the Federal or non-Federal status.

## Examples

``` r
emergency("21034E")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
emergency("12345F")
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
emergency("11038F") # USAF Hospital (Moody)
#> Warning: Unknown or uninitialised column: `name`.
#> Error in kit::vswitch(x = x, values = v, outputs = o, default = NA_character_,     nThread = 4L, ...): Length of 'values' and 'outputs' are different. Please make sure they are the same.
```
