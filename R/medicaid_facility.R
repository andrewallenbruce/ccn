#' Medicaid-Only Facilities
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicaid_only_facility
#' @returns S7 object of class `MedicaidOnlyFacility`.
#' @examples
#' medicaid_only_facility("01L008")
#' medicaid_only_facility("22B201")
#' medicaid_only_facility("23E301")
#' medicaid_only_facility("34F401")
NULL

#' @noRd
mof_type_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_only_facility_types$code,
    outputs = ccn::medicaid_only_facility_types$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
mof_type_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_only_facility_types$code,
    outputs = ccn::medicaid_only_facility_types$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
MedicaidOnlyType <- S7::new_class(
  name       = "MedicaidOnlyType",
  parent     = Type,
  properties = list(
    abbr     = S7::new_property(
      S7::class_character,
      getter = function(self)
        mof_type_abbr(self@code)
    ),
    desc     = S7::new_property(
      S7::class_character,
      getter = function(self)
        mof_type_desc(self@code)
    )
  )
)

#' @noRd
mof_sequence <- function(x) {
  Sequence(
    number = x,
    range = kit::iif(as_int(x) >= 1L & as_int(x) <= 999L, "001-999", NA_character_)
  )
}

#' @noRd
mof_type <- function(x) {
  MedicaidOnlyType(code = x)
}

#' @noRd
MedicaidOnlyFacility <- S7::new_class(
  name       = "MedicaidOnlyFacility",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname medicaid_only_facility
#' @export
medicaid_only_facility <- function(x) {
  MedicaidOnlyFacility(
    ccn      = x,
    entity   = "Medicaid-Only Provider",
    state    = state(x),
    sequence = mof_sequence(substr(x, 4L, 6L)),
    type     = mof_type(substr_(x, 3L))
  )
}
