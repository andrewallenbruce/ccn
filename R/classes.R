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
  name   = "SupplierCCN",
  parent = CCN
)

#' @noRd
#' @autoglobal
MedicareProviderCCN <- S7::new_class(
  name   = "MedicareProviderCCN",
  parent = ProviderCCN
)

#' @noRd
#' @autoglobal
MedicaidOnlyProviderCCN <- S7::new_class(
  name   = "MedicaidOnlyProviderCCN",
  parent = ProviderCCN
)

#' @noRd
#' @autoglobal
IPPSExcludedProviderCCN <- S7::new_class(
  name   = "IPPSExcludedProviderCCN",
  parent = ProviderCCN
)

#' @noRd
#' @autoglobal
EmergencyHospitalCCN <- S7::new_class(
  name   = "EmergencyHospitalCCN",
  parent = ProviderCCN
)
