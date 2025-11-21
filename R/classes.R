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
    type = OpoType,
    sequence = OpoSequence
  )
)

#' @noRd
MedicaidOnlyProvider <- S7::new_class(
  name = "MedicaidOnlyProvider",
  parent = Provider,
  properties = list(
    type = MedicaidOnlyType | IppsExcludedType,
    sequence = MedicaidOnlySequence | MedicareSequence
  )
)

#' @noRd
IppsExcludedProvider <- S7::new_class(
  name = "IppsExcludedProvider",
  parent = MedicaidOnlyProvider,
  properties = list(type = IppsExcludedType)
)

#' @noRd
IppsExcludedUnitParent <- S7::new_class(
  name = "IppsExcludedUnitParent",
  properties = list(
    code = S7::class_character,
    number = S7::class_character
  )
)

#' @noRd
IppsExcludedUnit <- S7::new_class(
  name = "IppsExcludedUnit",
  parent = IppsExcludedProvider,
  properties = list(parent = IppsExcludedUnitParent)
)
