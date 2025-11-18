#' @noRd
Type <- S7::new_class(
  name       = "Type",
  abstract   = TRUE,
  properties = list(
    code     = S7::class_character,
    abbr     = S7::class_character,
    desc     = S7::class_character
  )
)

#' @noRd
SupplierType <- S7::new_class(
  name       = "SupplierType",
  parent     = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_supplier_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_supplier_name(self@abbr)
    )
  )
)

#' @noRd
EmergencyType <- S7::new_class(
  name       = "EmergencyType",
  parent     = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_emergency_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_emergency_name(self@abbr)
    )
  )
)

#' @noRd
OPOType <- S7::new_class(
  name = "OPOType",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_opo_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_opo_name(self@abbr)
    )
  )
)
