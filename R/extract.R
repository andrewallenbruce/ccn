#' @noRd
get_state <- function(x) {
  substr_(x, c(1L, 2L))
}

#' @noRd
get_type <- function(x) {
  substr_(x, 3L)
}

#' @noRd
get_seq <- function(x, end = 6L) {
  substr_(x, c(3L, end))
}

#' @noRd
get_seq2 <- function(x) {
  substr_(x, c(4L, 10L))
}

#' @noRd
get_seq3 <- function(x) {
  substr_(x, c(4L, 6L))
}

