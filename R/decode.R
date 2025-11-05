#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#' @param arg argument used for error messaging.
#' @param call environment used for error messaging.
#' @return list of CCN components.
#' @examples
#' decode("670055")
#' decode("21-0101")
#' decode("21-T101")
#' @export
#' @autoglobal
decode <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!is.character(x)) {
    cli::cli_abort(
      c(
        "Input {.strong {arg}} must be a {.emph character} vector.",
        "x" = "You supplied a {.emph {typeof(x)}} vector."
      ),
      arg = arg,
      call = call
    )
  }

  x     <- if (has_hyphen(x)) remove_hyphen(x) else x
  chars <- get_nchars(x) |> as.character()

  switch(
    chars,
    "6" = decode_six(x),
    # "10" = decode_ten(x),
    cli::cli_abort(
      c("Input {.strong {arg}} must be {.emph 6 or 10 characters}.", "x" = "{.var {x}} is {.val {chars}} characters."),
      arg = arg,
      call = call
    )
  )
}

#' @noRd
#' @autoglobal
decode_six <- function(x) {

  unit <- get_code_unit(x)
  has  <- has_code_unit(unit)
  unit <- if (has) unit else NULL

  fastplyr::list_tidy(
    ccn           = x,
    CODE_state    = get_code_state(ccn),
    CODE_unit     = get_code_unit(ccn),
    CODE_facility = get_code_facility(ccn, if (has) 4L else 3L),
    .keep_null    = FALSE
  )
}
