CCN Tests
================
2025-11-13 23:48:53.316318

``` r
vec <- ccn:::get_pin("ccn_vec") |> 
  stringfish::convert_to_sf()

length(vec)
```

    ## [1] 51655

``` r
stringi::stri_length(vec) |> 
  cheapr::table_(order = TRUE)
```

    ##     6     7     8     9    10 
    ## 46008   132    34     7  5474

``` r
ccn_06 <- make_vec(vec, 6)
ccn_07 <- make_vec(vec, 7)
ccn_08 <- make_vec(vec, 8)
ccn_09 <- make_vec(vec, 9)
ccn_10 <- make_vec(vec, 10)
```

## Medicare Providers (6-digit CCN)

``` r
ccn_06 |> length()
```

    ## [1] 46008

### Alphanumeric

``` r
alpha        <- ccn:::has_letter(ccn_06)
alpha_06     <- ccn_06[alpha]
alpha_06_idx <- stringr::str_count(alpha_06, "[A-Za-z]")
alpha_06_idx |> cheapr::table_(order = TRUE)
```

    ##    1    2 
    ## 3934   48

#### Two Letters

``` r
alpha_06[alpha_06_idx == 2] |> 
  stringr::str_extract_all("[A-Z]{2}") |> 
  ccn:::unlist_() |> 
  cheapr::table_(order = TRUE)
```

    ## SA SB SD SE TA TB 
    ##  5  1  1  1 38  2

#### One Letter

``` r
alpha_06[alpha_06_idx == 1] |> 
  stringr::str_extract_all("[A-Z]", simplify = TRUE) |> 
  as.vector() |> 
  cheapr::table_(order = TRUE)
```

    ##    A    B    D    E    F    M    R    S    T    U    W    Y    Z 
    ##  332  455    7    2    1   46    6  736  726  293    2    1 1327

### Numeric

``` r
ccn_06[!alpha] |> length()
```

    ## [1] 42026

## Medicare Suppliers (10-digit CCN)

``` r
ccn_10 |> 
  stringr::str_extract_all("[A-Z]") |> 
  ccn:::unlist_() |> 
  cheapr::table_(order = TRUE)
```

    ##    C    D 
    ## 5472    2

## The Extended CCN

This extended field allows for the identification of **Multi-Campus
Hospitals**. For multi-campus hospitals, all campuses contain the *same
first 6-digit CCN*, but positions 7 - 13 may be used to distinguish
between campuses (e.g., `01`, `02`, `001`, `002`, `A`, etc.) In the
future positions 7 - 13 may have other uses.

``` r
ccn_07
```

    ##   [1] "017121A" "027022A" "067084A" "067181A" "067268A" "077086A" "077097A"
    ##   [8] "077158A" "087002B" "087007A" "107017A" "107112A" "107132B" "107136A"
    ##  [15] "107166B" "107171B" "107200B" "107234A" "107240B" "107275A" "107290B"
    ##  [22] "107330B" "107338A" "107420A" "107486B" "107512A" "140010A" "167056A"
    ##  [29] "167124A" "167148A" "177274A" "190064A" "194087A" "194106A" "200039A"
    ##  [36] "204005A" "207021A" "207051A" "217008A" "217032A" "217066B" "217081B"
    ##  [43] "217094A" "217111A" "217120A" "217123A" "220083A" "227050B" "227063A"
    ##  [50] "227067A" "227082A" "227207B" "227263A" "227443A" "227465A" "232023A"
    ##  [57] "240006A" "240018B" "240019A" "240050B" "240064A" "243302A" "24T019A"
    ##  [64] "257097A" "267184B" "267290A" "267448A" "287072A" "300020A" "30S020A"
    ##  [71] "310032A" "310069A" "314021A" "317084A" "31S032A" "31S069A" "357044A"
    ##  [78] "377035A" "387136A" "390006A" "390006B" "390115A" "390115B" "390142A"
    ##  [85] "390142C" "390156B" "390204A" "397012A" "397013A" "397021A" "397051B"
    ##  [92] "397092A" "397104A" "397120A" "397129B" "397130B" "397133A" "397157B"
    ##  [99] "397167C" "397197A" "397231B" "397401C" "397456D" "397466B" "397502A"
    ## [106] "397537A" "397611A" "397650A" "39S006A" "39S142A" "39T142A" "39T204A"
    ## [113] "417006A" "430005A" "497019B" "497022B" "497025B" "497026C" "497030B"
    ## [120] "497256B" "497260B" "497279B" "497467A" "497492A" "497508A" "517037B"
    ## [127] "517053A" "517054B" "517074A" "517081A" "517100A" "537041A"

``` r
ccn_08
```

    ##  [1] "05203900" "07001001" "07002201" "07003301" "10002900" "15403500"
    ##  [7] "22007401" "22007402" "23203900" "26014100" "30000301" "31202000"
    ## [13] "31302500" "31302501" "33010301" "33019501" "33021401" "33023401"
    ## [19] "33S19501" "33S23401" "33T23401" "39203900" "45003300" "45027200"
    ## [25] "45063400" "45303600" "45303601" "51200500" "52000901" "52003001"
    ## [31] "52018901" "52019801" "67303500" "78A005BP"

``` r
ccn_09
```

    ## [1] "330027001" "330125001" "330195004" "330395002" "33S027001" "33S395002"
    ## [7] "33T027001"
