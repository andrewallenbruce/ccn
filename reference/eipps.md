# IPPS-Excluded Hospital Units/Swing-Bed Approvals

Convert various codes to their associated names.

## Usage

``` r
eipps_unit(x)

eipps_unit2(x)
```

## Arguments

- x:

  character vector of codes to look up.

## Value

character vector of names associated with codes.

## Examples

``` r
medicare_provider("210101")
#> <ccn::Medicare>
#>  @ ccn      : chr "210101"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "0101"
#>  .. @ range : chr "0001-0879"
#>  .. @ abbr  : chr "STC"
#>  .. @ desc  : chr "Short-Term Hospital (General & Specialty)"
#>  @ extension: NULL
eipps_unit("21T101")
#> <ccn::EippsUnit>
#>  @ ccn     : chr "21T101"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF (EIPPS)"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
eipps_unit("21S101")
#> <ccn::EippsUnit>
#>  @ ccn     : chr "21S101"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PU (EIPPS)"
#>  .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
eipps_unit("21U101")
#> <ccn::EippsUnit>
#>  @ ccn     : chr "21U101"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::Sequence>
#>  .. @ number: chr "101"
#>  .. @ range : chr "001-999"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "U"
#>  .. @ abbr: chr "STH (SBA)"
#>  .. @ desc: chr "Swing-Bed Approval for Short-Term Hospital"

medicare_provider("212026")
#> <ccn::Medicare>
#>  @ ccn      : chr "212026"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ extension: NULL
eipps_unit2("21SA26")
#> <ccn::EippsUnit2>
#>  @ ccn     : chr "21SA26"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PU (EIPPS)"
#>  .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::EippsParent>
#>  .. @ code: chr "S"
#>  .. @ type: chr "PU (EIPPS)"
#>  .. @ ccn : chr "212026"
eipps_unit2("21TA26")
#> <ccn::EippsUnit2>
#>  @ ccn     : chr "21TA26"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "21"
#>  .. @ abbr: chr "MD"
#>  .. @ name: chr "Maryland"
#>  @ sequence: <ccn::MedicareSequence>
#>  .. @ number: chr "2026"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF (EIPPS)"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::EippsParent>
#>  .. @ code: chr "T"
#>  .. @ type: chr "IRF (EIPPS)"
#>  .. @ ccn : chr "212026"

medicare_provider("022001")
#> <ccn::Medicare>
#>  @ ccn      : chr "022001"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2001"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ extension: NULL
eipps_unit2("02TA01")
#> <ccn::EippsUnit2>
#>  @ ccn     : chr "02TA01"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "02"
#>  .. @ abbr: chr "AK"
#>  .. @ name: chr "Alaska"
#>  @ sequence: <ccn::MedicareSequence>
#>  .. @ number: chr "2001"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF (EIPPS)"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::EippsParent>
#>  .. @ code: chr "T"
#>  .. @ type: chr "IRF (EIPPS)"
#>  .. @ ccn : chr "022001"

medicare_provider("043038")
#> <ccn::Medicare>
#>  @ ccn      : chr "043038"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "3038"
#>  .. @ range : chr "3025-3099"
#>  .. @ abbr  : chr "IRF (EIPPS)"
#>  .. @ desc  : chr "Rehabilitation Hospital (Excluded from IPPS)"
#>  @ extension: NULL
eipps_unit2("04SD38")
#> <ccn::EippsUnit2>
#>  @ ccn     : chr "04SD38"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "04"
#>  .. @ abbr: chr "AR"
#>  .. @ name: chr "Arkansas"
#>  @ sequence: <ccn::MedicareSequence>
#>  .. @ number: chr "3038"
#>  .. @ range : chr "3025-3099"
#>  .. @ abbr  : chr "IRF (EIPPS)"
#>  .. @ desc  : chr "Rehabilitation Hospital (Excluded from IPPS)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "S"
#>  .. @ abbr: chr "PU (EIPPS)"
#>  .. @ desc: chr "Psychiatric Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::EippsParent>
#>  .. @ code: chr "S"
#>  .. @ type: chr "PU (EIPPS)"
#>  .. @ ccn : chr "043038"

medicare_provider("522005")
#> <ccn::Medicare>
#>  @ ccn      : chr "522005"
#>  @ entity   : chr "Medicare Provider"
#>  @ state    : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ sequence : <ccn::MedicareSequence>
#>  .. @ number: chr "2005"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ extension: NULL
eipps_unit2("52TA05")
#> <ccn::EippsUnit2>
#>  @ ccn     : chr "52TA05"
#>  @ entity  : chr "IPPS-Excluded Unit"
#>  @ state   : <ccn::State>
#>  .. @ code: chr "52"
#>  .. @ abbr: chr "WI"
#>  .. @ name: chr "Wisconsin"
#>  @ sequence: <ccn::MedicareSequence>
#>  .. @ number: chr "2005"
#>  .. @ range : chr "2000-2299"
#>  .. @ abbr  : chr "LTC (EIPPS)"
#>  .. @ desc  : chr "Long-Term Care Hospital (Excluded from IPPS)"
#>  @ type    : <ccn::Type>
#>  .. @ code: chr "T"
#>  .. @ abbr: chr "IRF (EIPPS)"
#>  .. @ desc: chr "Rehabilitation Unit (Excluded from IPPS)"
#>  @ parent  : <ccn::EippsParent>
#>  .. @ code: chr "T"
#>  .. @ type: chr "IRF (EIPPS)"
#>  .. @ ccn : chr "522005"
```
