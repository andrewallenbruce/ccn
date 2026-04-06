#' @noRd
NAMES_CCN <- c("form", "state", "number", "type", "parent", "ext")

#' @noRd
TYPES_CCN <- c(
  "medicare",
  "emergency",
  "organ",
  "medicaid",
  "unit",
  "subunit",
  "supplier"
)

#' Provider: 670055 => 67 0055
#' @noRd
SS_NNNN <- function(x) {
  vctrs::vec_c(
    "M",
    substring(
      x,
      vctrs::vec_c(1L, 3L),
      vctrs::vec_c(2L, 6L)
    ),
    vctrs::vec_rep(NA_character_, 3L)
  ) |>
    rlang::set_names(NAMES_CCN)
}

#' Emergency: 12345E => 12 345 E
#' @noRd
SS_NNNT <- function(x) {
  vctrs::vec_c(
    "E",
    substring(
      x,
      vctrs::vec_c(1L, 3L, 6L),
      vctrs::vec_c(2L, 5L, 6L)
    ),
    vctrs::vec_rep(NA_character_, 2L)
  ) |>
    rlang::set_names(NAMES_CCN)
}

#' Organ: 05P001 => 05 P 001
#' Medicaid: 01L008 => 01 L 008
#' Unit: 21T101 => 21 T 101
#' @noRd
SS_TNNN <- function(x, form) {
  vctrs::vec_c(
    match.arg(form, c("O", "A", "U")),
    substring(
      x,
      vctrs::vec_c(1L, 4L, 3L),
      vctrs::vec_c(2L, 6L, 3L)
    ),
    vctrs::vec_rep(NA_character_, 2L)
  ) |>
    rlang::set_names(NAMES_CCN)
}

#' Subunit: 02TA01 => 02 T A 01
#' @noRd
SS_TPNN <- function(x) {
  vctrs::vec_c(
    "S",
    substring(
      x,
      vctrs::vec_c(1L, 5L, 3L, 4L),
      vctrs::vec_c(2L, 6L, 3L, 4L)
    ),
    vctrs::vec_rep(NA_character_, 1L)
  ) |>
    rlang::set_names(NAMES_CCN)
}

#' Supplier: 10C0001062 => 10 C 0001062
#' @noRd
SS_TN10 <- function(x) {
  vctrs::vec_c(
    "P",
    substring(
      x,
      vctrs::vec_c(1L, 6L, 3L),
      vctrs::vec_c(2L, 10L, 5L)
    ),
    vctrs::vec_rep(NA_character_, 2L)
  ) |>
    rlang::set_names(NAMES_CCN)
}
