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
#'
#' y <- decode_ccnr(x) |>
#'   collapse::roworderv(c("entity", "state", "facility", "number")) |>
#'   collapse::rsplit(~entity)
#'
#' tibble::tibble(
#'   parent0 = y$Unit$parent,
#'   parent1 = as_ccn(parent0),
#'   parent2 = as_ccnr(parent0)
#' )
#'
#' y
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
  i <- index_types(x)

  vctrs::vec_c(
    has_ccnr(x, i, "care", ccnr_care),
    has_ccnr(x, i, "caid", ccnr_caid),
    has_ccnr(x, i, "unit", ccnr_unit),
    has_ccnr(x, i, "sub", ccnr_sub),
    has_ccnr(x, i, "opo", ccnr_opo),
    has_ccnr(x, i, "erh", ccnr_erh),
    has_ccnr(x, i, "supp", ccnr_supp),
    has_ccnr(x, i, "ext_care", ccnr_care, TRUE),
    has_ccnr(x, i, "ext_caid", ccnr_caid, TRUE),
    has_ccnr(x, i, "ext_unit", ccnr_unit, TRUE),
  )
}

#' @export
#' @rdname ccnr
decode_ccnr <- function(x) {
  x <- if (is_ccnr(x)) {
    tibble::tibble(vctrs::vec_data(x))
  } else if (is_ccn(x)) {
    tibble::tibble(vctrs::vec_data(as_ccnr(x)))
  } else {
    tibble::tibble(vctrs::vec_data(as_ccnr(as_ccn(x))))
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

  if (rlang::has_name(i, "Emergency")) {
    xi <- vctrs::vec_slice(x, i[["Emergency"]])
    xii <- recode_other_type(xi[["type"]])
    vctrs::vec_slice(x, i[["Emergency"]])$facility <- xii
  }

  if (rlang::has_name(i, "Supplier")) {
    xi <- vctrs::vec_slice(x, i[["Supplier"]])
    xii <- recode_other_type(xi[["type"]])
    vctrs::vec_slice(x, i[["Supplier"]])$facility <- xii
  }

  if (rlang::has_name(i, "Organ")) {
    xi <- vctrs::vec_slice(x, i[["Organ"]])
    xii <- recode_other_type(xi[["type"]])
    vctrs::vec_slice(x, i[["Organ"]])$facility <- xii
  }

  if (rlang::has_name(i, "Medicaid")) {
    x[i$Medicaid, ]$facility <- recode_medicaid_type(x[i$Medicaid, ]$type)

    x[i$Medicaid, ]$facility <- vctrs::vec_if_else(
      x[i$Medicaid, ]$facility == "MOH",
      decode_medicaid_range(x[i$Medicaid, ]$number),
      x[i$Medicaid, ]$facility
    )
  }

  if (rlang::has_name(i, "Medicare")) {
    xi <- vctrs::vec_slice(x, i[["Medicare"]])
    xii <- decode_medicare_range(xi[["number"]])
    vctrs::vec_slice(x, i[["Medicare"]])$facility <- xii
  }

  if (rlang::has_name(i, "Subunit")) {
    xi <- vctrs::vec_slice(x, i[["Subunit"]])
    xii <- recode_unit_type(xi[["type"]])
    vctrs::vec_slice(x, i[["Subunit"]])$facility <- xii

    x[i$Subunit, ]$parent <- paste0(
      str_state(x[i$Subunit, ]$ccn),
      recode_subunit_type(x[i$Subunit, ]$parent),
      substring(x[i$Subunit, ]$ccn, 5L, 6L)
    )
  }

  if (rlang::has_name(i, "Unit")) {
    xi <- vctrs::vec_slice(x, i[["Unit"]])
    vctrs::vec_slice(x, i[["Unit"]])$facility <- recode_unit_type(xi[["type"]])

    infix <- unit_type_infix(xi[["type"]])

    vctrs::vec_slice(x, i[["Unit"]])$parent <- paste0(
      str_state(xi[["ccn"]]),
      infix,
      substring(xi[["ccn"]], 4L, 6L)
    )
  }

  collapse::gv(
    x,
    c("ccn", "entity", "state", "facility", "parent", "ext", "number", "type")
  )
}
