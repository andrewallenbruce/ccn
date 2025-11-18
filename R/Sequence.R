#' @noRd
Sequence <- S7::new_class(
  name = "Sequence",
  abstract = TRUE,
  properties = list(
    number = S7::class_character,
    range = S7::class_character
  )
)

#' @noRd
SequenceFull <- S7::new_class(
  name = "SequenceFull",
  parent = Sequence,
  abstract = TRUE,
  properties = list(
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
MedicareSequence <- S7::new_class(
  name = "MedicareSequence",
  parent = SequenceFull,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_care_range(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_care_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_care_range_name(self@abbr)
    )
  )
)

#' @noRd
OPOSequence <- S7::new_class(
  name = "OPOSequence",
  parent = Sequence,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_opo_range(self@number)
    )
  )
)

#' @noRd
SupplierSequence <- S7::new_class(
  name = "SupplierSequence",
  parent = Sequence,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_supplier_range(self@number)
    )
  )
)
