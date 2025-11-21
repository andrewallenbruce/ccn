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
ccn("01L008") |> as_data_frame() |> str()
#> 'data.frame':    1 obs. of  13 variables:
#>  $ type      : chr "Medicaid-Only Provider"
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
ccn("670055") |> as_data_frame() |> str()
#> 'data.frame':    1 obs. of  10 variables:
#>  $ type      : chr "Medicare Provider"
#>  $ number    : chr "670055"
#>  $ sequence  : chr "0055"
#>  $ seq_range : chr "0001-0879"
#>  $ seq_abbr  : chr "ACUTE"
#>  $ seq_desc  : chr "Short-Term Hospital (General & Specialty)"
#>  $ state_code: chr "67"
#>  $ state_abbr: chr "TX"
#>  $ state_name: chr "Texas"
#>  $ extension : chr NA
ccn("05P001") |> as_data_frame() |> str()
#> 'data.frame':    1 obs. of  11 variables:
#>  $ type      : chr "Medicare Provider"
#>  $ number    : chr "05P001"
#>  $ sequence  : chr "001"
#>  $ seq_range : chr "001-099"
#>  $ state_code: chr "05"
#>  $ state_abbr: chr "CA"
#>  $ state_name: chr "California"
#>  $ extension : chr NA
#>  $ type_code : chr "P"
#>  $ type_abbr : chr "OPO"
#>  $ type_desc : chr "Organ Procurement Organization"
```
