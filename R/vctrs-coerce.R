#' Coercion
#'
#' Double dispatch methods to support [vctrs::vec_ptype2()].
#'
#' @inheritParams vctrs::vec_ptype2
#' @method vec_ptype2 ccn
#' @export
#' @export vec_ptype2.ccn
vec_ptype2.ccn <- function(x, y, ..., x_arg = "", y_arg = "") {
  UseMethod("vec_ptype2.ccn", y)
}

#' @method vec_ptype2.ccn default
#' @export
vec_ptype2.ccn.default <- function(x, y, ..., x_arg = "", y_arg = "") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

#' @method vec_ptype2.ccn ccn
#' @export
vec_ptype2.ccn.ccn <- function(x, y, ...) {
  new_ccn()
}

#' @method vec_ptype2.character ccn
#' @export
vec_ptype2.character.ccn <- function(x, y, ...) {
  y
}

#' @method vec_ptype2.ccn character
#' @export
vec_ptype2.ccn.character <- function(x, y, ...) {
  x
}
