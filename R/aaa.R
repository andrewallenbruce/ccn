#' @autoglobal
#' @noRd
unlist_ <- function(x, ...) {
  unlist(x, use.names = FALSE, ...)
}

#' @autoglobal
#' @noRd
make_switch <- function(x) {

  e <- purrr::map(x, \(x) cheapr::fast_df(field = x)) |>
    purrr::list_rbind(names_to = "constant") |>
    collapse::roworder(constant, field)

  function(x) {
    kit::vswitch(
      x       = x,
      values  = e$field,
      outputs = e$constant,
      default = NA_character_,
      nThread = 4L
      # checkEnc = FALSE
    )
  }
}
