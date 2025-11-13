#' @noRd
Unknown <- S7::new_class(
  name = "Unknown",
  properties = list(
    ccn = S7::class_character,
    chr = S7::class_integer,
    vec = S7::class_character
  )
)

#' @noRd
new_unknown <- function(x) {
  xc <- clean(x)
  Unknown(
    ccn = xc,
    chr = nchar_(xc),
    vec = split_(xc)
  )
}

#' @noRd
CCN <- S7::new_class(
  name              = "CCN",
  parent            = Unknown,
  properties        = list(
    state_code      = S7::new_property(
      S7::class_character,
      setter = function(self, value) {
        self@state_code <- string(value)
        self
      }
    ),
    state_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_state_abbr(self@state_code)
      }
    ),
    state_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_state_name(self@state_abbr)
      }
    ),
    sequence_number = S7::new_property(
      S7::class_character,
      setter = function(self, value) {
        self@sequence_number <- string(value)
        self
      }
    )
  )
)

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_supplier_abbr(self@type_code)
      }
    ),
    type_desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_supplier_name(self@type_abbr)
      }
    )
  )
)

#' @noRd
Provider <- S7::new_class(
  name   = "Provider",
  parent = CCN
)

#' @noRd
MedicareProvider <- S7::new_class(
  name   = "MedicareProvider",
  parent = Provider,
  properties = list(
    facility_range = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_care_range(self@sequence_number)
      }
    ),
    facility_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_care_range_abbr(self@facility_range)
      }
    ),
    facility_desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_care_range_name(self@facility_abbr)
      }
    )
  )
)

#' @noRd
MedicareOPO <- S7::new_class(
  name   = "MedicareOPO",
  parent = Provider,
  properties = list(
    type_code = S7::class_character,
    facility_range = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_opo_range(self@sequence_number)
      }
    ),
    facility_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_opo_range_abbr(self@facility_range)
      }
    ),
    facility_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_opo_range_name(self@facility_abbr)
      }
    )
  )
)

#' @noRd
EmergencyHospital <- S7::new_class(
  name   = "EmergencyHospital",
  parent = Provider,
  properties = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_emergency_abbr(self@type_code)
      }
    ),
    type_desc = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_emergency_name(self@type_abbr)
      }
    )
  )
)

#' @noRd
MedicaidOnlyProvider <- S7::new_class(
  name   = "MedicaidOnlyProvider",
  parent = Provider,
  properties = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_abbr(self@type_code)
      }
    ),
    type_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_name(self@type_abbr)
      }
    ),
    facility_range = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_range(self@sequence_number)
      }
    ),
    facility_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_range_abbr(self@facility_range)
      }
    ),
    facility_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_range_name(self@facility_abbr)
      }
    )
  )
)

#' @noRd
IPPSExcludedProvider <- S7::new_class(
  name   = "IPPSExcludedProvider",
  parent = Provider,
  properties = list(
    type_code = S7::class_character,
    type_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_abbr(self@type_code)
      }
    ),
    type_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_name(self@type_abbr)
      }
    ),
    facility_range = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_range(self@sequence_number)
      }
    ),
    facility_abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_range_abbr(self@facility_range)
      }
    ),
    facility_name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        get_caid_range_name(self@facility_abbr)
      }
    )
  )
)

