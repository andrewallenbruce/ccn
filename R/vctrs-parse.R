#' @noRd
clean_ccn <- function(x) {
  remove_any_spaces(remove_non_alnums(toupper(x)))
}

#' @noRd
ccn_nchar <- function(x) {
  (nchar(x) - 6L) * (14L - nchar(x)) >= 0L
}

#' @noRd
provider_nchar <- function(x) {
  nchar(x) == 6L
}

#' @noRd
provext_nchar <- function(x) {
  (nchar(x) - 7L) * (9L - nchar(x)) >= 0L
}

#' @noRd
supplier_nchar <- function(x) {
  nchar(x) == 10L
}

#' @noRd
suppext_nchar <- function(x) {
  (nchar(x) - 11L) * (14L - nchar(x)) >= 0L
}

# TYPES
#' @noRd
medicare_ <- function(x) {
  is_numeric(substring(x, 3L, 6L))
}

#' @noRd
organ_ <- function(x) {
  substring(x, 3L, 3L) == "P"
}

#' @noRd
emergency_ <- function(x) {
  substring(x, 6L, 6L) %in% c("E", "F")
}

#' @noRd
medicaid_ <- function(x) {
  substring(x, 3L, 3L) %in% c("A", "B", "E", "F", "G", "H", "J", "K", "L")
}

#' @noRd
unit__ <- function(x) {
  substring(x, 3L, 3L) %in% c("M", "R", "S", "T", "U", "V", "W", "Y", "Z")
}


#' @noRd
unit_ <- function(x) {
  unit__(x) & is_numeric(substring(x, 4L, 4L))
}

#' @noRd
subunit_ <- function(x) {
  unit__(x) &
    substring(x, 4L, 4L) %in%
      c("A", "B", "C", "D", "E", "F", "G", "H", "J", "K")
}

#' @noRd
supplier_ <- function(x) {
  x %in% c("C", "D", "X")
}

#' @noRd
moh_ <- function(x) {
  substring(x, 3L, 3L) == "J"
}

#' @noRd
eipps_type_ <- function(x) {
  x %in% c("M", "R", "S", "T", "V")
}

#' @noRd
eipps_range_ <- function(x) {
  x %in% ccn::eipps_ranges$range
}

#' @noRd
infer_ccn_type <- function(x) {
  vctrs::vec_case_when(
    conditions = list(
      provider_nchar(x),
      provext_nchar(x),
      supplier_nchar(x),
      suppext_nchar(x),
      is.na(x)
    ),
    values = list(
      "provider",
      "provider_ext",
      "supplier",
      "supplier_ext",
      NA_character_
    )
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
      is.na(x)
    ),
    values = list(
      "medicare",
      "organ",
      "emergency",
      "medicaid",
      "unit",
      "subunit",
      NA_character_
    )
  )
}

#' @export
#' @rdname ccn
infer_form <- function(x) {
  x <- vec_data(x)
  # infer provider or supplier
  g <- collapse::GRP(infer_ccn_type(x), call = FALSE)
  g <- collapse::gsplit(NULL, g, use.g.names = TRUE)

  if (rlang::has_name(g, "provider_ext")) {
    # replace originals with shortened versions
    x[g$provider_ext] <- substring(x[g$provider_ext], 1L, 6L)
  }

  if (rlang::has_name(g, "provider")) {
    p <- collapse::GRP(infer_provider_type(x[g$provider]), call = FALSE)
    p <- collapse::gsplit(NULL, p, use.g.names = TRUE)
    g$provider <- NULL
  }

  c(g, p)
}
