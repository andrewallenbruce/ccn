#' @include state_code.R

#' @noRd
Extension <- S7::new_property(S7::class_character, default = NA_character_)

#' @noRd
Range <- S7::new_class(
  name = "Range",
  properties = list(
    series = S7::class_character,
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
Type <- S7::new_class(
  name = "Type",
  properties = list(
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
CCN <- S7::new_class(
  name = "CCN",
  properties = list(
    ccn = S7::class_character,
    state = State,
    range = S7::class_character | Range
  )
)

#' @noRd
Medicare <- S7::new_class(
  name = "Medicare",
  parent = CCN,
  properties = list(extension = Extension)
)

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(
    type = Type,
    extension = Extension
  )
)

#' @noRd
Emergency <- S7::new_class(
  name = "Emergency",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Organ <- S7::new_class(
  name = "Organ",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Medicaid <- S7::new_class(
  name = "Medicaid",
  parent = CCN,
  properties = list(type = Type)
)
