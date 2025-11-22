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
  x %in_% c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K")
}

#' @rdname parent
#' @export
ipps_excluded_unit_abbr <- function(x) {
  cheapr::case(
    x == "D" ~ "REHAB",
    x == "E" ~ "CHILD",
    x %in_% c("A", "B", "C") ~ "LTCH",
    x %in_% c("F", "G", "H", "J", "K") ~ "PSYCH",
    .default = NA_character_
  )
}
#' @rdname parent
#' @export
ipps_excluded_unit_prefix <- function(x) {
  cheapr::val_match(
    x,
    "A" ~ "20",
    "B" ~ "21",
    "C" ~ "22",
    "D" ~ "30",
    "E" ~ "33",
    "F" ~ "40",
    "G" ~ "41",
    "H" ~ "42",
    "J" ~ "43",
    "K" ~ "44",
    .default = NA_character_
  )
}

#' @rdname parent
#' @export
get_unit_sequence <- function(x) {
  to_string(
    c(ipps_excluded_unit_prefix(substr_(x, 4L)),
      substr_(x, c(5L, 6L))))
}

#' @rdname parent
#' @export
get_parent_ccn <- function(x) {
  to_string(
    c(substr_(x, c(1L, 2L)),
      get_unit_sequence(x)))
}
