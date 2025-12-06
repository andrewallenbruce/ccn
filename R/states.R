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
#' state(sample(ccn::state_codes$code, 1L))
NULL

#' @noRd
str_state <- function(x) {
  substr(x, 1L, 2L)
}

#' @noRd
state_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::state_codes$code,
    outputs = ccn::state_codes$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
state_name <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::state_codes$code,
    outputs = ccn::state_codes$name,
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname state
#' @export
state <- function(x) {
  State(code = str_state(x))
}
