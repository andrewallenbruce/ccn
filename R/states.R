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
#' state(sample(ccn::state_codes$code, 5L)) # should only accept length 1
NULL

#' @noRd
state_abbr <- function(x) {
  vs(x, ccn::state_codes[["code"]], ccn::state_codes[["abbr"]])
}

#' @noRd
state_name <- function(x) {
  vs(x, ccn::state_codes[["code"]], ccn::state_codes[["name"]])
}

#' @rdname state
#' @export
state <- function(x) {
  State(code = str_ste(x))
}
