#' State Codes
#'
#' @description
#' Convert state codes to their abbreviations or full names.
#'
#' @param x character vector of state codes to look up.
#' @name states
#' @returns character vector of names associated with codes.
#' @examples
#' (x <- sample(ccn::state_codes$code, 5L))
#' is_state(x)
#' state_abbr(x)
#' state_name(x)
#'
#' extract_state(c("A5XXX", "14XXXXX"))
#' state("A5XXX")
NULL

#' @rdname states
#' @export
is_state <- function(x) {
  x %in_% ccn::state_codes$code
}

#' @rdname states
#' @export
extract_state <- function(x) {
  substr_(x, c(1L, 2L))
}

#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        state_abbr(self@code)
    ),
    name = S7::new_property(
      S7::class_character,
      getter = function(self)
        state_name(self@code)
    )
  )
)

#' @rdname states
#' @export
state <- function(x) {
  State(code = extract_state(x))
}

#' @rdname states
#' @export
state_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::state_codes$code,
    outputs = ccn::state_codes$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname states
#' @export
state_name <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::state_codes$code,
    outputs = ccn::state_codes$name,
    default = NA_character_,
    nThread = 4L
  )
}
