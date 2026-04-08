#' @noRd
infer_ccn_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      provider_nchar(x),
      provext_nchar(x),
      supplier_nchar(x),
      suppext_nchar(x),
      vec_detect_missing(x)
    ),
    values = list(
      "provider",
      "provider_ext",
      "supplier",
      "supplier_ext",
      NA_character_
    ),
    default = "ccn"
  )
}

#' @noRd
infer_provider_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      medicare_(x),
      organ_(x),
      emergency_(x),
      medicaid_(x),
      unit_(x),
      subunit_(x),
      vec_detect_missing(x)
    ),
    values = list(
      "medicare",
      "organ",
      "emergency",
      "medicaid",
      "unit",
      "subunit",
      NA_character_
    ),
    default = "provider"
  )
}

#' @noRd
infer_provider_ext <- function(x) {
  x <- substring(x, 1L, 6L)
  vctrs::vec_case_when(
    conditions = list(
      medicare_(x),
      organ_(x),
      emergency_(x),
      medicaid_(x),
      unit_(x),
      subunit_(x),
      vec_detect_missing(x)
    ),
    values = list(
      "medicare_ext",
      "organ_ext",
      "emergency_ext",
      "medicaid_ext",
      "unit_ext",
      "subunit_ext",
      NA_character_
    ),
    default = "provider_ext"
  )
}

#' @export
#' @rdname ccn
index_types <- function(x) {
  x <- if (is_ccn(x)) vctrs::vec_data(x) else x
  g <- e <- p <- NULL

  g <- collapse::GRP(infer_ccn_type(x), call = FALSE)
  g <- collapse::gsplit(NULL, g, use.g.names = TRUE)

  if (rlang::has_name(g, "provider_ext")) {
    e <- collapse::GRP(infer_provider_ext(x[g$provider_ext]), call = FALSE)
    e <- collapse::gsplit(g$provider_ext, e, use.g.names = TRUE)
    g$provider_ext <- NULL
  }

  if (rlang::has_name(g, "provider")) {
    p <- collapse::GRP(infer_provider_type(x[g$provider]), call = FALSE)
    p <- collapse::gsplit(g$provider, p, use.g.names = TRUE)
    g$provider <- NULL
  }

  res <- c(g %||% list(), e %||% list(), p %||% list())
  structure(res, class = "type_index")
}

#' @method format type_index
#' @export
format.type_index <- function(x, ...) {
  res <- x

  x <- collapse::vlengths(x)
  x <- c(x, TOTAL = collapse::fsum(unname(x)))

  cat("<type_index>", sep = "\n")

  if (x["TOTAL"] == 0L) {
    return(invisible(NULL))
  }

  x <- paste(
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

  cat(x, sep = "\n")
  invisible(res)
}

#' @method print type_index
#' @export
print.type_index <- function(x, ...) {
  format(x)
}
