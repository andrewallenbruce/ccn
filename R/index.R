#' @noRd
infer_ccn_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      nchar_provider(x),
      nchar_provider_ext(x),
      nchar_supplier(x),
      nchar_supplier_ext(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "Provider",
      "Provider_Ext",
      "Supplier",
      "Supplier_Ext",
      NA_character_
    ),
    default = NA_character_
  )
}

#' @noRd
infer_provider_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      is_type_medicare(x),
      is_type_organ(x),
      is_type_emergency(x),
      is_type_medicaid(x),
      is_type_unit(x),
      is_type_subunit(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "Medicare",
      "Organ",
      "Emergency",
      "Medicaid",
      "Unit",
      "Subunit",
      NA_character_
    ),
    default = NA_character_
  )
}

#' @noRd
infer_provider_ext <- function(x) {
  x <- substring(x, 1L, 6L)
  vctrs::vec_case_when(
    conditions = list(
      is_type_medicare(x),
      is_type_medicaid(x),
      is_type_unit(x),
      is_type_subunit(x),
      vctrs::vec_detect_missing(x)
    ),
    values = list(
      "Medicare_Ext",
      "Medicaid_Ext",
      "Unit_Ext",
      "Subunit_Ext",
      NA_character_
    ),
    default = NA_character_
  )
}

#' @noRd
grp_split <- function(.fn, x, i = NULL) {
  collapse::gsplit(
    i,
    collapse::GRP(X = if (is.null(i)) .fn(x) else .fn(x[i]), call = FALSE),
    use.g.names = TRUE
  )
}

#' Index a `ccn` object
#'
#' @param x `<chr>` A vector of CCNs.
#' @returns An S3 vector of class `<ccn_index>`
#' @examplesIf FALSE
#' index_ccn(get_pin("ccn"))
#' @keywords internal
#' @export
index_ccn <- function(x) {
  x <- if (is_ccn(x)) vctrs::vec_data(x) else x
  g <- grp_split(infer_ccn_type, x)

  if (rlang::has_name(g, "Provider_Ext")) {
    g <- c(g, grp_split(infer_provider_ext, x, g[["Provider_Ext"]]))
    g[["Provider_Ext"]] <- NULL
  }

  if (rlang::has_name(g, "Provider")) {
    g <- c(g, grp_split(infer_provider_type, x, g[["Provider"]]))
    g[["Provider"]] <- NULL
  }
  structure(g, class = "ccn_index")
}

#' @rdname vctrs
#' @export
get_index <- function(x) {
  UseMethod("get_index")
}

#' @rdname vctrs
#' @export
get_index.ccn <- function(x, ...) {
  attr(x, "index", exact = TRUE)
}
