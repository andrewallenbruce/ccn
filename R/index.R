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
    default = "<UNKNOWN> Type"
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
    default = "<UNKNOWN> Provider"
  )
}

#' @noRd
infer_provider_ext <- function(x) {
  x <- substring(x, 1L, 6L)
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
      "Medicare_Ext",
      "Organ_Ext",
      "Emergency_Ext",
      "Medicaid_Ext",
      "Unit_Ext",
      "Subunit_Ext",
      NA_character_
    ),
    default = "<UNKNOWN> Provider Ext"
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
#' @examples
#' index_ccn(as_ccn(get_pin("ccn")))
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

#' @method format ccn_index
#' @export
format.ccn_index <- function(x, ...) {
  z <- collapse::vlengths(x)
  n <- collapse::fsum(unname(z))

  id <- paste0("<ccn_index[", n, "]>")

  cat(id, sep = "\n")

  if (n == 0L) {
    return(invisible(NULL))
  }

  cat(fmt_idx(z), sep = "\n")
  invisible(x)
}

#' @method print ccn_index
#' @export
print.ccn_index <- function(x, ...) {
  format(x, ...)
}

#' @noRd
fmt_idx <- function(x) {
  paste(
    format(
      names(x),
      justify = "right"
    ),
    ":",
    format(
      unname(x),
      justify = "left"
    )
  )
}
