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
  check_character(x, arg = arg, call = call)
  check_length(remove_hyphen(x), arg = arg, call = call)
  decode_init(x)
}

#' @noRd
#' @autoglobal
decode_init <- function(x) {
  fastplyr::list_tidy(
    raw = x,
    std = remove_hyphen(raw),
    chr = nchar(std),
    vec = stringfish::sf_split(std, "", fixed = TRUE, nthreads = 4L)[[1]]
  )
}

# decode_init <- function(x) {
#   list(
#     input = x,
#     length = nchar(x),
#     split = stringfish::sf_split(x, "", fixed = TRUE, nthreads = 4L)[[1]],
#     state = get_str(x, c(1L, 2L)),
#     check = c(
#       "3" = get_str(x, c(3L, 3L)),
#       "4" = get_str(x, c(4L, 4L)),
#       "6" = get_str(x, c(6L, 6L))
#     ),
#     sequence = get_str(x, c(3L, nchar(x)))
#   )
# }

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
