#' Decode `ccn`/`ccnr` objects
#'
#' @param x `<chr>` A vector of CCNs.
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>`
#' @examples
#' x = get_pin("ccn")
#' b = as_ccnr(x)
#' decode(as_ccn(x))
#' decode(b)
#' collapse::qDF(collapse::fcountv(decode(b), c("entity", "facility")))
#' @export
decode <- function(x, ...) {
  UseMethod("decode")
}

#' @export
#' @rdname decode
decode.ccn <- function(x, ...) {
  x <- tibble::tibble(vctrs::vec_data(as_ccnr(x)))
  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::gv(
    x,
    c("ccn", "entity", "state", "number", "type")
  )
}

#' @noRd
rec_ <- function(x, index, key, .fn, from = "type", to = "facility", ...) {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    x[[to]][i] <- .fn(x[[from]][i], ...)
    # collapse::setv(x[[to]], i, .fn(x[[from]][i]))
  }
  return(x)
}

#' @export
#' @rdname decode
decode.ccnr <- function(x, ...) {
  x <- tibble::tibble(vctrs::vec_data(x))

  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::settfmv(x, collapse::gv(x, "state", return = 3L), recode_state)
  x[["region"]] <- as_region(x[["state"]])
  x[["range"]] <- vctrs::vec_init(character(), vctrs::vec_size(x))
  x[["facility"]] <- vctrs::vec_init(character(), vctrs::vec_size(x))

  i <- purrr::imap(
    rlang::set_names(collapse::funique(x[["entity"]])),
    function(n, i) {
      purrr::pluck(x, "entity") %==% n
    }
  )

  x <- rec_(x, i, "Emergency", recode_other_type)
  x <- rec_(x, i, "Supplier", recode_other_type)
  x <- rec_(x, i, "Organ", recode_other_type)
  x <- rec_(x, i, "Medicaid", recode_medicaid_type)
  x <- rec_(x, i, "Unit", recode_unit_type)
  x <- rec_(x, i, "Subunit", recode_unit_type)
  x <- rec_(x, i, "Medicare", recode_medicare_range, "number")
  x <- rec_(
    x = x,
    index = i,
    key = "Medicare",
    .fn = recode_medicare_range,
    from = "number",
    to = "range",
    as = "range"
  )

  if (collapse::anyv(x[["facility"]], "MOH")) {
    idx <- x[["facility"]] %==% "MOH"

    x[["facility"]][idx] <- recode_medicaid_range(x[["number"]][idx])
    x[["range"]][idx] <- recode_medicaid_range(x[["number"]][idx], as = "range")
  }

  collapse::gv(
    x,
    c("ccn", "state", "region", "entity", "facility", "range")
  )
}

# `x` must be a vector, not `NULL`.
# decode_ccnr("")
# decode_ccnr(c("", " "))
# decode_ccnr(NULL)
# decode_ccnr(as_ccn(NA))
# as_ccnr(as_ccn("")) == NULL

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
