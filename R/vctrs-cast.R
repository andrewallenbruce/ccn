#' Casting
#'
#' Double dispatch methods to support [vctrs::vec_cast()].
#'
#' @inheritParams vctrs::vec_cast
#' @inheritParams vctrs::vec_restore
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
  ccn(vec_data(x))
}

#' @method vec_cast.ccn character
#' @export
vec_cast.ccn.character <- function(x, to, ...) {
  ccn(x)
}

#' @method vec_cast.character ccn
#' @export
vec_cast.character.ccn <- function(x, to, ...) {
  vec_data(x)
}

#' @method vec_restore ccn
#' @export
vec_restore.ccn <- function(x, to, ..., i = NULL) {
  new_ccn(vec_data(x), form = ccn_form(x))
}
