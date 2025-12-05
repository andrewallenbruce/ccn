#' Medicaid-Only Facilities
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicaid
#' @returns S7 object of class `Medicaid`.
#' @examples
#' medicaid("01L008")
#' medicaid("22B201")
#' medicaid("23E301")
#' medicaid("34F401")
#' medicaid("01J008")
#' medicaid("A5J508")
NULL

#' @noRd
mof_type_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_types$code,
    outputs = ccn::medicaid_types$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
mof_type_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_types$code,
    outputs = ccn::medicaid_types$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
moh_range <- function(x) {
  ccn::medicaid_ranges$range[
    data.table::between(
      as_int(x),
      ccn::medicaid_ranges$start,
      ccn::medicaid_ranges$end)]
}

#' @noRd
moh_range_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_ranges$range,
    outputs = ccn::medicaid_ranges$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
moh_range_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicaid_ranges$range,
    outputs = ccn::medicaid_ranges$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
MedicaidType <- S7::new_class(
  name       = "MedicaidType",
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
mof_type <- function(x) {
  MedicaidType(code = x)
}

#' @noRd
mof_sequence <- function(x) {
  Sequence(x, if_in(x, c(1L, 999L), "0001-0009"))
}

#' @noRd
moh_sequence <- function(x) {
  SequenceMOH(number = x)
}

#' @noRd
Medicaid <- S7::new_class(
  name       = "Medicaid",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname medicaid
#' @export
medicaid <- function(x) {
  Medicaid(
    ccn      = x,
    entity   = "Medicaid-Only Provider",
    state    = state(x),
    sequence = if (substr_(x, 3L) == "J")
      moh_sequence(substr(x, 4L, 6L))
    else
      mof_sequence(substr(x, 4L, 6L)),
    type     = mof_type(substr_(x, 3L))
  )
}

