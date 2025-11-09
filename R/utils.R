#' @autoglobal
#' @noRd
get_facility_code <- function(x, i = 3L) {
  get_str(x, c(i, 6L))
}

#' @autoglobal
#' @noRd
get_three <- function(x) {
  get_str(x, c(3L, 3L))
}

#' @autoglobal
#' @noRd
get_four <- function(x) {
  get_str(x, c(4L, 4L))
}

#' @autoglobal
#' @noRd
get_six <- function(x) {
  get_str(x, c(6L, 6L))
}

#' @autoglobal
#' @noRd
sequence_number_q35 <- function(x) {
  get_str(x, c(3L, 5L))
}

#' @autoglobal
#' @noRd
sequence_number_q36 <- function(x) {
  get_str(x, c(3L, 6L))
}

#' @autoglobal
#' @noRd
sequence_number_q46 <- function(x) {
  get_str(x, c(4L, 6L))
}

#' @autoglobal
#' @noRd
sequence_number_q410 <- function(x) {
  get_str(x, c(4L, 10L))
}

#' @autoglobal
#' @noRd
sequence_number_q56 <- function(x) {
  get_str(x, c(5L, 6L))
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

