#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self) {
        state_abbr(self@code)
      }
    ),
    name = S7::new_property(
      S7::class_character,
      getter = function(self) {
        state_name(self@code)
      }
    )
  )
)

#' @noRd
Extension <- S7::new_property(S7::class_character, default = NA_character_)

#' @noRd
Range <- S7::new_class(
  name = "Range",
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
  properties = list(
    code = S7::class_character,
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
    sequence = S7::class_character,
    range = S7::class_character | Range
  )
)

#' @noRd
Medicare <- S7::new_class(
  name = "Medicare",
  parent = CCN,
  properties = list(ext = Extension)
)

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(
    type = Type,
    ext = Extension
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

#' @noRd
Unit <- S7::new_class(
  name = "Unit",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Subunit <- S7::new_class(
  name = "Subunit",
  properties = list(
    ccn = S7::class_character,
    type = Type
  )
)

#' @noRd
Parent <- S7::new_class(
  name = "Parent",
  parent = Medicare,
  properties = list(subunit = Subunit)
)
