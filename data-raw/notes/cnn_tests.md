CCN Tests
================
2025-11-13

``` r
vec <- stringfish::convert_to_sf(ccn:::get_pin("ccn_vec"))

length(vec)
```

    ## [1] 51655

``` r
len <- stringi::stri_length(vec)

cheapr::table_(len, order = TRUE)
```

    ##     6     7     8     9    10 
    ## 46008   132    34     7  5474

``` r
make_vec <- function(x, n) {
  stringfish::convert_to_sf(x[cheapr::which_(len == n)])
}

ccn_06 <- make_vec(vec, 6)
ccn_07 <- make_vec(vec, 7)
ccn_08 <- make_vec(vec, 8)
ccn_09 <- make_vec(vec, 9)
ccn_10 <- make_vec(vec, 10)

head(ccn_06) # 46008
```

    ## [1] "001500" "001502" "001503" "001509" "001510" "001511"

``` r
head(ccn_07) # 132
```

    ## [1] "017121A" "027022A" "067084A" "067181A" "067268A" "077086A"

``` r
head(ccn_08) # 34
```

    ## [1] "05203900" "07001001" "07002201" "07003301" "10002900" "15403500"

``` r
head(ccn_09) # 7
```

    ## [1] "330027001" "330125001" "330195004" "330395002" "33S027001" "33S395002"

``` r
head(ccn_10) # 5474
```

    ## [1] "01C0001000" "01C0001002" "01C0001008" "01C0001009" "01C0001010"
    ## [6] "01C0001011"
