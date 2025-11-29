#' Medicaid-Only
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicaid
#' @returns character vector of names associated with codes.
#' @examples
#' medicaid_only_range(150)
#' medicaid_only_range_j(150)
#' medicaid_only_range_abbr("100-199")
#' medicaid_only_range_desc("100-199")
#' medicaid_only_sequence("250")
#' is_type_medicaid_only(c("A", "J", "L"))
#' medicaid_only_type_abbr(c("A", "J", "L"))
#' medicaid_only_type_desc(c("A", "J", "L"))
#' medicaid_only_type("A")
NULL

#' @rdname medicaid
#' @export
medicaid_only_range <- function(x) {
  kit::iif(as_int(x) >= 1L & as_int(x) <= 999L, "001-999", NA_character_)
}

#' @rdname medicaid
#' @export
medicaid_only_range_j <- function(x) {
  x <- as_int(x)
  kit::nif(
    x >= 1L   & x <= 99L,  "001-099",
    x >= 100L & x <= 199L, "100-199",
    x >= 200L & x <= 299L, "200-299",
    x >= 300L & x <= 399L, "300-399",
    x >= 400L & x <= 499L, "400-499",
    x >= 500L & x <= 599L, "500-599",
    x >= 600L & x <= 999L, "600-999",
    default = NA_character_
  )
}

#' @rdname medicaid
#' @export
medicaid_only_range_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_ranges$range,
    outputs = ccn::medicaid_ranges$abbr,
    default = NA_character_,
    nThread = 4L
  )
}



#' @rdname medicaid
#' @export
medicaid_only_range_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c(
      "001-099",
      "100-199",
      "200-299",
      "300-399",
      "400-499",
      "500-599",
      "600-999"
    ),
    outputs = c(
      "Medicaid-Only Short-Term Acute Care Hospital",
      "Medicaid-Only Children's Hospital",
      "Medicaid-Only Children's Psychiatric Hospital",
      "Medicaid-Only Psychiatric Hospital",
      "Medicaid-Only Rehabilitation Hospital",
      "Medicaid-Only Long-Term Hospital",
      "Reserved for Future Use"
    ),
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
MedicaidOnlySequence <- S7::new_class(
  name = "MedicaidOnlySequence",
  parent = SequenceFull,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_only_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_only_range_desc(self@range)
    )
  )
)

#' @rdname medicaid
#' @export
medicaid_only_sequence <- function(x) {
  MedicaidOnlySequence(
    number = x,
    range = medicaid_only_range(x)
  )
}

#' @rdname medicaid
#' @export
is_type_medicaid_only <- function(x) {
  x %in_% c("A", "B", "E", "F", "G", "H", "J", "K", "L")
}

#' @rdname medicaid
#' @export
medicaid_only_type_abbr <- function(x) {
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

#' @rdname medicaid
#' @export
medicaid_only_type_desc <- function(x) {
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

#' @noRd
MedicaidOnlyType <- S7::new_class(
  name = "MedicaidOnlyType",
  parent = Type,
  properties = list(
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_only_type_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_only_type_desc(self@code)
    )
  )
)

#' @rdname medicaid
#' @export
medicaid_only_type <- function(x) {
  MedicaidOnlyType(code = x)
}
