# Decode CCNs

Convert various codes to their associated names.

## Usage

``` r
decode(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

S7 object of class `Medicare`.

## Examples

``` r
decode("670055")
#> ────<ccn::Medicare>
#> ◉ CCN: <670055>
#> ◉ State: TX - Texas
#> ◉ Facility Type: STC - Short-Term Hospital (General & Specialty)
#> ◉ IPPS-Excluded: ✖
decode("123456")
#> ────<ccn::Medicare>
#> ◉ CCN: <123456>
#> ◉ State: HI - Hawaii
#> ◉ Facility Type: RHC - Rural Health Clinic (Provider-based)
#> ◉ IPPS-Excluded: ✖
```
