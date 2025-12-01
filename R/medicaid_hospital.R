#' Medicaid-Only Hospitals
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicaid_only_hospital
#' @returns S7 object of class `MedicaidOnlyHospital`.
#' @examples
#' medicaid_only_hospital("01J008")
#' medicaid_only_hospital("A5J508")
NULL

#' @noRd
moh_range <- function(x) {
  ccn::medicaid_only_hospital_ranges$range[
    data.table::between(
      as_int(x),
      ccn::medicaid_only_hospital_ranges$start,
      ccn::medicaid_only_hospital_ranges$end)]
}

#' @noRd
moh_range_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_only_hospital_ranges$range,
    outputs = ccn::medicaid_only_hospital_ranges$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
moh_range_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_only_hospital_ranges$range,
    outputs = ccn::medicaid_only_hospital_ranges$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
SequenceMOH <- S7::new_class(
  name       = "SequenceMOH",
  parent     = SequenceFull,
  properties = list(
    range    = S7::new_property(
      S7::class_character,
      getter = function(self)
        moh_range(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        moh_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        moh_range_desc(self@range)
    )
  )
)

#' @noRd
moh_sequence <- function(x) {
  SequenceMOH(number = x)
}

#' @noRd
MedicaidOnlyHospital <- S7::new_class(
  name       = "MedicaidOnlyHospital",
  parent     = CCN,
  properties = list(type = MedicaidOnlyType)
)

#' @rdname medicaid_only_hospital
#' @export
medicaid_only_hospital <- function(x) {
  MedicaidOnlyHospital(
    ccn      = x,
    entity   = "Medicaid-Only Provider",
    state    = state(x),
    sequence = moh_sequence(substr(x, 4L, 6L)),
    type     = mof_type(substr_(x, 3L))
  )
}
