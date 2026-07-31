#' Convert to a `ccn`/`ccnr` object
#'
#' @param x `<chr>` A vector of CCNs.
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<ccn>` or `<ccnr>`
#' @examples
#' x = get_pin("ccn")
#'
#' head(as_ccn(x))
#'
#' head(as_ccnr(x))
#'
#' @name as
NULL

#' @export
#' @rdname as
as_ccn <- function(x, ...) {
  UseMethod("as_ccn")
}

#' @export
#' @rdname as
as_ccn.default <- function(x, ...) {
  vctrs::vec_cast(x, new_ccn())
}

#' @export
#' @rdname as
as_ccn.character <- function(x, ...) {
  new_ccn(x)
}

#' @export
#' @rdname as
as_ccn.ccn <- function(x, ...) {
  x
}

#' @export
#' @rdname as
as_ccn.ccnr <- function(x, ...) {
  new_ccn(vctrs::field(x, "ccn"))
}

#' @export
#' @rdname as
as_ccnr <- function(x, ...) {
  UseMethod("as_ccnr")
}

#' @export
#' @rdname as
as_ccnr.character <- function(x, ...) {
  as_ccnr_(x)
}
#' @export
#' @rdname as
as_ccnr.ccn <- function(x, ...) {
  as_ccnr_(x)
}

#' @export
#' @rdname as
as_ccnr.ccnr <- function(x, ...) {
  x
}

#' @examplesIf FALSE
#' to_ccnr("001500", "Medicare")
#' @noRd
to_ccnr <- function(x, entity) {
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
  ccnr(
    entity = switch(
      ENTITY,
      Organ = ,
      Medicare_Ext = "Medicare",
      Medicaid_Ext = "Medicaid",
      Unit_Ext = "Unit",
      ENTITY
    ),
    ccn = if (ENTITY == "Supplier") {
      substring(x, 1L, 10L)
    } else {
      substring(x, 1L, 6L)
    },
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
      Subunit = ,
      Supplier = ,
      Medicaid_Ext = ,
      Medicaid = substring(x, 3L, 3L),
      Emergency = substring(x, 6L, 6L)
    )
  )
}

#' @noRd
has_ccnr <- function(x, index, key) {
  if (!rlang::has_name(index, key)) {
    return(NULL)
  }
  # .fn(x[index[[key]]])
  to_ccnr(x[index[[key]]], key)
}

#' @noRd
as_ccnr_ <- function(x) {
  i <- index_ccn(x)

  # vctrs::vec_c(
  #   has_ccnr(x, i, "Medicare", ccnr_Medicare),
  #   has_ccnr(x, i, "Medicare_Ext", ccnr_Medicare),
  #   has_ccnr(x, i, "Medicaid", ccnr_Medicaid),
  #   has_ccnr(x, i, "Medicaid_Ext", ccnr_Medicaid),
  #   has_ccnr(x, i, "Unit", ccnr_Unit),
  #   has_ccnr(x, i, "Unit_Ext", ccnr_Unit),
  #   has_ccnr(x, i, "Subunit", ccnr_Subunit),
  #   has_ccnr(x, i, "Organ", ccnr_Organ),
  #   has_ccnr(x, i, "Emergency", ccnr_Emergency),
  #   has_ccnr(x, i, "Supplier", ccnr_Supplier)
  # )
  vctrs::vec_c(
    has_ccnr(x, i, "Medicare"),
    has_ccnr(x, i, "Medicare_Ext"),
    has_ccnr(x, i, "Medicaid"),
    has_ccnr(x, i, "Medicaid_Ext"),
    has_ccnr(x, i, "Unit"),
    has_ccnr(x, i, "Unit_Ext"),
    has_ccnr(x, i, "Subunit"),
    has_ccnr(x, i, "Organ"),
    has_ccnr(x, i, "Emergency"),
    has_ccnr(x, i, "Supplier")
  )
}
