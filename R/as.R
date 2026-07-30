#' Convert to a `ccn` object
#'
#' @param x `<chr>` A vector of CCNs.
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>`
#' @examples
#' head(as_ccn(get_pin("ccn")))
#' @export
as_ccn <- function(x, ...) {
  UseMethod("as_ccn")
}

#' @export
#' @rdname as_ccn
as_ccn.default <- function(x, ...) {
  vctrs::vec_cast(x, new_ccn())
}

#' @export
#' @rdname as_ccn
as_ccn.character <- function(x, ...) {
  new_ccn(x)
}

#' @export
#' @rdname as_ccn
as_ccn.ccn <- function(x, ...) {
  x
}

#' @export
#' @rdname as_ccn
as_ccn.ccnr <- function(x, ...) {
  new_ccn(vctrs::field(x, "ccn"))
}

#' Convert to a `ccnr` object
#'
#' @param x `<chr>` A vector of CCNs.
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccnr>`
#' @examples
#' head(as_ccnr(get_pin("ccn")))
#' @export
as_ccnr <- function(x, ...) {
  UseMethod("as_ccnr")
}

#' @export
#' @rdname as_ccnr
as_ccnr.character <- function(x, ...) {
  as_ccnr_(x)
}

#' @export
#' @rdname as_ccnr
as_ccnr.ccn <- function(x, ...) {
  as_ccnr_(x)
}

#' @export
#' @rdname as_ccnr
as_ccnr.ccnr <- function(x, ...) {
  x
}

#' @noRd
has_ccnr <- function(x, index, key, .fn) {
  if (!rlang::has_name(index, key)) {
    return(NULL)
  }
  .fn(x[index[[key]]])
}

#' @noRd
as_ccnr_ <- function(x) {
  i <- index_ccn(x)

  vctrs::vec_c(
    has_ccnr(x, i, "Medicare", ccnr_Medicare),
    has_ccnr(x, i, "Medicare_Ext", ccnr_Medicare),
    has_ccnr(x, i, "Medicaid", ccnr_Medicaid),
    has_ccnr(x, i, "Medicaid_Ext", ccnr_Medicaid),
    has_ccnr(x, i, "Unit", ccnr_Unit),
    has_ccnr(x, i, "Unit_Ext", ccnr_Unit),
    has_ccnr(x, i, "Subunit", ccnr_Subunit),
    has_ccnr(x, i, "Organ", ccnr_Organ),
    has_ccnr(x, i, "Emergency", ccnr_Emergency),
    has_ccnr(x, i, "Supplier", ccnr_Supplier)
  )
}
