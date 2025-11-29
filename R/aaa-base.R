#' @include states.R
NULL

#' @noRd
PropExtension <- S7::new_property(class = NULL | S7::class_character)

#' @noRd
Sequence <- S7::new_class(
  name = "Sequence",
  properties = list(
    number = S7::class_character,
    range = S7::class_character
  )
)

#' @noRd
SequenceFull <- S7::new_class(
  name = "SequenceFull",
  parent = Sequence,
  properties = list(
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

#' @noRd
Type <- S7::new_class(
  name = "Type",
  properties = list(
    code = S7::class_character,
    desc = S7::class_character,
    abbr = S7::class_character
  )
)

#' @noRd
CCN <- S7::new_class(
  name = "CCN",
  properties  = list(
    ccn = S7::class_character,
    entity = S7::class_character,
    state = State,
    sequence = Sequence | SequenceFull
  )
)

#' @noRd
IppsExcluded <- S7::new_class(
  name = "IppsExcluded",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
IppsExcludedParent <- S7::new_class(
  name = "IppsExcludedParent",
  properties = list(
    type = S7::class_character,
    ccn = S7::class_character
  )
)

#' @noRd
IppsExcludedUnit <- S7::new_class(
  name = "IppsExcludedUnit",
  parent = IppsExcluded,
  properties = list(
    type = Type,
    parent = IppsExcludedParent
  )
)
