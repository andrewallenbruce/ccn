# Decode a CCN

Decode a CCN into its component parts.

## Usage

``` r
decode(x, arg = rlang::caller_arg(x), call = rlang::caller_env())
```

## Arguments

- x:

  character vector of CCNs.

- arg:

  argument used for error messaging.

- call:

  environment used for error messaging.

## Value

list of CCN components.

## Examples

``` r
decode("670055")
#> $raw
#> [1] "670055"
#> 
#> $std
#> [1] "670055"
#> 
#> $chr
#> [1] 6
#> 
#> $vec
#> [1] "6" "7" "0" "0" "5" "5"
#> 
decode("21-0101")
#> $raw
#> [1] "21-0101"
#> 
#> $std
#> [1] "210101"
#> 
#> $chr
#> [1] 6
#> 
#> $vec
#> [1] "2" "1" "0" "1" "0" "1"
#> 
decode("21-T101")
#> $raw
#> [1] "21-T101"
#> 
#> $std
#> [1] "21T101"
#> 
#> $chr
#> [1] 6
#> 
#> $vec
#> [1] "2" "1" "T" "1" "0" "1"
#> 
```
