#' @noRd
SupplierType <- S7::new_class(
  name = "SupplierType",
  parent = Type,
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
OpoType <- S7::new_class(
  name = "OpoType",
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

#' @noRd
MedicaidOnlyType <- S7::new_class(
  name = "MedicaidOnlyType",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_caid_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_caid_name(self@abbr)
    )
  )
)

#' @noRd
IppsExcludedType <- S7::new_class(
  name = "IPPSExcludedType",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_ipps_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_ipps_name(self@abbr)
    )
  )
)
