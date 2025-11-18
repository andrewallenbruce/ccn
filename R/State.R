#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_state_abbr(self@code)
    ),
    name = S7::new_property(
      S7::class_character,
      getter = function(self)
        get_state_name(self@abbr)
    )
  )
)
