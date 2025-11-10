#' @noRd
#' @autoglobal
RawCCN <- S7::new_class(
  name = "RawCCN",
  properties = list(
    raw = S7::class_character,
    std = S7::new_property(S7::class_character, getter = \(self) clean(self@raw)),
    chr = S7::new_property(S7::class_character, getter = \(self) nchar_(self@std)),
    vec = S7::new_property(S7::class_character, getter = \(self) split_(self@std))
  )
)

#' @noRd
#' @autoglobal
CCN <- S7::new_class(
  name              = "CCN",
  abstract          = TRUE,
  properties        = list(
    ccn             = S7::class_character,
    state_code      = S7::class_character,
    sequence_number = S7::class_character
  )
)

#' @noRd
#' @autoglobal
ProviderCCN <- S7::new_class(
  name   = "ProviderCCN",
  parent = CCN
)

#' @noRd
#' @autoglobal
SupplierCCN <- S7::new_class(
  name = "SupplierCCN",
  parent = CCN,
  properties = list(
    supplier_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
MedicareProviderCCN <- S7::new_class(
  name   = "MedicareProviderCCN",
  parent = ProviderCCN,
  properties = list(
    facility_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
MedicaidOnlyProviderCCN <- S7::new_class(
  name   = "MedicaidOnlyProviderCCN",
  parent = ProviderCCN,
  properties = list(
    facility_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
IPPSExcludedProviderCCN <- S7::new_class(
  name   = "IPPSExcludedProviderCCN",
  parent = ProviderCCN,
  properties = list(
    facility_type = S7::class_character,
    parent_type = S7::class_character
  )
)

#' @noRd
#' @autoglobal
EmergencyHospitalCCN <- S7::new_class(
  name   = "EmergencyHospitalCCN",
  parent = ProviderCCN,
  properties = list(
    emergency_type = S7::class_character
  )
)
