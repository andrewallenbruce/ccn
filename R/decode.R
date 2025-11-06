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

  check_is_character(x, arg = arg, call = call)

  x <- if (has_hyphen(x)) remove_hyphen(x) else x

  switch(
    nchars_(x),
    `6` = decode_init(x),
    `10` = decode_init(x),
    abort_wrong_length(nchars_(x), arg = arg, call = call))
}

#' @noRd
#' @autoglobal
decode_init <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    state = get_str_impl(ccn, c(1L, 2L)),
    sequence = get_str_impl(ccn, c(1L, length(ccn)))
  )
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
    state = decode_state(ccn),
    q36 = sequence_number_q36(ccn))
}

#' @noRd
#' @autoglobal
decode_six_medicare_organ <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    P = get_three(ccn),
    q46 = sequence_number_q46(ccn)
  )
}

#' @noRd
#' @autoglobal
decode_six_medicaid_only <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    T = get_three(ccn),
    q46 = sequence_number_q46(ccn)
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
    q56 = sequence_number_q56(ccn)
  )
}

#' @noRd
#' @autoglobal
decode_six_emergency <- function(x) {
  fastplyr::list_tidy(
    ccn = x,
    SS = decode_state(ccn),
    q35 = sequence_number_q35(ccn),
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
    q410 = sequence_number_q410(cnn)
  )
}
