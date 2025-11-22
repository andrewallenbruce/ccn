#' @noRd
props_sequence <- function(x) {
  S7::prop(x, "sequence") |>
    S7::props() |>
    rlang::set_names(\(x) paste0("seq_", x))
}

#' @noRd
props_state <- function(x) {
  S7::prop(x, "state") |>
    S7::props() |>
    rlang::set_names(\(x) paste0("state_", x))
}

#' @noRd
props_type <- function(x) {
  S7::prop(x, "type") |>
    S7::props() |>
    rlang::set_names(\(x) paste0("type_", x))
}

#' @noRd
props_parent <- function(x) {
  S7::prop(x, "parent") |>
    S7::props() |>
    rlang::set_names(\(x) paste0("parent_", x))
}

#' @noRd
prop_ext <- function(x) {
  S7::prop(x, "extension") %||% NA_character_
}

#' @noRd
prop_number <- function(x) {
  S7::prop(x, "number")
}
