#' Coercion
#'
#' Double dispatch methods to support [vctrs::vec_ptype2()].
#'
#' @inheritParams vctrs::vec_ptype2
#' @keywords internal
#' @method vec_ptype2 ccn
#' @export
#' @export vec_ptype2.ccn
vec_ptype2.ccn <- function(x, y, ..., x_arg = "", y_arg = "") {
  UseMethod("vec_ptype2.ccn", y)
}

#' @keywords internal
#' @method vec_ptype2.ccn default
#' @export
vec_ptype2.ccn.default <- function(x, y, ..., x_arg = "", y_arg = "") {
  vctrs::vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

#' @keywords internal
#' @method vec_ptype2.ccn ccn
#' @export
vec_ptype2.ccn.ccn <- function(x, y, ...) {
  new_ccn()
}

#' @keywords internal
#' @method vec_ptype2.ccn character
#' @export
vec_ptype2.ccn.character <- function(x, y, ...) {
  new_ccn()
}

#' @keywords internal
#' @method vec_ptype2.character ccn
#' @export
vec_ptype2.character.ccn <- function(x, y, ...) {
  new_ccn()
}

#' @keywords internal
#' @method vec_ptype2.ccn ccnr
#' @export
vec_ptype2.ccn.ccnr <- function(x, y, ...) {
  new_ccnr()
}

#' @export
vec_ptype_abbr.ccn <- function(x, ...) {
  "ccn"
}

#' @export
vec_ptype_full.ccn <- function(x, ...) {
  "ccn_vctr"
}

#' Coercion
#'
#' Double dispatch methods to support [vctrs::vec_ptype2()].
#'
#' @inheritParams vctrs::vec_ptype2
#' @keywords internal
#' @method vec_ptype2 ccnr
#' @export
#' @export vec_ptype2.ccnr
vec_ptype2.ccnr <- function(x, y, ..., x_arg = "", y_arg = "") {
  UseMethod("vec_ptype2.ccnr", y)
}

#' @keywords internal
#' @method vec_ptype2.ccnr default
#' @export
vec_ptype2.ccnr.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vctrs::vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

#' @keywords internal
#' @method vec_ptype2.ccnr ccnr
#' @export
vec_ptype2.ccnr.ccnr <- function(x, y, ...) {
  new_ccnr()
}

#' @keywords internal
#' @method vec_ptype2.ccnr ccn
#' @export
vec_ptype2.ccnr.ccn <- function(x, y, ...) {
  new_ccnr()
}

#' @export
vec_ptype_abbr.ccnr <- function(x, ...) {
  "ccnr"
}

#' @export
vec_ptype_full.ccnr <- function(x, ...) {
  "ccn_rcrd"
}
