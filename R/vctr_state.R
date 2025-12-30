#' Create a state vector
#'
#' A state vector here is one where all entries are two-character scalars that
#' correspond to a US state or territory code as defined by CMS.
#'
#' @param x A character vector of state codes
#' @returns an S3 vector of class `ccn_state`
#' @examples
#' ccn_state(c("00", "01", "02", "72", "78", "99"))
#' @export
ccn_state <- function(x = character()) {
  x <- vctrs::vec_cast(x, character())
  new_state(x)
}

new_state <- function(
  x = character(),
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  check_all_are_state(x)
  vctrs::new_vctr(x, class = "ccn_state")
}

#' @noRd
is_ccn_state <- function(x) {
  inherits(x, "ccn_state")
}

#' @noRd
as_state <- function(x) {
  if (inherits(x, "ccn_state")) {
    x <- as.character(x)
  }
  vctrs::vec_cast(x, to = new_state())
}

#' @export
vec_ptype_abbr.ccn_state <- function(x, ...) {
  "state"
}

#' @export
vec_ptype_full.ccn_state <- function(x, ...) {
  "state"
}

#' @export
format.ccn_state <- function(x, ...) {
  if (length(x) == 0L) {
    return(character())
  }

  out <- formatC(vctrs::vec_data(x), format = "s")
  out[is.na(x)] <- NA
  out
}
