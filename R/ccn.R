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
#' @param ... description
#'
#' @returns An S3 vector of class `<ccn>` or `<ccnr>`
#'
#' @examples
#' x = get_pin("ccn")
#' y = ccn(x)
#' get_index(y)
#' z = as_ccnr(x)
#'
#' vctrs::vec_c(x[1:5], y[100:150], x[1:50], z[100:150])
#' tibble::tibble(x = x, ccn = ccn(x))
#'
#' ccnr(
#'   entity = "Medicare",
#'   ccn = "001234",
#'   state = "00",
#'   number = "1234",
#'   type = NA_character_
#'  )
#' @name vctrs
NULL

#' @noRd
new_ccn <- function(x = character()) {
  vctrs::vec_assert(x, character())
  vctrs::new_vctr(x, index = index_ccn(x), class = "ccn")
}

#' @rdname vctrs
#' @export
ccn <- function(x = character()) {
  x <- vctrs::vec_cast(x, character())
  x <- clean_ccn(x)
  new_ccn(x)
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

#' @rdname vctrs
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

#' Is `x` a `ccn`?
#'
#' @param x `<chr>` vector
#' @returns `<lgl>` vector
#' @keywords internal
#' @export
is_ccn <- function(x) {
  inherits(x, "ccn")
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
