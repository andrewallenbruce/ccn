methods::setOldClass(c("ccnr2", "vctrs_vctr"))

#' Construct a `ccnr2` object
#'
#' @param x `<ccn>` vector of ccns
#' @returns An S3 vector of class `<ccnr2>`
#'
#' @examples
#' x = get_pin("ccn")
#' y = ccn(x)
#' z = ccnr2(y)
#'
#' vctrs::vec_c(x[1:5], y[100:150], x[1:50], z[100:150])
#' tibble::tibble(ccn = y, ccnr2 = z)
#' @export
ccnr2 <- function(x = ccn()) {
  x <- vctrs::vec_cast(x, ccn())
  as_ccnr2_(x)
}

# new_ccnr2(ccn("001234"), NA_character_, NA_character_, NA_character_, NA_character_)
#' @noRd
new_ccnr2 <- function(
  x = ccn(),
  entity = character(),
  state = character(),
  number = character(),
  type = character()
) {
  force(x)

  if (!is_ccn(x)) {
    rlang::abort("`x` must be a <ccn> vector.")
  }

  .c(x, entity, state, number, type) %=%
    vctrs::vec_recycle_common(x, entity, state, number, type)

  vctrs::new_rcrd(
    list(
      ccn = x,
      entity = entity,
      state = state,
      number = number,
      type = type
    ),
    index = get_index(x),
    class = "ccnr2"
  )
}

#' @export
format.ccnr2 <- function(x, ...) {
  x <- vctrs::field(x, "ccn")
  out <- formatC(x, format = "s")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @noRd
to_ccnr2 <- function(x, entity) {
  ENTITY <- rlang::arg_match(
    entity,
    c(
      "Emergency",
      "Medicare",
      "Medicare_Ext",
      "Medicaid",
      "Medicaid_Ext",
      "Organ",
      "Unit",
      "Unit_Ext",
      "Subunit",
      "Supplier"
    )
  )
  new_ccnr2(
    x = x,
    entity = switch(
      ENTITY,
      Medicare_Ext = "Medicare",
      Medicaid_Ext = "Medicaid",
      Unit_Ext = "Unit",
      Subunit_Ext = "Subunit",
      ENTITY
    ),
    state = substring(x, 1L, 2L),
    number = switch(
      ENTITY,
      Medicare_Ext = ,
      Medicare = substring(x, 3L, 6L),
      Organ = ,
      Unit_Ext = ,
      Unit = ,
      Medicaid_Ext = ,
      Medicaid = substring(x, 4L, 6L),
      Subunit_Ext = ,
      Subunit = substring(x, 5L, 6L),
      Supplier = substring(x, 4L, 10L),
      Emergency = substring(x, 3L, 5L)
    ),
    type = switch(
      ENTITY,
      Medicare_Ext = ,
      Medicare = NA_character_,
      Organ = ,
      Unit_Ext = ,
      Unit = ,
      Subunit_Ext = ,
      Subunit = ,
      Supplier = ,
      Medicaid_Ext = ,
      Medicaid = substring(x, 3L, 3L),
      Emergency = substring(x, 6L, 6L)
    )
  )
}

#' @noRd
ccnr2_ <- function(x, i, key) {
  if (!rlang::has_name(i, key)) {
    return(NULL)
  }
  to_ccnr2(x[i[[key]]], key)
}

#' @noRd
as_ccnr2_ <- function(x) {
  i <- attr(x, "index", exact = TRUE)
  vctrs::vec_c(
    ccnr2_(x, i, "Medicare"),
    ccnr2_(x, i, "Medicare_Ext"),
    ccnr2_(x, i, "Medicaid"),
    ccnr2_(x, i, "Medicaid_Ext"),
    ccnr2_(x, i, "Unit"),
    ccnr2_(x, i, "Unit_Ext"),
    ccnr2_(x, i, "Subunit_Ext"),
    ccnr2_(x, i, "Subunit"),
    ccnr2_(x, i, "Organ"),
    ccnr2_(x, i, "Emergency"),
    ccnr2_(x, i, "Supplier")
  )
}

#' @export
vec_proxy_equal.ccnr2 <- function(x, ...) {
  vctrs::field(x, "ccn")
}

#' @export
vec_restore.ccnr2 <- function(x, to, ..., i = NULL) {
  ccnr2(x)
}


#' @export
vec_ptype2.ccnr2.ccnr2 <- function(x, y, ...) {
  x
}

#' @export
vec_ptype2.ccnr2.ccn <- function(x, y, ...) {
  x
}

#' @export
vec_ptype_abbr.ccnr2 <- function(x, ...) {
  "ccnr2"
}

#' @export
vec_ptype_full.ccnr2 <- function(x, ...) {
  "ccn_rcrd2"
}

#' @export
vec_cast.ccnr2.ccnr2 <- function(x, to, ...) {
  x
}

#' @export
vec_cast.ccnr2.ccn <- function(x, to, ...) {
  as_ccnr2_(x)
}

#' @export
vec_cast.ccnr2.character <- function(x, to, ...) {
  as_ccnr2_(ccn(x))
}

#' @export
vec_cast.character.ccnr2 <- function(x, to, ...) {
  vctrs::field(x, "ccn")
}

#' @export
#' @rdname as
as_ccn.ccnr2 <- function(x, ...) {
  new_ccn(vctrs::field(x, "ccn"))
}

#' @export
#' @rdname as
as_ccnr2 <- function(x, ...) {
  UseMethod("as_ccnr2")
}

#' @export
#' @rdname as
as_ccnr2.default <- function(x, ...) {
  vctrs::vec_cast(x, new_ccnr2())
}

#' @export
#' @rdname as
as_ccnr2.character <- function(x, ...) {
  as_ccnr2_(as_ccn(x))
}

#' @export
#' @rdname as
as_ccnr2.ccn <- function(x, ...) {
  as_ccnr2_(x)
}

#' @export
#' @rdname as
as_ccnr2.ccnr2 <- function(x, ...) {
  x
}
