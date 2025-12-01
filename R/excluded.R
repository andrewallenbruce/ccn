#' IPPS-Excluded Hospital Units/Swing-Bed Approvals
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name excluded
#' @returns character vector of names associated with codes.
#' @examples
#' x <- c("M", "R", "S", "T", "U", "W", "Y", "Z")
#' excluded_abbr(x)
#' excluded_desc(c("E", "F"))
#' excluded_type("E")
NULL

#' @rdname excluded
#' @export
excluded_abbr <- function(x) {
  cheapr::val_match(
    x,
    "M" ~ "PSYCH (CAH)",
    "R" ~ "REHAB (CAH)",
    "S" ~ "PSYCH",
    "T" ~ "REHAB",
    "U" ~ "SBA (ACUTE)",
    "W" ~ "SBA (LTCH)",
    "Y" ~ "SBA (REHAB)",
    "Z" ~ "SBA (CAH)",
    .default = NA_character_
  )
}

#' @rdname excluded
#' @export
excluded_desc <- function(x) {
  cheapr::val_match(
    x,
    "M" ~ "Psychiatric Unit of a Critical Access Hospital",
    "R" ~ "Rehabilitation Unit of a Critical Access Hospital",
    "S" ~ "Psychiatric Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital",
    "T" ~ "Rehabilitation Unit of a Short-Term, Cancer, Children's, LTCH, or Psychiatric Hospital",
    "U" ~ "Swing-Bed Approval for Short-Term Hospital",
    "W" ~ "Swing-Bed Approval for Long-Term Care Hospital",
    "Y" ~ "Swing-Bed Approval for Rehabilitation Hospital",
    "Z" ~ "Swing-Bed Approval for Critical Access Hospital",
    .default = NA_character_
  )
}

#' @rdname excluded
#' @export
excluded_type <- function(x) {
  Type(
    code = x,
    abbr = excluded_abbr(x),
    desc = excluded_desc(x)
  )
}
