#' @include utils.R
NULL

#' IPPS Excluded Unit Lookups
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name parent
#' @returns character vector of names associated with codes.
#' @examples
#' x <- c("02TA01", "04SD38", "52TA05")
#' get_parent_prefix(x)
#' get_parent_abbr(x)
#' get_unit_sequence(x)
#' get_parent_ccn(x)
NULL

#' @rdname parent
#' @export
get_parent_prefix <- function(x) {
  unlist_(EXCLUDED$PARENT)[seq_along(EXCLUDED$PARENT) %% 2L == 0L][
    collapse::fmatch(substr_(x, 4L), rlang::names2(EXCLUDED$PARENT))]
}

#' @rdname parent
#' @export
get_parent_abbr <- function(x) {
  unlist_(EXCLUDED$PARENT)[seq_along(EXCLUDED$PARENT) %% 2L == 1L][
    collapse::fmatch(substr_(x, 4L), rlang::names2(EXCLUDED$PARENT))]
}

#' @rdname parent
#' @export
get_unit_sequence <- function(x) {
  if (length(x) == 1L) {
    return(to_string(c(
      get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))
    )))
  }
  purrr::map_chr(x, \(x) to_string(c(
    get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))
  )))
}

#' @rdname parent
#' @export
get_parent_ccn <- function(x) {
  if (length(x) == 1L) {
    return(to_string(c(substr_(x, c(
      1L, 2L
    )), get_unit_sequence(x))))
  }
  purrr::map_chr(x, \(x) to_string(c(substr_(x, c(
    1L, 2L
  )), get_unit_sequence(x))))
}
