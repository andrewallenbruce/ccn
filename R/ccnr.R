methods::setOldClass(c("ccnr", "vctrs_vctr"))

#' Construct a `ccnr` object
#'
#' @param entity `<chr>` vector of ccn entity types
#' @param ccn `<chr>` vector of ccns
#' @param state `<chr>` vector of ccn state codes
#' @param number `<chr>` vector of ccn code sequence numbers
#' @param type `<chr>` vector of ccn code facility types
#' @returns An S3 vector of class `<ccnr>`
#' @examples
#' ccnr()
#'
#' ccnr(
#'   entity = "Medicare",
#'   ccn = "001234",
#'   state = "00",
#'   number = "1234",
#'   type = NA_character_
#'  )
#' @export
ccnr <- function(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
) {
  .c(entity, ccn, state, number, type) %=%
    vctrs::vec_cast_common(entity, ccn, state, number, type, .to = character())
  .c(entity, ccn, state, number, type) %=%
    vctrs::vec_recycle_common(entity, ccn, state, number, type)
  new_ccnr(entity, ccn, state, number, type)
}

#' @noRd
new_ccnr <- function(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
) {
  vctrs::new_rcrd(
    list(
      entity = entity,
      ccn = ccn,
      state = state,
      number = number,
      type = type
    ),
    class = "ccnr"
  )
}

#' @param x `<chr>` A vector of CCNs.
#' @export
#' @rdname ccnr
is_ccnr <- function(x) {
  inherits(x, "ccnr")
}

#' Comparison
#'
#' Dispatch methods to support [vctrs::vec_proxy_equal()].
#'
#' @inheritParams vctrs::vec_proxy_equal
#' @keywords internal
#' @method vec_proxy_equal ccnr
#' @export
#' @export vec_proxy_equal.ccnr
vec_proxy_equal.ccnr <- function(x, ...) {
  vctrs::field(x, "ccn")
}

#' @method format ccnr
#' @export
format.ccnr <- function(x, ...) {
  x <- vctrs::field(x, "ccn")
  out <- formatC(x, format = "s")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
vec_ptype_abbr.ccnr <- function(x, ...) {
  "ccnr"
}

#' @export
vec_ptype_full.ccnr <- function(x, ...) {
  "ccn_rcrd"
}
