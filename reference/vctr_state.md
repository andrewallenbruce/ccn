# Create a state vector

A state vector here is one where all entries are two-character scalars
that correspond to a US state or territory code as defined by CMS.

## Usage

``` r
vctr_state(x = character())

validate_state(x)

is_state(x)

as_state(x)

# S3 method for class 'state'
vec_ptype_abbr(x, ...)

# S3 method for class 'state'
vec_ptype_full(x, ...)

# S3 method for class 'state'
format(x, ...)
```

## Arguments

- x:

  A character vector of state codes

- ...:

  Additional arguments (not used)

## Value

an S3 vector of class `vctr_state`

## Examples

``` r
vctr_state(c("00", "01", "02", "72", "78", "99"))
#> <vctr_state[6]>
#> [1] 00 01 02 72 78 99
```
