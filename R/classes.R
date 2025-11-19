#' @include State.R
#' @include Sequence.R
#' @include Type.R
NULL

#' @noRd
Unknown <- S7::new_class(
  name = "Unknown",
  properties = list(number = S7::class_character)
)

#' @noRd
CCN <- S7::new_class(
  name = "CCN",
  parent = Unknown,
  properties = list(
    sequence = S7::class_character | Sequence,
    state = State
  )
)

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(
    type = SupplierType,
    sequence = SupplierSequence
  )
)

#' @noRd
Provider <- S7::new_class(
  name = "Provider",
  parent = CCN,
  properties = list(extension = NULL | S7::class_character)
)

#' @noRd
EmergencyHospital <- S7::new_class(
  name = "EmergencyHospital",
  parent = Provider,
  properties = list(type = EmergencyType)
)

#' @noRd
MedicareProvider <- S7::new_class(
  name = "MedicareProvider",
  parent = Provider,
  properties = list(
    sequence = MedicareSequence
  )
)

#' @noRd
MedicareOPO <- S7::new_class(
  name = "MedicareOPO",
  parent = Provider,
  properties = list(
    type = OPOType,
    sequence = OPOSequence
  )
)

#' @noRd
MedicaidOnlyProvider <- S7::new_class(
  name = "MedicaidOnlyProvider",
  parent = Provider,
  properties = list(
    type = MedicaidOnlyType | IPPSExcludedType,
    sequence = MedicaidOnlySequence
  )
)

#' @noRd
IPPSExcludedProvider <- S7::new_class(
  name = "IPPSExcludedProvider",
  parent = MedicaidOnlyProvider,
  properties = list(type = IPPSExcludedType)
)

#' @noRd
IPPSExcludedUnit <- S7::new_class(
  name = "IPPSExcludedUnit",
  parent = Provider,
  properties = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_ipps_abbr(self@type_code)
      }
    ),
    type_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_ipps_name(self@type_abbr)
      }
    ),
    parent_code = S7::class_character,
    parent_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_parent_abbr(self@parent_code)
      }
    ),
    parent_range = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_care_range(self@sequence)
      }
    ),
    parent_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_care_range_name(self@parent_abbr)
      }
    )
  )
)

