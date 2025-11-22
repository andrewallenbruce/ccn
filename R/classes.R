#' @include states.R
#' @include ranges.R
#' @include types.R
#' @include sequence.R
NULL

#' @noRd
CCN <- S7::new_class(
  name        = "CCN",
  properties  = list(
    number    = S7::class_character,
    state     = State,
    sequence  = Sequence,
    type      = Type,
    extension = S7::new_property(
      S7::class_character,
      default = NA_character_
    )
  )
)

#' @noRd
MedicareSupplier <- S7::new_class("MedicareSupplier", CCN)

#' @noRd
EmergencyHospital <- S7::new_class("EmergencyHospital", CCN)

#' @noRd
MedicareProvider <- S7::new_class("MedicareProvider", CCN)

#' @noRd
MedicareOPO <- S7::new_class("MedicareOPO", CCN)

#' @noRd
MedicaidOnly <- S7::new_class("MedicaidOnly", CCN)

#' @noRd
IppsExcludedProvider <- S7::new_class("IppsExcludedProvider", CCN)

#' @noRd
IppsExcludedParent <- S7::new_class(
  "IppsExcludedParent",
  properties = list(
    type = S7::new_property(
      S7::class_character,
      default = NA_character_
    ),
    ccn = S7::new_property(
      S7::class_character,
      default = NA_character_
    )
  )
)

#' @noRd
IppsExcludedUnit <- S7::new_class(
  "IppsExcludedUnit",
  IppsExcludedProvider,
  properties = list(
    parent = IppsExcludedParent
  )
)
