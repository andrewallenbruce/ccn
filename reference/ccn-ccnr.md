# Construct a `ccn`/`ccnr` object

Construct a `ccn`/`ccnr` object

## Usage

``` r
ccn(x = character())

ccnr(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
)
```

## Arguments

- x:

  `<chr>` A vector of CCNs.

- entity:

  `<chr>` vector of ccn entity types

- ccn:

  `<chr>` vector of ccns

- state:

  `<chr>` vector of state codes

- number:

  `<chr>` vector of sequence numbers

- type:

  `<chr>` vector of facility types

## Value

An S3 vector of class `<ccn>` or `<ccnr>`

## Examples

``` r
x = get_pin("ccn")
y = ccn(x)
vctrs::vec_c(x[1:5], y[100:150], x[1:50])
#> <ccn_vctr[106]>
#>   [1] 001500 001502 001503 001509 001510 010131 010138 010139 010144 010148
#>  [11] 010149 01014F 010150 010157 010158 010164 010168 010169 010173 010175
#>  [21] 01019F 01021F 010779 010780 010781 011300 011302 011304 011305 011306
#>  [31] 011307 011308 011309 011500 011501 011502 011503 011505 011506 011508
#>  [41] 011510 011511 011512 011513 011514 011516 011517 011522 011524 011526
#>  [51] 011527 011528 011534 011538 011543 011546 001500 001502 001503 001509
#>  [61] 001510 001511 001513 001514 001515 001517 001518 001524 001527 001528
#>  [71] 001529 001530 001534 001535 001536 001541 001545 001550 001552 001556
#>  [81] 001557 001561 001562 001563 001568 001570 001571 001572 001574 001575
#>  [91] 010001 010005 010006 010007 010008 010011 010012 010016 010018 010019
#> [101] 010021 010022 010023 010024 010029 010033
tibble::tibble(x = x, ccn = ccn(x))
#> # A tibble: 54,567 × 2
#>    x      ccn   
#>    <chr>  <ccn> 
#>  1 001500 001500
#>  2 001502 001502
#>  3 001503 001503
#>  4 001509 001509
#>  5 001510 001510
#>  6 001511 001511
#>  7 001513 001513
#>  8 001514 001514
#>  9 001515 001515
#> 10 001517 001517
#> # ℹ 54,557 more rows

ccnr(
  entity = "Medicare",
  ccn = "001234",
  state = "00",
  number = "1234",
  type = NA_character_
 )
#> <ccn_rcrd[1]>
#> [1] 001234
```
