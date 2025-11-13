#' @noRd
check_character <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!is.character(x)) {
    cli::cli_abort(
      c(
        "Input {.strong {arg}} must be a {.emph character} vector.",
        "x" = "You supplied a {.emph {typeof(x)}} vector."
      ),
      arg  = arg,
      call = call
    )
  }
}

#' @noRd
check_length <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!nchar(x) %in% c(6L, 10L)) {
    cli::cli_abort(
      c(
        "Input {.strong {arg}} must be {.emph 6 or 10 characters}.",
        "x" = "{.var {x}} is {.val {nchar(x)}} characters."),
      arg  = arg,
      call = call
    )
  }
}
