#' @autoglobal
#' @noRd
get_nchars <- function(x) {
  stringfish::sf_nchar(x, nthreads = 4L)
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
get_code_state <- function(x) {
  stringfish::sf_substr(x, 1L, 2L, nthreads = 4L)
}

#' @autoglobal
#' @noRd
has_code_unit <- function(x) {
  stringfish::sf_grepl(x, "[A-Z]", nthreads = 4L)
}

#' @autoglobal
#' @noRd
get_code_unit <- function(x) {
  stringfish::sf_substr(x, 3L, 3L, nthreads = 4L)
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
