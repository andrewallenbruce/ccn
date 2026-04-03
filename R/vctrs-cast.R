#' Casting
#'
#' Double dispatch methods to support [vctrs::vec_cast()].
#'
#' @inheritParams vctrs::vec_cast
#' @keywords internal
#' @method vec_cast ccn
#' @export
#' @export vec_cast.ccn
vec_cast.ccn <- function(x, to, ...) {
  UseMethod("vec_cast.ccn")
}

#' @method vec_cast.ccn ccn
#' @export
vec_cast.ccn.ccn <- function(x, to, ...) {
  x
}

#' @method vec_cast.ccn character
#' @export
vec_cast.ccn.character <- function(x, to, ...) {
  ccn(x)
}

#' @method vec_cast.character ccn
#' @export
vec_cast.character.ccn <- function(x, to, ...) {
  ccn(x)
}
