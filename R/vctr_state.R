#' Create a state vector
#'
#' A state vector here is one where all entries are two-character scalars that
#' correspond to a US state or territory code as defined by CMS.
#'
#' @param x A character vector of state codes
#' @param ... Additional arguments (not used)
#' @returns an S3 vector of class `vctr_state`
#' @examples
#' vctr_state(c("00", "01", "02", "72", "78", "99"))
#' @export
vctr_state <- function(x = character()) {
  x <- vctrs::vec_cast(x, character())
  new_state(x)
}

new_state <- function(x = character()) {
  validate_state(x)
  vctrs::new_vctr(x, class = "vctr_state")
}

#' @export
#' @rdname vctr_state
validate_state <- function(x) {
  stopifnot(all(is.na(x) | is.character(x) | is_state_code(x)))
  invisible(x)
}

#' @export
#' @rdname vctr_state
is_state <- function(x) {
  inherits(x, "vctr_state")
}

#' @export
#' @rdname vctr_state
as_state <- function(x) {
  if (inherits(x, "vctr_state")) {
    x <- as.character(x)
  }
  vctrs::vec_cast(x, to = new_state())
}

#' @export
#' @rdname vctr_state
vec_ptype_abbr.state <- function(x, ...) {
  "state"
}

#' @export
#' @rdname vctr_state
vec_ptype_full.state <- function(x, ...) {
  "state"
}

#' @export
#' @rdname vctr_state
format.state <- function(x, ...) {
  if (length(x) == 0) {
    return(character())
  }

  out <- formatC(vctrs::vec_data(x), format = "s")
  out[is.na(x)] <- NA
  out
}
