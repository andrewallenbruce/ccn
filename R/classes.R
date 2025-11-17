#' @noRd
Unknown <- S7::new_class(
  name       = "Unknown",
  properties = list(
    number   = S7::new_property(
      S7::class_character,
      setter = \(self, value) {
        self@number <- value
        self
      }
    )
  )
)

#' @noRd
CCN <- S7::new_class(
  name         = "CCN",
  parent       = Unknown,
  properties   = list(
    sequence   = S7::class_character,
    state_code = S7::class_character,
    state_abbr = S7::new_property(S7::class_character,
      getter   = \(self) get_state_abbr(self@state_code)),
    state_name = S7::new_property(S7::class_character,
      getter   = \(self) get_state_name(self@state_abbr))
  )
)

#' @noRd
Supplier <- S7::new_class(
  name        = "Supplier",
  parent      = CCN,
  properties  = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(S7::class_character,
      getter  = \(self) get_supplier_abbr(self@type_code)),
    type_desc = S7::new_property(S7::class_character,
      getter  = \(self) get_supplier_name(self@type_abbr))
  )
)

#' @noRd
Provider <- S7::new_class(
  name       = "Provider",
  parent     = CCN,
  properties = list(extended = S7::class_character)
)

#' @noRd
MedicareProvider <- S7::new_class(
  name             = "MedicareProvider",
  parent           = Provider,
  properties       = list(
    facility_range = S7::new_property(S7::class_character,
      getter       = \(self) get_care_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character,
      getter       = \(self) get_care_range_abbr(self@facility_range)),
    facility_desc  = S7::new_property(S7::class_character,
      getter       = \(self) get_care_range_name(self@facility_abbr))
  )
)

#' @noRd
MedicareOPO <- S7::new_class(
  name             = "MedicareOPO",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    facility_range = S7::new_property(S7::class_character,
      getter       = \(self) get_opo_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character,
      getter       = \(self) get_opo_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character,
      getter       = \(self) get_opo_range_name(self@facility_abbr))
  )
)

#' @noRd
EmergencyHospital <- S7::new_class(
  name        = "EmergencyHospital",
  parent      = Provider,
  properties  = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(S7::class_character,
      getter  = \(self) get_emergency_abbr(self@type_code)),
    type_desc = S7::new_property(S7::class_character,
      getter  = \(self) get_emergency_name(self@type_abbr))
  )
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

