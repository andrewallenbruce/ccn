#' @include utils.R
NULL

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

#' @noRd
as_State <- function(x) {
  State(get_state_code(x))
}

#' State Codes, Abbreviations, and Names
#'
#' @description
#' Convert state codes to their abbreviations or full names.
#'
#' @param x character vector of state codes to look up.
#' @name states
#' @returns character vector of names associated with codes.
#' @examples
#' get_state_code(c("A5XXX", "14XXXXX"))
#'
#' (x <- sample(ccn:::state_codes, 5L))
#'
#' all(is_state_code(x))
#'
#' (x <- get_state_abbr(x))
#'
#' get_state_name(x)
NULL

#' @rdname states
#' @export
is_state_code <- make_test(STATE$CODE)

#' @rdname states
#' @export
get_state_code <- function(x) {
  substr_(x, c(1L, 2L))
}

#' @rdname states
#' @export
get_state_abbr <- make_switch(STATE$CODE)

#' @rdname states
#' @export
get_state_name <- make_switch(STATE$NAME)
