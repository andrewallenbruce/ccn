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

#' @method vec_cast.ccn ccnr
#' @export
vec_cast.ccn.ccnr <- function(x, to, ...) {
  x <- vctrs::field(x, "ccn")
  ccn(x)
}

#' @method vec_cast.ccn character
#' @export
vec_cast.ccn.character <- function(x, to, ...) {
  new_ccn(x)
}

#' @method vec_cast.character ccn
#' @export
vec_cast.character.ccn <- function(x, to, ...) {
  vctrs::vec_data(x)
}

#' Casting
#'
#' Double dispatch methods to support [vctrs::vec_cast()].
#'
#' @inheritParams vctrs::vec_cast
#' @keywords internal
#' @method vec_cast ccnr
#' @export
#' @export vec_cast.ccnr
vec_cast.ccnr <- function(x, to, ...) {
  UseMethod("vec_cast.ccnr")
}

#' @method vec_cast.ccnr ccnr
#' @export
vec_cast.ccnr.ccnr <- function(x, to, ...) {
  x
}

#' @method vec_cast.ccnr ccn
#' @export
vec_cast.ccnr.ccn <- function(x, to, ...) {
  as_ccnr(x)
}

#' @method vec_cast.ccnr character
#' @export
vec_cast.ccnr.character <- function(x, to, ...) {
  as_ccnr(ccn(x))
}

#' @method vec_cast.character ccnr
#' @export
vec_cast.character.ccnr <- function(x, to, ...) {
  vctrs::field(x, "ccn")
}
