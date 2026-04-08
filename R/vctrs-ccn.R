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
#' x <- get_pin("ccn")
#' y <- ccn(x)
#' vctrs::vec_c(x[1:5], y[100:150], x[1:50])
#' tibble::tibble(x = x, ccn = as_ccn(x))
#' index_types(x)
#' @export
ccn <- function(x = character()) {
  x <- vec_cast(x, character())
  new_ccn(x)
}

#' @export
#' @rdname ccn
new_ccn <- function(x = character()) {
  x <- clean_ccn(x)
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

#' @export
#' @rdname ccn
as_ccn.ccnr <- function(x, ...) {
  new_ccn(field(x, "ccn"))
}
