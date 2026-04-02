#' @method format ccn
#' @export
format.ccn <- function(x, ...) {
  out <- formatC(vec_data(x), format = "s", width = "10")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
vec_ptype_abbr.ccn <- function(x, ...) {
  "ccn"
}

#' @export
vec_ptype_full.ccn <- function(x, ...) {
  "ccn"
}
