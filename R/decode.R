#' Decode `ccn`/`ccnr` objects
#'
#' @param x `<chr>` A vector of CCNs.
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>`
#' @examples
#' x = get_pin("ccn")
#' a = as_ccn(x)
#' b = as_ccnr(x)
#' decode(a)
#' decode(b)
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

# has_(x, i, "Emergency", "type", "facility", recode_other_type)
#' @noRd
has_ <- function(x, index, key, .fn, from = "type", to = "facility") {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    x[[to]][i] <- .fn(x[[from]][i])
  }
  return(x)
}

#' @export
#' @rdname decode
decode.ccnr <- function(x, ...) {
  x <- tibble::tibble(vctrs::vec_data(x))

  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::settfmv(x, collapse::gv(x, "state", return = 3L), recode_state)
  x[["facility"]] <- vctrs::vec_init(character(), vctrs::vec_size(x))

  i <- purrr::imap(
    rlang::set_names(collapse::funique(x[["entity"]])),
    function(n, i) {
      purrr::pluck(x, "entity") %==% n
    }
  )

  x <- has_(x, i, "Emergency", recode_other_type)
  x <- has_(x, i, "Supplier", recode_other_type)
  x <- has_(x, i, "Organ", recode_other_type)
  x <- has_(x, i, "Medicaid", recode_medicaid_type)
  x <- has_(x, i, "Unit", recode_unit_type)
  x <- has_(x, i, "Subunit", recode_unit_type)
  x <- has_(x, i, "Medicare", decode_medicare_range, "number")

  if (collapse::anyv(x[["facility"]], "MOH")) {
    idx <- x[["facility"]] %==% "MOH"

    x[["facility"]][idx] <- decode_medicaid_range(x[["number"]][idx])
  }

  collapse::gv(
    x,
    c("ccn", "entity", "state", "facility", "number", "type")
  )
}

# `x` must be a vector, not `NULL`.
# decode_ccnr("")
# decode_ccnr(c("", " "))
# decode_ccnr(NULL)
# decode_ccnr(as_ccn(NA))
# as_ccnr(as_ccn("")) == NULL
#' @noRd
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

  x <- has_(x, i, "Emergency", "type", "facility", recode_other_type)
  x <- has_(x, i, "Supplier", "type", "facility", recode_other_type)
  x <- has_(x, i, "Organ", "type", "facility", recode_other_type)
  x <- has_(x, i, "Medicaid", "type", "facility", recode_medicaid_type)
  x <- has_(x, i, "Unit", "type", "facility", recode_unit_type)
  x <- has_(x, i, "Subunit", "type", "facility", recode_unit_type)
  x <- has_(x, i, "Medicare", "number", "facility", decode_medicare_range)

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
