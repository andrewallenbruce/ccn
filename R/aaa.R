#' @include states.R
NULL

#' @noRd
PropExtension <- S7::new_property(class = NULL | S7::class_character)

#' @noRd
Sequence <- S7::new_class(
  name       = "Sequence",
  properties = list(
    number   = S7::class_character,
    range    = S7::class_character
  )
)

#' @noRd
SequenceFull <- S7::new_class(
  name       = "SequenceFull",
  parent     = Sequence,
  properties = list(
    abbr     = S7::class_character,
    desc     = S7::class_character
  )
)

#' @noRd
Type <- S7::new_class(
  name       = "Type",
  properties = list(
    code     = S7::class_character,
    abbr     = S7::class_character,
    desc     = S7::class_character
  )
)

#' @noRd
CCN <- S7::new_class(
  name        = "CCN",
  properties  = list(
    ccn       = S7::class_character,
    entity    = S7::class_character,
    state     = State,
    sequence  = Sequence | SequenceFull
  )
)

#' @noRd
SubUnit <- S7::new_class(
  name        = "SubUnit",
  properties  = list(
    ccn       = S7::class_character,
    entity    = S7::class_character,
    type      = Type
  )
)
