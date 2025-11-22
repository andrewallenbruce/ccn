#' Facility Type Codes
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name types
#' @returns character vector of names associated with codes.
#' @examples
#' x <- LETTERS
#'
#' x[is_type_supplier(x)]
#' supplier_abbr(x[is_type_supplier(x)])
#' supplier_desc(x[is_type_supplier(x)])
#' type_supplier("C")
#'
#' x[is_type_emergency(x)]
#' emergency_abbr(c("E", "F"))
#' emergency_desc(c("E", "F"))
#' type_emergency("E")
#'
#' x[is_type_opo(x)]
#' opo_abbr(x[is_type_opo(x)])
#' opo_desc(x[is_type_opo(x)])
#' type_opo(x[is_type_opo(x)])
#'
#' x[is_type_medicaid_only(x)]
#' medicaid_only_abbr(x[is_type_medicaid_only(x)])
#' medicaid_only_desc(x[is_type_medicaid_only(x)])
#' type_medicaid_only("A")
#'
#' x[is_type_ipps_excluded(x)]
#' ipps_excluded_abbr(x[is_type_ipps_excluded(x)])
#' ipps_excluded_desc(x[is_type_ipps_excluded(x)])
#' type_ipps_excluded("M")
NULL

#' @noRd
Type <- S7::new_class(
  name = "Type",
  properties = list(
    code = S7::new_property(
      S7::class_character,
      default = NA_character_
    ),
    abbr = S7::new_property(
      S7::class_character,
      default = NA_character_
    ),
    desc = S7::new_property(
      S7::class_character,
      default = NA_character_
    )
  )
)

#' @rdname types
#' @export
is_type_supplier <- function(x) {
  x %in_% c("C", "D", "X")
}

#' @rdname types
#' @export
supplier_abbr <- function(x) {
  cheapr::val_match(
    x,
    "C" ~ "ASC",
    "D" ~ "CLIA",
    "X" ~ "XRAY",
    .default = NA_character_
  )
}

#' @rdname types
#' @export
supplier_desc <- function(x) {
  cheapr::val_match(
    x,
    "C" ~ "Ambulatory Surgical Center",
    "D" ~ "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory",
    "X" ~ "Portable X-Ray Facility",
    .default = NA_character_
  )
}

#' @rdname types
#' @export
type_supplier <- function(x) {
  Type(
    code = x,
    abbr = supplier_abbr(x),
    desc = supplier_desc(x)
  )
}

#' @rdname types
#' @export
is_type_emergency <- function(x) {
  x %in_% c("E", "F")
}

#' @rdname types
#' @export
emergency_abbr <- function(x) {
  cheapr::val_match(
    x,
    "E" ~ "ER (NF)",
    "F" ~ "ER (F)",
    .default = NA_character_
  )
}

#' @rdname types
#' @export
emergency_desc <- function(x) {
  cheapr::val_match(
    x,
    "E" ~ "Non-Federal Emergency Hospital (Non-Participating)",
    "F" ~ "Federal Emergency Hospital (Non-Participating)",
    .default = NA_character_
  )
}

#' @rdname types
#' @export
type_emergency <- function(x) {
  Type(
    code = x,
    abbr = emergency_abbr(x),
    desc = emergency_desc(x)
  )
}

#' @rdname types
#' @export
is_type_opo <- function(x) {
  x == "P"
}

#' @rdname types
#' @export
opo_abbr <- function(x) {
  cheapr::if_else_(is_type_opo(x), "OPO", NA_character_)
}

#' @rdname types
#' @export
opo_desc <- function(x) {
  cheapr::if_else_(is_type_opo(x), "Organ Procurement Organization", NA_character_)
}

#' @rdname types
#' @export
type_opo <- function(x) {
  Type(
    code = x,
    abbr = opo_abbr(x),
    desc = opo_desc(x)
  )
}

#' @rdname types
#' @export
is_type_medicaid_only <- function(x) {
  x %in_% c("A", "B", "E", "F", "G", "H", "J", "K", "L")
}

#' @rdname types
#' @export
medicaid_only_abbr <- function(x) {
  cheapr::case(
    x %in_% c("A", "B") ~ "NF (SNF)",
    x %in_% c("E", "F") ~ "NF (ICF)",
    x %in_% c("G", "H") ~ "ICF-IID",
    x == "J"            ~ "MCD HOSP",
    x == "K"            ~ "MCD HHA",
    x == "L"            ~ "PRTF",
    .default = NA_character_
  )
}

#' @rdname types
#' @export
medicaid_only_desc <- function(x) {
  cheapr::case(
    x %in_% c("A", "B") ~ "Nursing Facility (Formerly Assigned to Medicaid Skilled Nursing Facility)",
    x %in_% c("E", "F") ~ "Nursing Facility (Formerly Assigned to Intermediate Care Facility)",
    x %in_% c("G", "H") ~ "Intermediate Care Facility for Individuals with Intellectual Disabilities",
    x == "J"            ~ "Medicaid-Only Hospital",
    x == "K"            ~ "Medicaid Home Health Agency",
    x == "L"            ~ "Psychiatric Residential Treatment Facility",
    .default = NA_character_
  )
}

#' @rdname types
#' @export
type_medicaid_only <- function(x) {
  Type(
    code = x,
    abbr = medicaid_only_abbr(x),
    desc = medicaid_only_desc(x)
  )
}

#' @rdname types
#' @export
is_type_ipps_excluded <- function(x) {
  x %in_% c("M", "R", "S", "T", "U", "W", "Y", "Z")
}

#' @rdname types
#' @export
ipps_excluded_abbr <- function(x) {
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

#' @rdname types
#' @export
ipps_excluded_desc <- function(x) {
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

#' @rdname types
#' @export
type_ipps_excluded <- function(x) {
  Type(
    code = x,
    abbr = ipps_excluded_abbr(x),
    desc = ipps_excluded_desc(x)
  )
}
