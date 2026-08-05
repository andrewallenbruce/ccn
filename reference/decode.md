# Decode `ccn`/`ccnr` objects

Decode `ccn`/`ccnr` objects

## Usage

``` r
decode(x, ...)

# S3 method for class 'ccn'
decode(x, ...)

# S3 method for class 'ccnr'
decode(x, ...)
```

## Arguments

- x:

  `<chr>` A vector of CCNs.

- ...:

  Passed on to methods.

## Value

An S3 vector of class `<ccn>`

## Examples

``` r
x = get_pin("ccn")
decode(as_ccn(x))
#> # A tibble: 54,567 × 5
#>    ccn    entity   state number type 
#>    <chr>  <chr>    <chr>  <int> <chr>
#>  1 001500 Medicare 00      1500 NA   
#>  2 001502 Medicare 00      1502 NA   
#>  3 001503 Medicare 00      1503 NA   
#>  4 001509 Medicare 00      1509 NA   
#>  5 001510 Medicare 00      1510 NA   
#>  6 001511 Medicare 00      1511 NA   
#>  7 001513 Medicare 00      1513 NA   
#>  8 001514 Medicare 00      1514 NA   
#>  9 001515 Medicare 00      1515 NA   
#> 10 001517 Medicare 00      1517 NA   
#> # ℹ 54,557 more rows
b = decode(as_ccnr(x))
b
#> # A tibble: 54,567 × 7
#>    ccn    state region             entity   facility range     description
#>    <chr>  <chr> <chr>              <chr>    <chr>    <chr>     <chr>      
#>  1 001500 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  2 001502 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  3 001503 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  4 001509 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  5 001510 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  6 001511 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  7 001513 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  8 001514 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#>  9 001515 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#> 10 001517 AZ    (IX) San Francisco Medicare Hospice  1500-1799 Hospice    
#> # ℹ 54,557 more rows
collapse::qDF(collapse::fcountv(b, c("entity", "description")))
#>       entity                                            description     N
#> 1   Medicare                                                Hospice  5114
#> 2   Medicare              Short-Term Hospital (General & Specialty)  3234
#> 3   Medicare                               Critical Access Hospital  1382
#> 4   Medicare                                Long-Term Care Hospital   332
#> 5   Medicare                 Hospital-based Renal Dialysis Facility   220
#> 6   Medicare                    Independent Renal Dialysis Facility  7211
#> 7   Medicare                                Rehabilitation Hospital   407
#> 8   Medicare                                    Children's Hospital    95
#> 9   Medicare                                   Psychiatric Hospital   667
#> 10  Medicare                               Skilled Nursing Facility 14674
#> 11  Medicare                                     Home Health Agency 10121
#> 12  Medicare                  Home Health Agency Subunit (Non/Prop)  1019
#> 13  Medicare               Home Health Agency Subunit (State/Local)   715
#> 14  Medicare                                      Transplant Center   233
#> 15  Medicare       Hospital-based Satellite Renal Dialysis Facility   139
#> 16  Medicare                      Federally Qualified Health Center     2
#> 17  Medicare    Independent Special Purpose Renal Dialysis Facility     1
#> 18  Medicare  Hospital in Oncology Care Model Demonstration Project     9
#> 19  Medicare Hospital-based Special Purpose Renal Dialysis Facility     1
#> 20  Medicaid                               Skilled Nursing Facility     1
#> 21      Unit                                 Psychiatric Unit (CAH)    46
#> 22      Unit                                       Psychiatric Unit   745
#> 23      Unit                                    Rehabilitation Unit   792
#> 24      Unit                             Swing-Bed Approval (Acute)   297
#> 25      Unit                               Swing-Bed Approval (CAH)  1342
#> 26      Unit                              Rehabilitation Unit (CAH)     7
#> 27      Unit                               Swing-Bed Approval (LTC)     2
#> 28      Unit                               Swing-Bed Approval (IRF)     1
#> 29   Subunit                                    Rehabilitation Unit    41
#> 30   Subunit                                       Psychiatric Unit     8
#> 31     Organ                         Organ Procurement Organization    55
#> 32 Emergency                           Emergency Hospital (Federal)   164
#> 33 Emergency                       Emergency Hospital (Non-Federal)     2
#> 34  Supplier                             Ambulatory Surgical Center  5473
#> 35  Supplier                                    Clinical Laboratory     9
#> 36  Supplier                                Portable X-Ray Facility     6
with(b, collapse::qtab(facility, entity))
#>                entity
#> facility        Emergency Medicaid Medicare Organ Subunit Supplier  Unit
#>   ASC                   0        0        0     0       0     5473     0
#>   Acute                 0        0     3234     0       0        0     0
#>   CAH                   0        0     1382     0       0        0     0
#>   CLIA                  0        0        0     0       0        9     0
#>   Child                 0        0       95     0       0        0     0
#>   ERF                 164        0        0     0       0        0     0
#>   ERN                   2        0        0     0       0        0     0
#>   ESRD-H                0        0      220     0       0        0     0
#>   ESRD-HP               0        0        1     0       0        0     0
#>   ESRD-HS               0        0      139     0       0        0     0
#>   ESRD-I                0        0     7211     0       0        0     0
#>   ESRD-IP               0        0        1     0       0        0     0
#>   FQHC                  0        0        2     0       0        0     0
#>   HHA                   0        0    10121     0       0        0     0
#>   HHA-NP                0        0     1019     0       0        0     0
#>   HHA-SL                0        0      715     0       0        0     0
#>   Hospice               0        0     5114     0       0        0     0
#>   IRF                   0        0      407     0       0        0     0
#>   LTCH                  0        0      332     0       0        0     0
#>   OCM                   0        0        9     0       0        0     0
#>   OPO                   0        0        0    55       0        0     0
#>   PXRF                  0        0        0     0       0        6     0
#>   Psych                 0        0      667     0       8        0   745
#>   Psych (CAH)           0        0        0     0       0        0    46
#>   Rehab                 0        0        0     0      41        0   792
#>   Rehab (CAH)           0        0        0     0       0        0     7
#>   SNF                   0        1    14674     0       0        0     0
#>   Swing (Acute)         0        0        0     0       0        0   297
#>   Swing (CAH)           0        0        0     0       0        0  1342
#>   Swing (IRF)           0        0        0     0       0        0     1
#>   Swing (LTC)           0        0        0     0       0        0     2
#>   TXC                   0        0      233     0       0        0     0
```
