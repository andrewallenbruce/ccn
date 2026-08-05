#' @method format ccn
#' @export
format.ccn <- function(x, ...) {
  x <- vctrs::vec_data(x)
  out <- formatC(x, format = "s")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @method format ccnr
#' @export
format.ccnr <- function(x, ...) {
  x <- vctrs::field(x, "ccn")
  out <- formatC(x, format = "s")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @method format ccn_index
#' @export
format.ccn_index <- function(x, ...) {
  z <- collapse::vlengths(x)
  n <- collapse::fsum(unname(z))

  id <- paste0("<ccn_vctr<index[", n, "]>>")

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

#' @method format ccnr_index
#' @export
format.ccnr_index <- function(x, ...) {
  z <- collapse::vlengths(x)
  n <- collapse::fsum(unname(z))

  id <- paste0("<ccn_rcrd<index[", n, "]>>")

  cat(id, sep = "\n")

  if (n == 0L) {
    return(invisible(NULL))
  }

  cat(fmt_idx(z), sep = "\n")
  invisible(x)
}

#' @method print ccnr_index
#' @export
print.ccnr_index <- function(x, ...) {
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
