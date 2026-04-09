#' @noRd
grp_split <- function(.fn, x, i) {
  if (is.null(i)) {
    E <- collapse::GRP(.fn(x), call = FALSE)
  } else {
    E <- collapse::GRP(.fn(x[i]), call = FALSE)
  }
  collapse::gsplit(i, E, use.g.names = TRUE)
}

#' @export
#' @rdname ccn
index_types <- function(x) {
  x <- if (is_ccn(x)) vec_data(x) else x
  g <- e <- p <- NULL

  g <- grp_split(infer_ccn_type, x, NULL)

  if (has_name(g, "ext_prov")) {
    e <- grp_split(infer_provider_ext, x, g$ext_prov)
    g$ext_prov <- NULL
  }

  if (has_name(g, "prov")) {
    p <- grp_split(infer_provider_type, x, g$prov)
    g$prov <- NULL
  }

  res <- c(g %||% list(), e %||% list(), p %||% list())
  structure(res, class = "type_index")
}

#' @noRd
infer_ccn_type <- function(x) {
  vec_case_when(
    conditions = list(
      nchar_provider(x),
      nchar_provext(x),
      nchar_supplier(x),
      nchar_suppext(x),
      vec_detect_missing(x)
    ),
    values = list(
      "prov",
      "ext_prov",
      "supp",
      "ext_supp",
      NA_character_
    ),
    default = "ccn"
  )
}

#' @noRd
infer_provider_type <- function(x) {
  vec_case_when(
    conditions = list(
      type_care(x),
      type_opo(x),
      type_erh(x),
      type_caid(x),
      type_unit(x),
      type_sub(x),
      vec_detect_missing(x)
    ),
    values = list(
      "care",
      "opo",
      "erh",
      "caid",
      "unit",
      "sub",
      NA_character_
    ),
    default = "prov"
  )
}

#' @noRd
infer_provider_ext <- function(x) {
  x <- substring(x, 1L, 6L)
  vec_case_when(
    conditions = list(
      type_care(x),
      type_opo(x),
      type_erh(x),
      type_caid(x),
      type_unit(x),
      type_sub(x),
      vec_detect_missing(x)
    ),
    values = list(
      "ext_care",
      "ext_opo",
      "ext_erh",
      "ext_caid",
      "ext_unit",
      "ext_sub",
      NA_character_
    ),
    default = "ext_prov"
  )
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

#' @method format type_index
#' @export
format.type_index <- function(x, ...) {
  z <- collapse::vlengths(x)
  z <- c(z, TOTAL = collapse::fsum(unname(z)))

  cat("<type_index>", sep = "\n")

  if (z["TOTAL"] == 0L) {
    return(invisible(NULL))
  }

  cat(fmt_idx(z), sep = "\n")
  invisible(x)
}

#' @method print type_index
#' @export
print.type_index <- function(x, ...) {
  format(x, ...)
}
