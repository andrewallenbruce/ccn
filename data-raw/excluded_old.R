#' @noRd
MedicaidOnlyProvider <- S7::new_class(
  name             = "MedicaidOnlyProvider",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character, getter = \(self) get_caid_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character, getter = \(self) get_caid_name(self@type_abbr)),
    facility_range = S7::new_property(S7::class_character, getter = \(self) get_caid_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_name(self@facility_abbr))
    )
  )

#' @noRd
IPPSExcludedProvider <- S7::new_class(
  name             = "IPPSExcludedProvider",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character, getter = \(self) get_ipps_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character, getter = \(self) get_ipps_name(self@type_abbr)),
    facility_range = S7::new_property(S7::class_character, getter = \(self) get_caid_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_name(self@facility_abbr))
    )
  )

#' @noRd
IPPSExcludedUnit <- S7::new_class(
  name             = "IPPSExcludedUnit",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character, getter = \(self) get_ipps_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character, getter = \(self) get_ipps_name(self@type_abbr)),
    parent_code    = S7::class_character,
    parent_abbr    = S7::new_property(S7::class_character, getter = \(self) get_parent_abbr(self@parent_code)),
    parent_range   = S7::new_property(S7::class_character, getter = \(self) get_care_range(self@sequence)),
    parent_name    = S7::new_property(S7::class_character, getter = \(self) get_care_range_name(self@parent_abbr))
    )
  )
