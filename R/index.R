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
index_ccn_types <- function(x) {
  x <- if (is_ccn(x)) vctrs::vec_data(x) else x
  g <- e <- p <- NULL

  g <- grp_split(infer_ccn_type, x, NULL)

  if (rlang::has_name(g, "Provider_Ext")) {
    e <- grp_split(infer_provider_ext, x, g[["Provider_Ext"]])
    g[["Provider_Ext"]] <- NULL
  }

  if (rlang::has_name(g, "Provider")) {
    p <- grp_split(infer_provider_type, x, g[["Provider"]])
    g[["Provider"]] <- NULL
  }

  res <- vctrs::vec_c(g, e, p)

  structure(res, class = "ccn_type_index")
}

#' @method format ccn_type_index
#' @export
format.ccn_type_index <- function(x, ...) {
  z <- collapse::vlengths(x)
  n <- paste0("<ccn_type_index[", collapse::fsum(unname(z)), "]>")
  cat(n, sep = "\n")

  if (n == 0L) {
    return(invisible(NULL))
  }

  cat(fmt_idx(z), sep = "\n")
  invisible(x)
}

#' @method print ccn_type_index
#' @export
print.ccn_type_index <- function(x, ...) {
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
