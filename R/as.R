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
as_ccnr.default <- function(x, ...) {
  vctrs::vec_cast(x, new_ccnr())
}

#' @export
#' @rdname as
as_ccnr.character <- function(x, ...) {
  as_ccnr_(as_ccn(x))
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

# ccnr(entity = c("Medicare", "Organ"), ccn = c("001500", "00P030"), state = NA_character_, number = NA_character_, type = NA_character_)
# to_ccnr("001500", "Medicare")
# to_ccnr("00P030", "Organ")
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
      Medicare_Ext = "Medicare",
      Medicaid_Ext = "Medicaid",
      Unit_Ext = "Unit",
      Subunit_Ext = "Subunit",
      ENTITY
    ),
    ccn = x,
    # ccn = switch(
    #   ENTITY,
    #   Medicare_Ext = ,
    #   Medicaid_Ext = ,
    #   Unit_Ext = ,
    #   Subunit_Ext = substring(x, 1L, nchar(x)),
    #   Medicare = ,
    #   Organ = ,
    #   Unit = ,
    #   Medicaid = ,
    #   Subunit = ,
    #   Emergency = substring(x, 1L, 6L),
    #   Supplier = substring(x, 1L, 10L)
    # ),
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
ccnr_ <- function(x, index, key) {
  if (!rlang::has_name(index, key)) {
    return(NULL)
  }
  to_ccnr(x[index[[key]]], key)
}

#' @noRd
as_ccnr_ <- function(x) {
  i <- attr(x, "index")
  vctrs::vec_c(
    ccnr_(x, i, "Medicare"),
    ccnr_(x, i, "Medicare_Ext"),
    ccnr_(x, i, "Medicaid"),
    ccnr_(x, i, "Medicaid_Ext"),
    ccnr_(x, i, "Unit"),
    ccnr_(x, i, "Unit_Ext"),
    ccnr_(x, i, "Subunit_Ext"),
    ccnr_(x, i, "Subunit"),
    ccnr_(x, i, "Organ"),
    ccnr_(x, i, "Emergency"),
    ccnr_(x, i, "Supplier")
  )
}
