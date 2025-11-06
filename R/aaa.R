#' @autoglobal
#' @noRd
abort_wrong_length <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  cli::cli_abort(
    c("Input {.strong {arg}} must be {.emph 6 or 10 characters}.",
      "x" = "{.var {x}} is {.val {chars}} characters."),
    arg  = arg,
    call = call
  )
}

#' @autoglobal
#' @noRd
check_is_character <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  if (!is.character(x)) {
    cli::cli_abort(
      c(
        "Input {.strong {arg}} must be a {.emph character} vector.",
        "x" = "You supplied a {.emph {typeof(x)}} vector."
      ),
      arg  = arg,
      call = call
    )
  }
}

#' @autoglobal
#' @noRd
nchars_ <- function(x) {
  stringfish::sf_nchar(x, nthreads = 4L) |> as.character()
  # collapse::vlengths(c("adsfd", "sdgfahrf"), use.names = FALSE)
}

#' @autoglobal
#' @noRd
unlist_ <- function(x, ...) {
  unlist(x, use.names = FALSE, ...)
}

#' @autoglobal
#' @noRd
get_str_impl <- function(x, s) {
  stringfish::sf_substr(
    x        = x,
    start    = s[1],
    stop     = s[2],
    nthreads = 4L
  )
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
