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
which_not_state <- function(x) {
  collapse::whichv(
    is.character(x) & nchar_is_state(x) & is_state_code(x),
    FALSE
  )
}

#' @noRd
all_are_state <- function(x) {
  collapse::allv(
    is.character(x) & nchar_is_state(x) & is_state_code(x),
    TRUE
  )
}

#' @noRd
check_all_are_state <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!all_are_state(x)) {
    not <- which_not_state(x)
    cli::cli_abort(
      c(
        '{.strong {length(not)}} Invalid:',
        ">" = "{.val {x[not]}}"
      ),
      arg = arg,
      call = call
    )
  }
}

#' @noRd
check_all_are_ccn <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!all_are_ccn(x)) {
    not <- which_not_ccn(x)
    cli::cli_abort(
      c(
        '{.strong {length(not)}} Invalid CCN{?s} detected:',
        "i" = '{.code {paste0("x[", paste(not, collapse = ", "), "]")}}',
        ">" = "{.pkg {x[not]}}"
      ),
      arg = arg,
      call = call
    )
  }
}
