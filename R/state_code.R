#' State Code Conversions
#' @description
#' Convert CCN state codes to their abbreviations or full names.
#' Convert state abbreviations to their RO region or office (city).
#' @param abbr character vector of 2-character state abbreviations.
#' @param code character vector of 2-character CCN state codes.
#' @param ccn 6-character CCN code.
#' @name state_code
#' @returns S7 object of class `State`.
#' @examples
#' state_region(abbr = "CA")
#' state_office(abbr = "NY")
#' state_abbr(code = c("00", "A5", "01", "99"))
#' state_name(code = c("00", "A5", "01", "99"))
#' state(ccn = "A5XXX")
#' state(ccn = "869999")
NULL

#' @rdname state_code
#' @export
state_abbr <- function(code) {
  vs(code, ccn::states$code, ccn::states$abbr)
}

#' @rdname state_code
#' @export
state_name <- function(code) {
  vs(code, ccn::states$code, ccn::states$name)
}

#' @rdname state_code
#' @export
state_region <- function(abbr) {
  vs(abbr, ccn::regions$state, ccn::regions$region)
}

#' @rdname state_code
#' @export
state_office <- function(abbr) {
  vs(abbr, ccn::regions$state, ccn::regions$office)
}

#' @noRd
nchar_is_state <- function(x) {
  collapse::vlengths(x) == 2L
}

#' @noRd
is_state_code <- function(x) {
  x %chin% ccn::states$code
}

#' @noRd
is_valid_state_code <- function(x) {
  is.character(x) & nchar_is_state(x) & is_state_code(x)
}

#' @noRd
all_valid_state_code <- function(x) {
  collapse::allv(is_valid_state_code(x), TRUE)
}

#' @noRd
which_not_state_code <- function(x) {
  collapse::whichv(is_valid_state_code(x), FALSE)
}

#' @noRd
check_states <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!all_valid_state_code(x)) {
    i <- which_not_state_code(x)
    n <- length(i)
    cli::cli_abort(
      c(
        "{.strong {n}} Invalid State {cli::qty(n)} Code{?s}:",
        "x" = "{.val {x[i]}}"
      ),
      arg = arg,
      call = call
    )
  }
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
    check_states(code)
    S7::new_object(
      S7::S7_object(),
      abbr = state_abbr(code),
      name = state_name(code)
    )
  }
)

#' @rdname state_code
#' @export
state <- function(ccn) {
  State(code = substring(ccn, 1L, 2L))
}
