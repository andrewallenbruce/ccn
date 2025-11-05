#' @autoglobal
#' @noRd
has_hyphen <- function(x) {
  stringfish::sf_grepl(x, "-", fixed = TRUE, nthreads = 4L)
}

#' @autoglobal
#' @noRd
remove_hyphen <- function(x) {
  stringfish::sf_gsub(x, "-", "", fixed = TRUE, nthreads = 4L)
}

#' @autoglobal
#' @noRd
get_sequence_impl <- function(x, s) {
  stringfish::sf_substr(
    x        = x,
    start    = s[1],
    stop     = s[2],
    nthreads = 4L
  )
}

#' @autoglobal
#' @noRd
get_code_state <- function(x) {
  get_sequence_impl(x, c(1L, 2L))
}

#' @autoglobal
#' @noRd
get_seq_Q35 <- function(x) {
  get_sequence_impl(x, c(3L, 5L))
}

#' @autoglobal
#' @noRd
get_seq_Q36 <- function(x) {
  get_sequence_impl(x, c(3L, 6L))
}

#' @autoglobal
#' @noRd
get_seq_Q46 <- function(x) {
  get_sequence_impl(x, c(4L, 6L))
}

#' @autoglobal
#' @noRd
get_seq_Q410 <- function(x) {
  get_sequence_impl(x, c(4L, 10L))
}

#' @autoglobal
#' @noRd
get_seq_Q56 <- function(x) {
  get_sequence_impl(x, c(5L, 6L))
}

#' @autoglobal
#' @noRd
get_code_facility <- function(x, i = 3L) {
  stringfish::sf_substr(
    x        = x,
    start    = i,
    stop     = 6L,
    nthreads = 4L)
}

#' @autoglobal
#' @noRd
is_letter <- function(x) {
  stringfish::sf_grepl(x, "[A-Z]", nthreads = 4L)
}

#' @autoglobal
#' @noRd
get_three <- function(x) {
  get_sequence_impl(x, c(3L, 3L))
}

#' @autoglobal
#' @noRd
get_four <- function(x) {
  get_sequence_impl(x, c(4L, 4L))
}

#' @autoglobal
#' @noRd
get_six <- function(x) {
  get_sequence_impl(x, c(6L, 6L))
}
