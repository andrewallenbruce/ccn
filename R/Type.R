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

# supplier_type <- function(x) {
#   SupplierType(
#     code = substr_(x@number, 3L),
#     abbr = get_supplier_abbr(self@code)
#   )
# }

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
IPPSExcludedType <- S7::new_class(
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
