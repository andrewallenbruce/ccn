#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_state_abbr(self@code)
    ),
    name = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_state_name(self@abbr)
    )
  )
)

#' @noRd
Sequence <- S7::new_class(
  name = "Sequence",
  abstract = TRUE,
  properties = list(
    number = S7::class_character,
    range = S7::class_character,
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
Type <- S7::new_class(
  name = "Type",
  abstract = TRUE,
  properties = list(
    code = S7::class_character,
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
Unknown <- S7::new_class(
  name = "Unknown",
  properties = list(
    number = S7::class_character
  )
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
SupplierType <- S7::new_class(
  name = "SupplierType",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_supplier_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_supplier_name(self@abbr)
    )
  )
)

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(type = SupplierType)
)

#' @noRd
Provider <- S7::new_class(
  name = "Provider",
  parent = CCN,
  properties = list(extension = S7::class_character)
)

#' @noRd
MedicareSequence <- S7::new_class(
  name = "MedicareSequence",
  parent = Sequence,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_care_range(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_care_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_care_range_name(self@abbr)
    )
  )
)

#' @noRd
MedicareProvider <- S7::new_class(
  name = "MedicareProvider",
  parent = Provider,
  properties = list(sequence = MedicareSequence)
)

#' @noRd
MedicareOPOSequence <- S7::new_class(
  name = "MedicareOPOSequence",
  parent = Sequence,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_opo_range(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_opo_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_opo_range_name(self@abbr)
    )
  )
)

#' @noRd
MedicareOPO <- S7::new_class(
  name = "MedicareOPO",
  parent = Provider,
  properties = list(type = S7::class_character, sequence = MedicareOPOSequence)
)

#' @noRd
EmergencyType <- S7::new_class(
  name = "EmergencyType",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_emergency_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_emergency_name(self@abbr)
    )
  )
)

#' @noRd
EmergencyHospital <- S7::new_class(
  name = "EmergencyHospital",
  parent = Provider,
  properties = list(type = EmergencyType)
)

#' @noRd
MedicaidOnlyProvider <- S7::new_class(
  name             = "MedicaidOnlyProvider",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_name(self@type_abbr)),
    facility_range = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_range_name(self@facility_abbr))
  )
)

#' @noRd
IPPSExcludedProvider <- S7::new_class(
  name             = "IPPSExcludedProvider",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character,
      getter       = \(self) get_ipps_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character,
      getter       = \(self) get_ipps_name(self@type_abbr)),
    facility_range = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character,
      getter       = \(self) get_caid_range_name(self@facility_abbr))
  )
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

