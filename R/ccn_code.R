#' @noRd
nchar_is_ccn <- function(x) {
  collapse::vlengths(x) >= 6L & collapse::vlengths(x) <= 14L
}

#' @noRd
is_valid_ccn_code <- function(x) {
  is.character(x) & nchar_is_ccn(x)
}

#' @noRd
all_valid_ccn_code <- function(x) {
  collapse::allv(is_valid_ccn_code(x), TRUE)
}

#' @noRd
which_not_ccn_code <- function(x) {
  collapse::whichv(is_valid_ccn_code(x), FALSE)
}

#' @noRd
check_all_are_ccn <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!all_valid_ccn_code(x)) {
    i <- which_not_ccn_code(x)
    n <- length(i)
    cli::cli_abort(
      c(
        "{.strong {n}} Invalid {cli::qty(n)} CCN{?s}:",
        "x" = "{.val {x[i]}}"
      ),
      arg = arg,
      call = call
    )
  }
}
