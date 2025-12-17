#' @noRd
check_arg <- function(
  x,
  msg,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  cli::cli_abort(paste("{.arg {arg}}", msg), arg = arg, call = call)
}

#' @noRd
check_range <- function(x, bounds, name) {
  if (as.integer(x) < bounds[1L]) {
    cli::cli_abort(
      c(
        "i" = "The {.emph {name}} facility range is {.strong [{(toString(bounds))}]}.",
        "x" = "Input {.strong {x}} is less than the lower bound."
      )
    )
  }

  if (as.integer(x) > bounds[2L]) {
    cli::cli_abort(
      c(
        "i" = "The {.emph Medicare} facility range is {.strong [{(toString(bounds))}]}.",
        "x" = "Input {.strong {x}} is greater than the upper bound."
      )
    )
  }
}

#' @noRd
check_state <- function(x) {
  if (!is_state_code(x)) {
    cli::cli_abort(c("x" = "{.strong {x}} is not a valid state code."))
  }
}
