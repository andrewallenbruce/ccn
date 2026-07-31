methods::setOldClass(c("ccn", "vctrs_vctr"))
methods::setOldClass(c("ccnr", "vctrs_vctr"))

#' Construct a `ccn`/`ccnr` object
#'
#' @param x `<chr>` A vector of CCNs.
#' @param entity `<chr>` vector of ccn entity types
#' @param ccn `<chr>` vector of ccns
#' @param state `<chr>` vector of state codes
#' @param number `<chr>` vector of sequence numbers
#' @param type `<chr>` vector of facility types
#'
#' @returns An S3 vector of class `<ccn>` or `<ccnr>`
#'
#' @examples
#' x = get_pin("ccn")
#' y = ccn(x)
#' vctrs::vec_c(x[1:5], y[100:150], x[1:50])
#' tibble::tibble(x = x, ccn = ccn(x))
#'
#' ccnr(
#'   entity = "Medicare",
#'   ccn = "001234",
#'   state = "00",
#'   number = "1234",
#'   type = NA_character_
#'  )
#' @name ccn-ccnr
NULL

#' @rdname ccn-ccnr
#' @export
ccn <- function(x = character()) {
  x <- vctrs::vec_cast(x, character())
  new_ccn(x)
}

#' @noRd
new_ccn <- function(x = character()) {
  x <- clean_ccn(x)
  vctrs::vec_assert(x, character())
  new_vctr(x, index = index_ccn(x), class = "ccn")
}

#' Is `x` a `ccn`?
#'
#' @param x `<chr>` vector
#' @returns `<lgl>` vector
#' @keywords internal
#' @export
is_ccn <- function(x) {
  inherits(x, "ccn")
}

#' Restore
#'
#' @inheritParams vctrs::vec_restore
#' @keywords internal
#' @method vec_restore ccn
#' @export
#' @export vec_restore.ccn
vec_restore.ccn <- function(x, to, ..., i = NULL) {
  ccn(x)
}

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
  x
}

#' @keywords internal
#' @method vec_ptype2.character ccn
#' @export
vec_ptype2.character.ccn <- function(x, y, ...) {
  y
}

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
  new_ccn(x)
}

#' @method vec_cast.character ccn
#' @export
vec_cast.character.ccn <- function(x, to, ...) {
  vctrs::vec_data(x)
}

#' @method format ccn
#' @export
format.ccn <- function(x, ...) {
  x <- vctrs::vec_data(x)
  out <- formatC(x, format = "s")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
vec_ptype_abbr.ccn <- function(x, ...) {
  "ccn"
}

#' @export
vec_ptype_full.ccn <- function(x, ...) {
  "ccn_vctr"
}

#' @rdname ccn-ccnr
#' @export
ccnr <- function(
  entity = character(),
  ccn = character(),
  state = character(),
  number = character(),
  type = character()
) {
  .c(entity, ccn, state, number, type) %=%
    vctrs::vec_cast_common(
      entity,
      ccn,
      state,
      number,
      type,
      .to = character()
    )

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

#' Is `x` a `ccnr`?
#'
#' @param x `<chr>` vector
#' @returns `<lgl>` vector
#' @keywords internal
#' @export
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
