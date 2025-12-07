# Version dev

## ccn 0.0.0.9001 (2025-10-31)

- Initial commit

## ccn 0.0.0.9002 (2025-11-04)

- `is_ipps_excluded_type`, `is_medicaid_facility_type` tests
- `decode` sketch

## ccn 0.0.0.9003 (2025-11-08)

- `S7` CCN classes

## ccn 0.0.0.9004 (2025-11-09)

- `decode` S7 generic first pass

## ccn 0.0.0.9005 (2025-11-10)

- added `asc` pin, redid `aff` pin

## ccn 0.0.0.9006 (2025-11-12)

- Provider superclass is now child class of Unknown
- Medicare range/name lookups
- Added to `MedicareProvider` class

## ccn 0.0.0.9007 (2025-11-12)

- `convert_` helpers

## ccn 0.0.0.9008 (2025-11-13)

- standardized facility type slots
- removed roxyglobals dependency

## ccn 0.0.0.9009 (2025-11-14)

- Same as previous version.

## ccn 0.0.0.9010 (2025-11-14)

- `IPPSExcludedUnit` class, convert method

## ccn 0.0.0.9011 (2025-11-16)

- props renamed: ccn -\> number, sequence_number -\> sequence
- namespace `convert` methods

## ccn 0.0.0.9012 (2025-11-17)

- `type_parent` -\> `type_unit`

## ccn 0.0.0.9013 (2025-11-17)

- added `esrd`, `irf` & `ltch` testing data

## ccn 0.0.0.9014 (2025-11-17)

- added `extended` slot for Multi-Campus Hospital ccn type

## ccn 0.0.0.9015 (2025-11-17)

- length check added, extension can be `NULL` now

## ccn 0.0.0.9016 (2025-11-18)

- Type, State, Sequence classes
- added dedicated `State` class

## ccn 0.0.0.9017 (2025-11-18)

- `Sequence` & `FullSequence`
- standardizing classes

## ccn 0.0.0.9018 (2025-11-18)

- tidying, re-render README

## ccn 0.0.0.9019 (2025-11-19)

- initial `as_data_frame` method
  ([\#2](https://github.com/andrewallenbruce/ccn/issues/2))
- added `MedicaidOnlySequence`, `MedicaidOnlyType`, `IPPSExcludedType`

## ccn 0.0.0.9020 (2025-11-20)

- `IPPSExcludedUnit` now working
- standard `is_*` prefix added to logical predicates
- `OPOSequence` -\> `OpoSequence` & `OPOType` -\> `OpoType`, standard
  CamelCase convention for class names
- initial base
  [`parse()`](https://andrewallenbruce.github.io/ccn/reference/parse.md)
  sketch

## ccn 0.0.0.9021 (2025-11-20)

- added `IppsExcludedUnitParent` class

## ccn 0.0.0.9022 (2025-11-20)

- added `EmergencySequence` class
- converted Emergency, Supplier and OPO ranges to `integer`s
  ([\#1](https://github.com/andrewallenbruce/ccn/issues/1))

## ccn 0.0.0.9023 (2025-11-21)

- `as_data_frame` methods added

## ccn 0.0.0.9024 (2025-11-21)

- `as_data_frame` methods implemented
  ([\#2](https://github.com/andrewallenbruce/ccn/issues/2))
- `ranges` converted to integer vectors
  ([\#1](https://github.com/andrewallenbruce/ccn/issues/1))

## ccn 0.0.0.9025 (2025-11-21)

- Same as previous version.

## ccn 0.0.0.9026 (2025-11-21)

- `as_list` methods
  ([\#2](https://github.com/andrewallenbruce/ccn/issues/2))
- fixed: bug in `range_supplier`

## ccn 0.0.0.9027 (2025-11-22)

- refactored to uncouple S7 classes

## ccn 0.0.0.9028 (2025-11-22)

- reorganization/refactoring

## ccn 0.0.0.9029 (2025-11-22)

- added initial base parsing methods
  ([\#3](https://github.com/andrewallenbruce/ccn/issues/3))

## ccn 0.0.0.9030 (2025-11-23)

- added state code dataset

## ccn 0.0.0.9031 (2025-11-28)

- rewrite

## ccn 0.0.0.9032 (2025-11-28)

- medicaid ranges/types overhaul

## ccn 0.0.0.9033 (2025-11-29)

- reconstructing internal data sources

## ccn 0.0.0.9034 (2025-11-30)

- more restructuring

## ccn 0.0.0.9035 (2025-11-30)

- work on
  [`parse()`](https://andrewallenbruce.github.io/ccn/reference/parse.md)
  ([\#3](https://github.com/andrewallenbruce/ccn/issues/3))

## ccn 0.0.0.9036 (2025-11-30)

- [`parse()`](https://andrewallenbruce.github.io/ccn/reference/parse.md)
  development ([\#3](https://github.com/andrewallenbruce/ccn/issues/3))

## ccn 0.0.0.9037 (2025-12-01)

- trying
  [`data.table::between`](https://rdatatable.gitlab.io/data.table/reference/between.html)
  &
  [`data.table::inrange`](https://rdatatable.gitlab.io/data.table/reference/between.html)
  for facility ranges

## ccn 0.0.0.9038 (2025-12-02)

- ipps structure

## ccn 0.0.0.9039 (2025-12-02)

- eipps implementation work (parent lookup)

## ccn 0.0.0.9040 (2025-12-04)

- testing data has been organized and minimized.

## ccn 0.0.0.9041 (2025-12-04)

- `eipps_parent` variation

## ccn 0.0.0.9042 (2025-12-04)

- renamed `parse_` functions

## ccn 0.0.0.9043 (2025-12-04)

- IPPS-Excluded: `unit`, `subunit`, `parent`

## ccn 0.0.0.9044 (2025-12-05)

- `medicaid` consolidated into one class

## ccn 0.0.0.9045 (2025-12-06)

- simplifying classes

## ccn 0.0.0.9046 (2025-12-06)

- fixed bug in
  [`medicaid()`](https://andrewallenbruce.github.io/ccn/reference/medicaid.md)
