#' State Codes
#'
#' @description
#' Convert state codes to their abbreviations or full names.
#'
#' @param x character vector of state codes to look up.
#' @param ... unused.
#' @name state
#' @returns S7 object of class `State`.
#' @examples
#' state("A5XXX")
#' state(sample(ccn::state_codes$code, 1L))
NULL

#' @noRd
state_abbr <- function(x) {
  vs(x, ccn::state_codes[["code"]], ccn::state_codes[["abbr"]])
}

#' @noRd
state_name <- function(x) {
  vs(x, ccn::state_codes[["code"]], ccn::state_codes[["name"]])
}

#' @noRd
State <- S7::new_class(
  name = "State",
  properties = list(
    abbr = S7::class_character,
    name = S7::class_character
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
`print.ccn::State` <- function(x, ...) {
  cli::cli_text("<{cli::col_cyan(class(x)[1])}>")

  glue::glue(
    '{cli::col_silver(format(S7::prop_names(x), justify = "right"))}',
    '{cli::col_grey(":")} {unname(S7::props(x))}'
  ) |>
    cat(sep = "\n")

  invisible(x)
}

#' @rdname state
#' @export
state <- function(x) {
  State(code = substring(x, 1L, 2L))
}
