# Convert to data.frame

Convert to data.frame

## Usage

``` r
as_data_frame(x, ...)
```

## Arguments

- x:

  ccn object

- ...:

  additional arguments

## Value

data.frame

## Examples

``` r
(x <- ccn("01L008"))
#> <ccn::MedicaidOnlyProvider>
#>  @ number   : chr "01L008"
#>  @ sequence : <ccn::MedicaidOnlySequence>
#>  .. @ number: chr "008"
#>  .. @ range : chr "001-099"
#>  .. @ abbr  : chr "ACUTE"
#>  .. @ desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "01"
#>  .. @ abbr: chr "AL"
#>  .. @ name: chr "Alabama"
#>  @ extension: NULL
#>  @ type     : <ccn::MedicaidOnlyType>
#>  .. @ code: chr "L"
#>  .. @ abbr: chr "PRTF"
#>  .. @ desc: chr "Psychiatric Residential Treatment Facility"

as_data_frame(x) |> str()
#> 'data.frame':    1 obs. of  13 variables:
#>  $ category  : chr "Medicaid-Only Provider"
#>  $ number    : chr "01L008"
#>  $ sequence  : chr "008"
#>  $ seq_range : chr "001-099"
#>  $ seq_abbr  : chr "ACUTE"
#>  $ seq_desc  : chr "Medicaid-Only Short-Term Acute Care Hospital"
#>  $ state_code: chr "01"
#>  $ state_abbr: chr "AL"
#>  $ state_name: chr "Alabama"
#>  $ extension : chr NA
#>  $ type_code : chr "L"
#>  $ type_abbr : chr "PRTF"
#>  $ type_desc : chr "Psychiatric Residential Treatment Facility"
```
