#' @noRd
#' @autoglobal
Unknown <- S7::new_class(
  name = "Unknown",
  properties = list(
    raw = S7::class_character,
    std = S7::new_property(
      S7::class_character,
      getter = function(self) {
        clean(self@raw)
      }
    ),
    chr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        nchar_(self@std)
      }
    ),
    vec = S7::new_property(
      S7::class_character,
      getter = function(self) {
        split_(self@std)
      }
    )
  )
)

#' @noRd
#' @autoglobal
CCN <- S7::new_class(
  name              = "CCN",
  abstract          = TRUE,
  properties        = list(
    ccn             = S7::class_character,
    state_code      = S7::new_property(
      S7::class_character,
      setter = function(self, value) {
        self@state_code <- string(value)
        self
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
#' @autoglobal
Provider <- S7::new_class(
  name   = "Provider",
  parent = CCN
)

#' @noRd
#' @autoglobal
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(
    supplier_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
MedicareProvider <- S7::new_class(
  name   = "MedicareProvider",
  parent = Provider
)

#' @noRd
#' @autoglobal
MedicareProviderOPO <- S7::new_class(
  name   = "MedicareProviderOPO",
  parent = MedicareProvider,
  properties = list(
    facility_type = S7::new_property(
      S7::class_character,
      default = "P"
      )
    )
  )

#' @noRd
#' @autoglobal
EmergencyHospital <- S7::new_class(
  name   = "EmergencyHospital",
  parent = Provider,
  properties = list(
    emergency_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
MedicaidOnlyProvider <- S7::new_class(
  name   = "MedicaidOnlyProvider",
  parent = Provider,
  properties = list(
    facility_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
IPPSExcludedProvider <- S7::new_class(
  name   = "IPPSExcludedProvider",
  parent = Provider,
  properties = list(
    facility_type = S7::class_character,
    parent_type = S7::class_character
  )
)
