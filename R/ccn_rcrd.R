methods::setOldClass(c("ccnr", "vctrs_vctr"))

#' Construct a `ccnr` object
#'
#' @param ccn a vector
#' @param entity a vector
#' @param state Passed on to methods
#' @param number a vector
#' @param type a vector
#' @param parent a vector
#' @param ext a vector
#' @param x object
#' @returns An S3 vector of class `<ccnr>`
#' @examples
#' x <- get_pin("ccn")
#'
#' tibble::tibble(
#'   x = x,
#'   ccn = as_ccn(x),
#'   ccnr = as_ccnr(ccn))
#' @export
ccnr <- function(
  ccn = character(),
  entity = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
) {
  .c(ccn, entity, state, number, type, parent, ext) %=%
    vctrs::vec_cast_common(
      ccn,
      entity,
      state,
      number,
      type,
      parent,
      ext,
      .to = character()
    )
  .c(ccn, entity, state, number, type, parent, ext) %=%
    vctrs::vec_recycle_common(ccn, entity, state, number, type, parent, ext)

  new_ccnr(ccn, entity, state, number, type, parent, ext)
}

#' @export
#' @rdname ccnr
new_ccnr <- function(
  ccn = character(),
  entity = character(),
  state = character(),
  number = character(),
  type = character(),
  parent = character(),
  ext = character()
) {
  vctrs::new_rcrd(
    list(
      ccn = ccn,
      entity = entity,
      state = state,
      number = number,
      type = type,
      parent = parent,
      ext = ext
    ),
    class = "ccnr"
  )
}

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

#' @noRd
has_ccnr <- function(x, index, key, .fn, ext = FALSE) {
  if (rlang::has_name(index, key)) {
    i <- index[[key]]
    .fn(x[i], ext = ext)
  } else {
    NULL
  }
}

#' @export
#' @rdname ccnr
as_ccnr <- function(x) {
  i <- index_ccn_types(x)

  vctrs::vec_c(
    has_ccnr(x, i, "Medicare", ccnr_Medicare),
    has_ccnr(x, i, "Medicaid", ccnr_Medicaid),
    has_ccnr(x, i, "Unit", ccnr_Unit),
    has_ccnr(x, i, "Subunit", ccnr_Subunit),
    has_ccnr(x, i, "Organ", ccnr_Organ),
    has_ccnr(x, i, "Emergency", ccnr_Emergency),
    has_ccnr(x, i, "Supplier", ccnr_Supplier),
    has_ccnr(x, i, "Medicare_Ext", ccnr_Medicare, TRUE),
    has_ccnr(x, i, "Medicaid_Ext", ccnr_Medicaid, TRUE),
    has_ccnr(x, i, "Unit_Ext", ccnr_Unit, TRUE),
  )
}


# if (rlang::has_name(i, "Emergency")) {
#   x[["facility"]][i[["Emergency"]]] <- recode_other_type(x[["type"]][i[["Emergency"]]])
# }
#
# if (rlang::has_name(i, "Supplier")) {
#   x[["facility"]][i[["Supplier"]]] <- recode_other_type(x[["type"]][i[["Supplier"]]])
# }
#
# if (rlang::has_name(i, "Organ")) {
#   x[["facility"]][i[["Organ"]]] <- recode_other_type(x[["type"]][i[["Organ"]]])
# }

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
#' @export
#' @rdname ccnr
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

  if (rlang::has_name(i, "Medicaid")) {
    x[["facility"]][i[["Medicaid"]]] <- recode_medicaid_type(x[["type"]][i[[
      "Medicaid"
    ]]])

    if (collapse::anyv(x[["facility"]], "MOH")) {
      idx <- x[["facility"]] %==% "MOH"

      x[["facility"]][idx] <- decode_medicaid_range(x[["number"]][idx])
    }
  }

  if (rlang::has_name(i, "Medicare")) {
    xi <- vctrs::vec_slice(x, i[["Medicare"]])
    xii <- decode_medicare_range(xi[["number"]])
    vctrs::vec_slice(x, i[["Medicare"]])$facility <- xii
  }

  if (rlang::has_name(i, "Unit")) {
    xi <- vctrs::vec_slice(x, i[["Unit"]])
    vctrs::vec_slice(x, i[["Unit"]])$facility <- recode_unit_type(xi[["type"]])

    p <- paste0(
      str_state(xi[["ccn"]]),
      recode_unit_type(xi[["type"]], "infix"),
      substring(xi[["ccn"]], 4L, 6L)
    )

    vctrs::vec_slice(x, i[["Unit"]])$parent <- p
  }

  if (rlang::has_name(i, "Subunit")) {
    xi <- vctrs::vec_slice(x, i[["Subunit"]])
    xii <- recode_unit_type(xi[["type"]]) # TODO
    vctrs::vec_slice(x, i[["Subunit"]])$facility <- xii

    p <- paste0(
      str_state(x[i$Subunit, ]$ccn),
      recode_subunit_type(x[i$Subunit, ]$parent),
      substring(x[i$Subunit, ]$ccn, 5L, 6L)
    )

    x[i$Subunit, ]$parent <- p
  }

  collapse::gv(
    x,
    c("ccn", "entity", "state", "facility", "parent", "number", "type")
  )
}
