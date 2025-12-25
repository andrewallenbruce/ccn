#' State Codes
#'
#' @description
#' Convert state codes to their abbreviations or full names.
#'
#' @param x character vector of state codes to look up.
#' @name state
#' @returns S7 object of class `State`.
#' @examples
#' state("A5XXX")
#' state("00")
NULL

#' @noRd
state_region <- function(x) {
  vs(x, ccn::regions[["state"]], ccn::regions[["region"]])
}

#' @noRd
state_office <- function(x) {
  vs(x, ccn::regions[["state"]], ccn::regions[["office"]])
}

#' @noRd
state_abbr <- function(x) {
  vs(x, ccn::states[["code"]], ccn::states[["abbr"]])
}

#' @noRd
state_name <- function(x) {
  vs(x, ccn::states[["code"]], ccn::states[["name"]])
}

#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    abbr = S7::class_character,
    name = S7::class_character,
    region = S7::new_property(
      S7::class_integer,
      getter = function(self) {
        state_region(self@abbr)
      }
    ),
    office = S7::new_property(
      S7::class_character,
      getter = function(self) {
        state_office(self@abbr)
      }
    )
  ),
  constructor = function(code) {
    if (length(code) != 1L) {
      check_arg(code, "must be length {.strong 1}.")
    }
    if (nchar(code) != 2L) {
      check_arg(code, "must be {.strong 2} characters.")
    }
    if (!is_state_code(code)) {
      check_arg(code, "{.val {x}} is an invalid state code.")
    }
    S7::new_object(
      S7::S7_object(),
      abbr = state_abbr(code),
      name = state_name(code)
    )
  }
)

#' @rdname state
#' @export
state <- function(x) {
  State(code = substring(x, 1L, 2L))
}
