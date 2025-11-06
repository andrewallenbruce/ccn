#' @autoglobal
#' @noRd
is_letter <- function(x) {
  stringfish::sf_grepl(x, "[A-Z]", nthreads = 4L)
}

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
get_facility_code <- function(x, i = 3L) {
  get_str_impl(x, c(i, 6L))
}

#' @autoglobal
#' @noRd
get_three <- function(x) {
  get_str_impl(x, c(3L, 3L))
}

#' @autoglobal
#' @noRd
get_four <- function(x) {
  get_str_impl(x, c(4L, 4L))
}

#' @autoglobal
#' @noRd
get_six <- function(x) {
  get_str_impl(x, c(6L, 6L))
}

#' @autoglobal
#' @noRd
sequence_number_q35 <- function(x) {
  get_str_impl(x, c(3L, 5L))
}

#' @autoglobal
#' @noRd
sequence_number_q36 <- function(x) {
  get_str_impl(x, c(3L, 6L))
}

#' @autoglobal
#' @noRd
sequence_number_q46 <- function(x) {
  get_str_impl(x, c(4L, 6L))
}

#' @autoglobal
#' @noRd
sequence_number_q410 <- function(x) {
  get_str_impl(x, c(4L, 10L))
}

#' @autoglobal
#' @noRd
sequence_number_q56 <- function(x) {
  get_str_impl(x, c(5L, 6L))
}


