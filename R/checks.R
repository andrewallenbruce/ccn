#' @noRd
check_character <- function(x,
                            arg = rlang::caller_arg(x),
                            call = rlang::caller_env()) {
  if (!is.character(x)) {
    cli::cli_abort(
      c("Input {.arg {arg}} must be a {.cls character} vector.",
        "x" = "You've supplied a {.cls {class(x)}} vector."),
      arg  = arg,
      call = call
    )
  }
}

#' @noRd
check_length <- function(x,
                         arg = rlang::caller_arg(x),
                         call = rlang::caller_env()) {
  if (!nchar(x) %in% 6:10) {
    cli::cli_abort(
      c("Input {.arg {arg}} must be between {.emph 6 - 10 characters}.",
        "x" = "{.var {x}} is {.val {nchar(x)}} character{?s}."),
      arg  = arg,
      call = call
    )
  }
}
