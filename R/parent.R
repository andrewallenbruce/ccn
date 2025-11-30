#' IPPS Excluded Unit Codes
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name parent
#' @returns character vector of names associated with codes.
#' @examples
#' x <- c("02TA01", "04SD38", "52TA05")
#' get_unit_sequence(x)
#' get_parent_ccn(x)
NULL

#' @rdname parent
#' @export
ipps_excluded_unit_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"),
    outputs = c(rep.int("LTCH", 3), "REHAB", "CHILD", rep.int("PSYCH", 5)),
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname parent
#' @export
ipps_excluded_unit_prefix <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"),
    outputs = c(20:22, "30", "33", 40:44),
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname parent
#' @export
get_unit_sequence <- function(x) {
  paste0(ipps_excluded_unit_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L)))
}

#' @rdname parent
#' @export
get_parent_ccn <- function(x) {
  paste0(substr_(x, c(1L, 2L)), get_unit_sequence(x))
}
