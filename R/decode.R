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
      c("Input {.strong {arg}} must be a {.emph character} vector.",
        "x" = "You supplied a {.emph {typeof(x)}} vector."),
      arg  = arg,
      call = call
    )
  }

  x     <- if (has_hyphen(x)) remove_hyphen(x) else x
  chars <- nchars_(x)

  switch(
    chars,
    "6" = decode_six(x),
    # "10" = decode_ten(x),
    cli::cli_abort(
      c("Input {.strong {arg}} must be {.emph 6 or 10 characters}.",
        "x" = "{.var {x}} is {.val {chars}} characters."),
      arg  = arg,
      call = call
    )
  )
}

#' @noRd
#' @autoglobal
decode_state <- function(x) {
  fastplyr::list_tidy(
    code = get_code_state(x),
    name = state_name(code)) |>
    unlist()
}

#' @noRd
#' @autoglobal
decode_six <- function(x) {
  three <- get_three(x)
  alpha <- is_letter(three)
}

#' @noRd
#' @autoglobal
decode_six_medicare <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    Q36 = get_seq_Q36(ccn))
}

#' @noRd
#' @autoglobal
decode_six_medicare_organ <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    P = get_three(ccn),
    Q46 = get_seq_Q46(ccn)
  )
}

#' @noRd
#' @autoglobal
decode_six_medicaid_only <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    T = get_three(ccn),
    Q46 = get_seq_Q46(ccn)
  )
}

#' @noRd
#' @autoglobal
decode_six_ipps_excluded <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    T = get_three(ccn),
    A = get_four(ccn),
    Q56 = get_seq_Q56(ccn)
  )
}

#' @noRd
#' @autoglobal
decode_six_emergency <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    Q35 = get_seq_Q35(ccn),
    E = get_six(ccn)
  )
}

#' @noRd
#' @autoglobal
decode_ten_supplier <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    T = get_three(ccn),
    Q410 = get_seq_Q410(cnn)
  )
}
