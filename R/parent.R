#' IPPS Excluded Unit Codes
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name parent
#' @returns character vector of names associated with codes.
#' @examples
#' x <- LETTERS
#' x[is_type_ipps_excluded_unit(x)]
#' ipps_excluded_unit_abbr(x[is_type_ipps_excluded_unit(x)])
#' ipps_excluded_unit_prefix(x[is_type_ipps_excluded_unit(x)])
#'
#' x <- c("02TA01", "04SD38", "52TA05")
#' get_unit_sequence(x)
#' get_parent_ccn(x)
NULL

#' @rdname parent
#' @export
is_type_ipps_excluded_unit <- function(x) {
  vctrs::vec_in(x, c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"))
}

#' @rdname parent
#' @export
ipps_excluded_unit_abbr <- function(x) {
  vctrs::vec_recode_values(
    x,
    from = c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"),
    to = c(rep.int("LTCH", 3), "REHAB", "CHILD", rep.int("PSYCH", 5)),
    default = NA_character_
  )
}

#' @rdname parent
#' @export
ipps_excluded_unit_prefix <- function(x) {
  vctrs::vec_recode_values(
    x,
    from = c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K"),
    to = c(20:22, "30", "33", 40:44),
    default = NA_character_
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
