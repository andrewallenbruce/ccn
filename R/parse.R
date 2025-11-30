#' Parse CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name parse
#' @returns character vector of names associated with codes.
#' @examples
#' parse_medicare("670055")
#' parse_opo("05P001")
#' parse_emergency("12345E")
#' parse_supplier("10C0001062")
#' parse_excluded("21T101")
#' parse_excluded_unit("02TA01")
NULL

#' @rdname parse
#' @export
parse_excluded <- function(x) {
  # IPPS Excluded Provider:
  # "21T101" -> "21 T 101"

  unlist_(c(
    x,
    "IPPS Excluded Provider",
    strsplit(
      gsub(
        "([A-Z0-9]{2})([A-Z])([0-9]{3})",
        "\\1 \\2 \\3",
        x,
        perl = TRUE),
      split = " ",
      fixed = TRUE
    ))) |>
    rlang::set_names(c("ccn", "entity", "state", "type", "sequence"))

}

#' @rdname parse
#' @export
parse_medicaid_only <- function(x) {
  # Medicaid Only Provider:
  # "01L008" -> "01 L 008"

  unlist_(c(
    x,
    "Medicaid Only Provider",
    strsplit(
      gsub(
        "([A-Z0-9]{2})([A-Z])([0-9]{3})",
        "\\1 \\2 \\3",
        x,
        perl = TRUE),
      split = " ",
      fixed = TRUE
    ))) |>
    rlang::set_names(c("ccn", "entity", "state", "type", "sequence"))
}

#' @rdname parse
#' @export
parse_opo <- function(x) {
  # Medicare OPO Provider:
  # "05P001" -> "05 P 001"

  unlist_(c(
    x,
    "Medicare Provider",
    strsplit(
      gsub(
        "([A-Z0-9]{2})([P])([0-9]{3})",
        "\\1 \\2 \\3",
        x,
        perl = TRUE),
      split = " ",
      fixed = TRUE
    ))) |>
    rlang::set_names(c("ccn", "entity", "state", "type", "sequence"))
}

#' @rdname parse
#' @export
parse_medicare <- function(x) {
  # Medicare Provider:
  # "670055" -> "67 0055"

  unlist_(c(
    x,
    "Medicare Provider",
    strsplit(
      gsub(
        "([A-Z0-9]{2})([0-9]{4})",
        "\\1 \\2",
        x,
        perl = TRUE),
      split = " ",
      fixed = TRUE
      )
    )
  ) |>
    rlang::set_names(c("ccn", "entity", "state", "sequence"))
}

#' @rdname parse
#' @export
parse_emergency <- function(x) {
  # Emergency Hospital:
  # "12345E" -> "12 E 345"

  c(x, "Emergency Hospital", strsplit(
    gsub("([A-Z0-9]{2})([0-9]{3})([E])", "\\1 \\3 \\2", x, perl = TRUE),
    " ",
    fixed = TRUE
  )) |>
    unlist_() |>
    rlang::set_names(c("ccn", "entity", "state", "type", "sequence"))
}

#' @rdname parse
#' @export
parse_supplier <- function(x) {
  # Medicare Supplier:
  # "10C0001062" -> "10 C 0001062"

  c(x, "Medicare Supplier", strsplit(
    gsub("([A-Z0-9]{2})([CDX])([0-9]{7})", "\\1 \\2 \\3", x, perl = TRUE),
    " ",
    fixed = TRUE
  )) |>
    unlist_() |>
    rlang::set_names(c("ccn", "entity", "state", "type", "sequence"))
}

#' @rdname parse
#' @export
parse_excluded_unit <- function(x) {
  # IPPS Excluded Unit:
  # "02TA01" -> "02 T A 01"

  c(
    x,
    "IPPS Excluded Unit",
    strsplit(
    gsub("([A-Z0-9]{2})([A-Z])([A-Z])([0-9]{2})", "\\1 \\2 \\3 \\4", x, perl = TRUE),
    " ",
    fixed = TRUE
  )) |>
    unlist_() |>
    rlang::set_names(c("ccn", "entity", "state", "type", "parent", "sequence"))
}
