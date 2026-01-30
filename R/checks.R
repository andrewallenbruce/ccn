#' @noRd
check_character <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!is.character(x)) {
    cli::cli_abort(
      c(
        "Input {.arg {arg}} must be a {.cls character} vector.",
        "x" = "You've supplied a {.cls {class(x)}} vector."
      ),
      arg = arg,
      call = call
    )
  }
}

#' @noRd
check_length <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!nchar(x) %in% 6:10) {
    cli::cli_abort(
      c(
        "Input {.arg {arg}} must be between {.emph 6 - 10 characters}.",
        "x" = "{.var {x}} is {.val {nchar(x)}} character{?s}."
      ),
      arg = arg,
      call = call
    )
  }
}

#' @noRd
check_arg <- function(
  x,
  msg,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  cli::cli_abort(paste("{.arg {arg}}", msg), arg = arg, call = call)
}

#' Check if x is within specified bounds
#'
#' @param x `<character>` Integer value to check
#' @param bounds `<integer>` Vector of length 2 specifying lower and upper bounds
#' @param name `<character>` Name of the range being checked (for error messages)
#' @param arg Argument name (for error messages); defaults to the calling argument name
#' @param call Calling environment (for error messages); defaults to the calling environment
#' @returns Invisibly returns NULL if x is within bounds; otherwise, throws an error
#'
#' @examplesIf rlang::is_interactive()
#' check_range("0000", c(1L, 9999L), "Medicare")
#' check_range("0000", c(1L, 999L), "Medicaid")
#' @noRd
check_range <- function(
  x,
  bounds,
  name,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (as.integer(x) < bounds[1L]) {
    cli::cli_abort(
      c(
        "i" = "The {.emph {name}} Facility Range is {.kbd {(toString(bounds))}}.",
        "x" = "{.val {as.integer(x)}} is less than {.pkg {bounds[1L]}}, the lower bound."
      ),
      arg = arg,
      call = call
    )
  }

  if (as.integer(x) > bounds[2L]) {
    cli::cli_abort(
      c(
        "i" = "The {.emph {name}} Facility Range is {.kbd {(toString(bounds))}}.",
        "x" = "{.val {as.integer(x)}} is greater than {.pkg {bounds[2L]}}, the upper bound."
      ),
      arg = arg,
      call = call
    )
  }
}

#' Check if x is between min and max (inclusive)
#'
#' @param x Integer vector to check
#' @param min Minimum value (inclusive)
#' @param max Maximum value (inclusive)
#' @returns Logical vector indicating if each element of x is between min and max
#' @examplesIf rlang::is_interactive()
#' in_between(5L, 10L, 15L)
#' in_between(1L, 2L, 3L)
#' in_between(0L, 5L, 10L)
#' @noRd
in_between <- function(x, min, max) {
  (x - min) * (max - x) >= 0L
}

#' @noRd
check_range2 <- function(x, min, max = 9999L, name = "Medicare") {
  x <- as.integer(x)
  if (!in_between(x, min, max)) {
    cli::cli_abort(
      c(
        "x" = "{.val {x}} outside {.strong {name}} range {.kbd {toString(c(min, max))}}."
      )
    )
  }
}
