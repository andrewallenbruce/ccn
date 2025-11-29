#' @noRd
prop_ccn <- function(x) {
  S7::prop(x, "ccn")
}

#' @noRd
props_sequence <- function(x) {
  S7::prop(x, "sequence") |>
    S7::props() |>
    prefix_names("seq")
}

#' @noRd
props_state <- function(x) {
  S7::prop(x, "state") |>
    S7::props() |>
    prefix_names("state")
}

#' @noRd
props_type <- function(x) {
  S7::prop(x, "type") |>
    S7::props() |>
    prefix_names("type")
}

#' @noRd
props_parent <- function(x) {
  S7::prop(x, "parent") |>
    S7::props() |>
    prefix_names("parent")
}

#' @noRd
prop_ext <- function(x) {
  S7::prop(x, "extension")
}
