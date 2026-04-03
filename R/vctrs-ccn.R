methods::setOldClass(c("ccn", "vctrs_vctr"))

#' Construct a `ccn` object
#'
#'    - `new_ccn()` is a low-level constructor that takes a vector.
#'    - `ccn()` constructs an npi object from a vector.
#'    - `as_ccn()` and `is_ccn()` forward to [vctrs::vec_cast()] and [inherits()], respectively.
#'
#' @param x a vector
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>`
#' @examples
#' new_ccn()
#' ccn()
#' ccn("030113")
#' x <- get_pin("ccn")[1:20]
#' x <- ccn(x)
#' x
#' str(x)
#' data.frame(x)
#' tibble::tibble(x)
#' @export
ccn <- function(x = character()) {
  x <- vec_cast(clean_ccn(x), character())
  new_ccn(x)
}

#' @export
#' @rdname ccn
new_ccn <- function(x = character()) {
  vec_assert(x, character())
  new_vctr(x, class = "ccn")
}

#' @export
#' @rdname ccn
is_ccn <- function(x) {
  inherits(x, "ccn")
}

#' @export
#' @rdname ccn
as_ccn <- function(x, ...) {
  UseMethod("as_ccn")
}

#' @export
#' @rdname ccn
as_ccn.default <- function(x, ...) {
  vec_cast(x, new_ccn())
}

#' @export
#' @rdname ccn
as_ccn.character <- function(x, ...) {
  new_ccn(x)
}
