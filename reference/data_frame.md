# Convert to list/data.frame

Convert to list/data.frame

## Usage

``` r
as_list(x, ...)

as_data_frame(x, ...)
```

## Arguments

- x:

  ccn object

- ...:

  additional arguments

## Value

list or data.frame

## Examples

``` r
as_list(decode("670055"))
#> $category
#> [1] "Medicare Provider"
#> 
#> $number
#> [1] "670055"
#> 
#> $seq_number
#> [1] "0055"
#> 
#> $seq_range
#> [1] "0001-0879"
#> 
#> $seq_abbr
#> [1] "ACUTE"
#> 
#> $seq_desc
#> [1] "Short-Term Hospital (General & Specialty)"
#> 
#> $state_code
#> [1] "67"
#> 
#> $state_abbr
#> [1] "TX"
#> 
#> $state_name
#> [1] "Texas"
#> 
#> $type_code
#> [1] NA
#> 
#> $type_abbr
#> [1] NA
#> 
#> $type_desc
#> [1] NA
#> 
#> $parent_code
#> [1] NA
#> 
#> $parent_number
#> [1] NA
#> 
#> $extension
#> [1] NA
#> 
as_list(decode("05P001"))
#> $category
#> [1] "Medicare Provider"
#> 
#> $number
#> [1] "05P001"
#> 
#> $seq_number
#> [1] "001"
#> 
#> $seq_range
#> [1] "001-099"
#> 
#> $seq_abbr
#> [1] NA
#> 
#> $seq_desc
#> [1] NA
#> 
#> $state_code
#> [1] "05"
#> 
#> $state_abbr
#> [1] "CA"
#> 
#> $state_name
#> [1] "California"
#> 
#> $type_code
#> [1] "P"
#> 
#> $type_abbr
#> [1] "OPO"
#> 
#> $type_desc
#> [1] "Organ Procurement Organization"
#> 
#> $parent_code
#> [1] NA
#> 
#> $parent_number
#> [1] NA
#> 
#> $extension
#> [1] NA
#> 

c("670055", "05P001", "210101", "21T101", "21S101", "21U101",
  "01L008", "12345E", "10C0001062", "45D0634589", "21X0009807",
  "02TA01", "04SD38", "52TA05", "212026", "21SA26", "21TA26",
  "24T019A", "33S23401", "330027001") |>
purrr::map(decode) |>
as_data_frame()
#>                  category     number seq_number       seq_range seq_abbr
#> 1       Medicare Provider     670055       0055       0001-0879    ACUTE
#> 2       Medicare Provider     05P001        001         001-099     <NA>
#> 3       Medicare Provider     210101       0101       0001-0879    ACUTE
#> 4  IPPS-Excluded Provider     21T101        101         100-199    CHILD
#> 5  IPPS-Excluded Provider     21S101        101         100-199    CHILD
#> 6  IPPS-Excluded Provider     21U101        101         100-199    CHILD
#> 7  Medicaid-Only Provider     01L008        008         001-099    ACUTE
#> 8      Emergency Hospital     12345E        345         001-999     <NA>
#> 9       Medicare Supplier 10C0001062    0001062 0000001-9999999     <NA>
#> 10      Medicare Supplier 45D0634589    0634589 0000001-9999999     <NA>
#> 11      Medicare Supplier 21X0009807    0009807 0000001-9999999     <NA>
#> 12     IPPS-Excluded Unit     02TA01       2001       2000-2299     LTCH
#> 13     IPPS-Excluded Unit     04SD38       3038       3025-3099    REHAB
#> 14     IPPS-Excluded Unit     52TA05       2005       2000-2299     LTCH
#> 15      Medicare Provider     212026       2026       2000-2299     LTCH
#> 16     IPPS-Excluded Unit     21SA26       2026       2000-2299     LTCH
#> 17     IPPS-Excluded Unit     21TA26       2026       2000-2299     LTCH
#> 18 IPPS-Excluded Provider    24T019A        019         001-099    ACUTE
#> 19 IPPS-Excluded Provider   33S23401        234         200-299      CPH
#> 20      Medicare Provider  330027001       0027       0001-0879    ACUTE
#>                                         seq_desc state_code state_abbr
#> 1      Short-Term Hospital (General & Specialty)         67         TX
#> 2                                           <NA>         05         CA
#> 3      Short-Term Hospital (General & Specialty)         21         MD
#> 4              Medicaid-Only Children's Hospital         21         MD
#> 5              Medicaid-Only Children's Hospital         21         MD
#> 6              Medicaid-Only Children's Hospital         21         MD
#> 7   Medicaid-Only Short-Term Acute Care Hospital         01         AL
#> 8                                           <NA>         12         HI
#> 9                                           <NA>         10         FL
#> 10                                          <NA>         45         TX
#> 11                                          <NA>         21         MD
#> 12  Long-Term Care Hospital (Excluded from IPPS)         02         AK
#> 13  Rehabilitation Hospital (Excluded from IPPS)         04         AR
#> 14  Long-Term Care Hospital (Excluded from IPPS)         52         WI
#> 15  Long-Term Care Hospital (Excluded from IPPS)         21         MD
#> 16  Long-Term Care Hospital (Excluded from IPPS)         21         MD
#> 17  Long-Term Care Hospital (Excluded from IPPS)         21         MD
#> 18  Medicaid-Only Short-Term Acute Care Hospital         24         MN
#> 19 Medicaid-Only Children's Psychiatric Hospital         33         NY
#> 20     Short-Term Hospital (General & Specialty)         33         NY
#>    state_name type_code   type_abbr
#> 1       Texas      <NA>        <NA>
#> 2  California         P         OPO
#> 3    Maryland      <NA>        <NA>
#> 4    Maryland         T       REHAB
#> 5    Maryland         S       PSYCH
#> 6    Maryland         U SBA (ACUTE)
#> 7     Alabama         L        PRTF
#> 8      Hawaii         E     ER (NF)
#> 9     Florida         C         ASC
#> 10      Texas         D        CLIA
#> 11   Maryland         X        XRAY
#> 12     Alaska         T       REHAB
#> 13   Arkansas         S       PSYCH
#> 14  Wisconsin         T       REHAB
#> 15   Maryland      <NA>        <NA>
#> 16   Maryland         S       PSYCH
#> 17   Maryland         T       REHAB
#> 18   Michigan         T       REHAB
#> 19   New York         S       PSYCH
#> 20   New York      <NA>        <NA>
#>                                                                                 type_desc
#> 1                                                                                    <NA>
#> 2                                                          Organ Procurement Organization
#> 3                                                                                    <NA>
#> 4  Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 5     Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 6                                              Swing-Bed Approval for Short-Term Hospital
#> 7                                              Psychiatric Residential Treatment Facility
#> 8                                      Non-Federal Emergency Hospital (Non-Participating)
#> 9                                                              Ambulatory Surgical Center
#> 10                   Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory
#> 11                                                                Portable X-Ray Facility
#> 12 Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 13    Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 14 Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 15                                                                                   <NA>
#> 16    Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 17 Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 18 Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 19    Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital
#> 20                                                                                   <NA>
#>    parent_code parent_number extension parent_type parent_ccn
#> 1         <NA>          <NA>      <NA>        <NA>       <NA>
#> 2         <NA>          <NA>      <NA>        <NA>       <NA>
#> 3         <NA>          <NA>      <NA>        <NA>       <NA>
#> 4         <NA>          <NA>      <NA>        <NA>       <NA>
#> 5         <NA>          <NA>      <NA>        <NA>       <NA>
#> 6         <NA>          <NA>      <NA>        <NA>       <NA>
#> 7         <NA>          <NA>      <NA>        <NA>       <NA>
#> 8         <NA>          <NA>      <NA>        <NA>       <NA>
#> 9         <NA>          <NA>      <NA>        <NA>       <NA>
#> 10        <NA>          <NA>      <NA>        <NA>       <NA>
#> 11        <NA>          <NA>      <NA>        <NA>       <NA>
#> 12        <NA>          <NA>      <NA>           A     022001
#> 13        <NA>          <NA>      <NA>           D     043038
#> 14        <NA>          <NA>      <NA>           A     522005
#> 15        <NA>          <NA>      <NA>        <NA>       <NA>
#> 16        <NA>          <NA>      <NA>           A     212026
#> 17        <NA>          <NA>      <NA>           A     212026
#> 18        <NA>          <NA>         A        <NA>       <NA>
#> 19        <NA>          <NA>        01        <NA>       <NA>
#> 20        <NA>          <NA>       001        <NA>       <NA>
```
