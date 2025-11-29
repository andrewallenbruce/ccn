#' Medicaid-Only Hospitals
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicaid_hospital
#' @returns character vector of names associated with codes.
#' @examples
#' new_medicaid_only_hospital("01J008")
#' new_medicaid_only_hospital("A5J508")
NULL

#' @rdname medicaid_facility
#' @export
is_type_medicaid_hospital <- function(x) {
  x == "J"
}

#' @rdname medicaid_hospital
#' @export
medicaid_hospital_range <- function(x) {
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

#' @rdname medicaid_hospital
#' @export
medicaid_hospital_range_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_only_hospital_ranges$range,
    outputs = ccn::medicaid_only_hospital_ranges$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname medicaid_hospital
#' @export
medicaid_hospital_range_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_only_hospital_ranges$range,
    outputs = ccn::medicaid_only_hospital_ranges$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
MedicaidHospitalSequence <- S7::new_class(
  name = "MedicaidHospitalSequence",
  parent = SequenceFull,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_hospital_range(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_hospital_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicaid_hospital_range_desc(self@range)
    )
  )
)

#' @rdname medicaid_hospital
#' @export
medicaid_only_hospital_sequence <- function(x) {
  MedicaidHospitalSequence(number = x)
}

#' @rdname medicaid_hospital
#' @export
medicaid_only_hospital_type <- function(x) {
  Type(
    code = x,
    abbr = "MOH",
    desc = "Medicaid-Only Hospital"
  )
}

#' @noRd
MedicaidOnlyHospital <- S7::new_class(
  name = "MedicaidOnlyHospital",
  parent = CCN,
  properties = list(type = Type)
)

#' @rdname medicaid_hospital
#' @export
new_medicaid_only_hospital <- function(x) {
  MedicaidOnlyHospital(
    ccn = x,
    entity = "Medicaid-Only Provider",
    state = state(x),
    sequence = medicaid_only_hospital_sequence(substr_(x, c(4L, 6L))),
    type = medicaid_only_hospital_type(substr_(x, 3L))
    # extension = ext_provider(x)
  )
}
