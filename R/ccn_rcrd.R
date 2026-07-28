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
#' tibble::tibble(
#'   x = get_pin("ccn"),
#'   ccn = as_ccn(x),
#'   ccnr = as_ccnr(ccn))
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

#' Is `x` a ccnr?
#'
#' @param x description
#' @returns logical
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

# has_idx(x, i, "Emergency", "type", "facility", recode_other_type)
#' @noRd
has_idx <- function(x, index, key, from, to, .fn) {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    x[[to]][i] <- .fn(x[[from]][i])
  }
  return(x)
}

# `x` must be a vector, not `NULL`.
# decode_ccnr("")
# decode_ccnr(c("", " "))
# decode_ccnr(NULL)
# decode_ccnr(as_ccn(NA))
#
# as_ccnr(as_ccn("")) == NULL

#' Decode a `ccnr` object
#'
#' @param x `<chr>` a vector of CCNs
#' @returns An S3 vector of class `<ccnr>`
#' @examples
#' decode_ccnr(get_pin("ccn"))
#' @export
decode_ccnr <- function(x) {
  x <- if (is_ccnr(x)) {
    tibble::tibble(vctrs::vec_data(x))
  } else if (is_ccn(x)) {
    tibble::tibble(vctrs::vec_data(as_ccnr(x)))
  } else {
    ix <- as_ccnr(as_ccn(x))
    if (is.null(ix)) {
      rlang::abort("`x` cannot be an empty character vector or `NULL`")
    }
    tibble::tibble(vctrs::vec_data(ix))
  }

  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::settfmv(x, collapse::gv(x, "state", return = 3L), recode_state)
  x[["facility"]] <- vctrs::vec_init(character(), vctrs::vec_size(x))

  i <- purrr::imap(
    rlang::set_names(collapse::funique(x[["entity"]])),
    function(n, i) {
      purrr::pluck(x, "entity") %==% n
    }
  )

  x <- has_idx(x, i, "Emergency", "type", "facility", recode_other_type)
  x <- has_idx(x, i, "Supplier", "type", "facility", recode_other_type)
  x <- has_idx(x, i, "Organ", "type", "facility", recode_other_type)
  x <- has_idx(x, i, "Medicaid", "type", "facility", recode_medicaid_type)
  x <- has_idx(x, i, "Unit", "type", "facility", recode_unit_type)
  x <- has_idx(x, i, "Subunit", "type", "facility", recode_unit_type)
  x <- has_idx(x, i, "Medicare", "number", "facility", decode_medicare_range)

  if (collapse::anyv(x[["facility"]], "MOH")) {
    idx <- x[["facility"]] %==% "MOH"

    x[["facility"]][idx] <- decode_medicaid_range(x[["number"]][idx])
  }

  collapse::gv(
    x,
    c("ccn", "entity", "state", "facility", "number", "type")
  )
}

# if (rlang::has_name(i, "Unit")) {
#   xi <- vctrs::vec_slice(x, i[["Unit"]])
#   vctrs::vec_slice(x, i[["Unit"]])$facility <- recode_unit_type(xi[["type"]])
#
#   p <- paste0(
#     str_state(xi[["ccn"]]),
#     recode_unit_type(xi[["type"]], "infix"),
#     substring(xi[["ccn"]], 4L, 6L)
#   )
#
#   vctrs::vec_slice(x, i[["Unit"]])$parent <- p
# }
#
# if (rlang::has_name(i, "Subunit")) {
#   xi <- vctrs::vec_slice(x, i[["Subunit"]])
#   xii <- recode_unit_type(xi[["type"]])
#   vctrs::vec_slice(x, i[["Subunit"]])$facility <- xii
#
#   p <- paste0(
#     str_state(x[i$Subunit, ]$ccn),
#     recode_subunit_type(x[i$Subunit, ]$parent),
#     substring(x[i$Subunit, ]$ccn, 5L, 6L)
#   )
#
#   x[i$Subunit, ]$parent <- p
# }
