#' @noRd
Sequence <- S7::new_class(
  name = "Sequence",
  # abstract = TRUE,
  properties = list(
    number = S7::class_character,
    range = S7::class_character
  )
)

#' @noRd
SequenceFull <- S7::new_class(
  name = "SequenceFull",
  parent = Sequence,
  # abstract = TRUE,
  properties = list(
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
OpoSequence <- S7::new_class(
  name = "OpoSequence",
  parent = Sequence,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_opo(self@number)
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
        range_supplier(self@number)
    )
  )
)

#' @noRd
EmergencySequence <- S7::new_class(
  name = "EmergencySequence",
  parent = Sequence,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_emergency(self@number)
    )
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
        range_medicare(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_medicare_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_medicare_desc(self@abbr)
    )
  )
)

#' @noRd
MedicaidOnlySequence <- S7::new_class(
  name = "MedicaidOnlySequence",
  parent = SequenceFull,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_medicaid_only(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_medicaid_only_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        range_medicaid_only_desc(self@abbr)
    )
  )
)
