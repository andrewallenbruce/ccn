#' Create a ccn vector
#'
#' A `ccn` vector here is one where all entries are character scalars with a
#' length between 6 and 14
#'
#' @param x A character vector of ccn codes
#' @returns an S3 vector of class `ccn`
#' @export
#' @examples
#' ccn(c("67-0055", "21034e", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589"))
ccn <- function(x = character()) {
  x <- vctrs::vec_cast(x, character())
  x <- clean(x)
  new_ccn(x)
}

new_ccn <- function(
  x = character(),
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  check_all_are_ccn(x, arg = arg, call = call)
  vctrs::new_vctr(x, class = "ccn")
}

#' @noRd
is_ccn <- function(x) {
  inherits(x, "ccn")
}

#' @noRd
as_ccn <- function(x) {
  if (inherits(x, "character")) {
    x <- as.character(x)
  }
  vctrs::vec_cast(x, to = new_ccn())
}

#' @export
vec_ptype_abbr.ccn <- function(x, ...) {
  "ccn"
}

#' @export
vec_ptype_full.ccn <- function(x, ...) {
  "ccn"
}

#' @export
format.ccn <- function(x, ...) {
  if (length(x) == 0L) {
    return(character())
  }

  out <- formatC(vctrs::vec_data(x), format = "s")
  out[is.na(x)] <- NA
  out
}
