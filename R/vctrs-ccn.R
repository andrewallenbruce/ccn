methods::setOldClass(c("ccn", "vctrs_vctr"))

#' Construct a `ccn` object
#'
#'    - `new_ccn()` is a low-level constructor that takes a vector.
#'    - `ccn()` constructs an npi object from a vector.
#'    - `as_ccn()` and `is_ccn()` forward to [vctrs::vec_cast()] and [inherits()], respectively.
#'
#' @param x a vector
#' @param form ccn form
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>`
#' @examplesIf FALSE
#' @export
ccn <- function(x = character()) {
  x <- vec_cast(clean_ccn(x), character())
  new_ccn(x, form = ccn_form(x))
}

#' @export
#' @rdname ccn
new_ccn <- function(x = character(), form = character()) {
  vec_assert(x, character())
  vec_assert(form, character())
  vec_check_size(form, size = vec_size(x))

  new_vctr(x, form = form, class = "ccn")
}

#' @export
#' @rdname ccn
form <- function(x) {
  attr(x, "form")
}

#' @export
#' @rdname ccn
is_ccn <- function(x) {
  inherits(x, "ccn")
}

#' @export
#' @rdname ccn
as_ccn <- function(x, ...) {
  UseMethod("as_ccn")
}

#' @export
#' @rdname ccn
as_ccn.default <- function(x, ...) {
  vec_cast(x, new_ccn())
}

#' @export
#' @rdname ccn
as_ccn.character <- function(x) {
  new_ccn(x, form = ccn_form(x))
}

#' @export
#' @rdname ccn
ccn_form <- function(x) {
  # initial type
  form <- infer_ccn_type(x)

  if (collapse::anyv(form, "provider_ext")) {
    # index of provider extensions
    I <- collapse::whichv(form, "provider_ext")

    # replace originals with shortened versions
    x[I] <- substring(x[I], 1L, 6L)

    # replace 'provider_ext' with 'provider'
    form[I] <- substring(form[I], 1L, 8L)
  }

  if (collapse::anyv(form, "supplier_ext")) {
    # index of supplier extensions
    I <- collapse::whichv(form, "supplier_ext")

    # replace originals with shortened versions
    x[I] <- substring(x[I], 1L, 10L)

    # replace 'supplier_ext' with 'supplier'
    form[I] <- substring(form[I], 1L, 8L)
  }

  I <- collapse::whichv(form, "provider")

  form[I] <- infer_provider_type(x[I])

  return(form)
}
