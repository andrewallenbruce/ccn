#' Decode `ccn`/`ccnr` objects
#'
#' @param x `<chr>` A vector of CCNs.
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>`
#' @examples
#' x = get_pin("ccn")
#' decode(as_ccn(x))
#' b = decode(as_ccnr(x))
#' b
#' collapse::qDF(collapse::fcountv(b, c("entity", "description")))
#' with(b, collapse::qtab(facility, entity))
#' @export
decode <- function(x, ...) {
  UseMethod("decode")
}

#' @export
#' @rdname decode
decode.ccn <- function(x, ...) {
  x <- vctrs::vec_data(as_ccnr(x))
  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::qTBL(collapse::gv(
    x,
    c("ccn", "entity", "state", "number", "type")
  ))
}

#' @noRd
rec_type <- function(x, index, key, .fn) {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    x[["facility"]][i] <- .fn(x[["type"]][i], "abbr")
    x[["description"]][i] <- .fn(x[["type"]][i], "full")
  }
  return(x)
}

#' @noRd
rec_range <- function(x, index, key, .fn) {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    if (key == "Medicare") {
      x[["facility"]][i] <- .fn(x[["number"]][i], "abbr")
      x[["description"]][i] <- .fn(x[["number"]][i], "full")
      x[["range"]][i] <- .fn(x[["number"]][i], "range")
    } else {
      x[["range"]][i] <- .fn(x[["number"]][i])
    }
  }
  return(x)
}

#' @export
#' @rdname decode
decode.ccnr <- function(x, ...) {
  i <- get_index(x)
  x <- vctrs::vec_data(x)

  collapse::settfmv(x, collapse::gv(x, "number", return = 3L), as.integer)
  collapse::settfmv(x, collapse::gv(x, "state", return = 3L), recode_state)

  x <- collapse::av(
    x,
    region = as_region(x[["state"]]),
    facility = cheapr::na_init("", vctrs::vec_size(x)),
    range = cheapr::na_init("", vctrs::vec_size(x)),
    description = cheapr::na_init("", vctrs::vec_size(x))
  )


  x <- rec_type(x, i, "Emergency", recode_other_type)
  x <- rec_type(x, i, "Organ", recode_other_type)
  x <- rec_type(x, i, "Supplier", recode_other_type)
  x <- rec_type(x, i, "Medicaid", recode_medicaid_type)
  x <- rec_type(x, i, "Unit", recode_unit_type)
  x <- rec_type(x, i, "Subunit", recode_unit_type)

  x <- rec_range(x, i, "Medicare", recode_medicare_range)
  x <- rec_range(x, i, "Emergency", recode_other_range)
  x <- rec_range(x, i, "Organ", recode_other_range)
  x <- rec_range(x, i, "Supplier", recode_supplier_range)

  if (collapse::anyv(x[["facility"]], "MOH")) {
    idx <- x[["facility"]] %==% "MOH"

    x[["facility"]][idx] <- recode_medicaid_range(x[["number"]][idx], "abbr")
    x[["description"]][idx] <- recode_medicaid_range(x[["number"]][idx], "full")
    x[["range"]][idx] <- recode_medicaid_range(x[["number"]][idx], "range")
  }

  collapse::qTBL(collapse::gv(
    x,
    c("ccn", "state", "region", "entity", "facility", "range", "description")
  ))
}

# `x` must be a vector, not `NULL`.
# decode_ccnr("")
# decode_ccnr(c("", " "))
# decode_ccnr(NULL)
# decode_ccnr(as_ccn(NA))
# as_ccnr(as_ccn("")) == NULL
