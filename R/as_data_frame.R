#' @include unit.R
#' @include subunit.R
NULL

#' Convert to a data.frame
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns data.frame
#' @examples
#' data_frame("670055")
#' data_frame("21034E")
#' data_frame("01L008")
#' data_frame("01J008")
#' data_frame("05P001")
#' data_frame("21U101")
#' data_frame("21TA26")
#' data_frame("45D0634589")
#' @export
data_frame <- function(x) {
  if (is_decoded(x)) {
    return(as_data_frame(x))
  }
  as_data_frame(decode(x))
}

#' @noRd
is_decoded <- function(x) {
  rlang::inherits_any(
    x,
    c(
      "ccn::Emergency",
      "ccn::Medicaid",
      "ccn::Medicare",
      "ccn::Organ",
      "ccn::Subunit",
      "ccn::Unit",
      "ccn::Supplier"
    )
  )
}

#' @noRd
as_data_frame <- S7::new_generic("as_data_frame", "x")

S7::method(as_data_frame, Emergency) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "emergency",
    state = x@state@abbr,
    region = x@state@region,
    range = x@range,
    eipps = NA,
    type = x@type@abbr,
    parent = NA_character_,
    ext = NA_character_
  )
}

S7::method(as_data_frame, Medicaid) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "medicaid",
    state = x@state@abbr,
    region = x@state@region,
    range = if (is_moh_type(substring(x@ccn, 3L, 3L))) {
      x@range@series
    } else {
      x@range
    },
    eipps = NA,
    type = if (is_moh_type(substring(x@ccn, 3L, 3L))) {
      x@range@abbr
    } else {
      x@type@abbr
    },
    parent = NA_character_,
    ext = NA_character_
  )
}

S7::method(as_data_frame, Medicare) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "medicare",
    state = x@state@abbr,
    region = x@state@region,
    range = x@range@series,
    eipps = x@range@eipps,
    type = x@range@abbr,
    parent = NA_character_,
    ext = x@extension
  )
}

S7::method(as_data_frame, Organ) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "organ",
    state = x@state@abbr,
    region = x@state@region,
    range = x@range,
    eipps = NA,
    type = x@type@abbr,
    parent = NA_character_,
    ext = NA_character_
  )
}

S7::method(as_data_frame, Subunit) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "organ",
    state = x@state@abbr,
    region = x@state@region,
    range = NA_character_,
    eipps = x@type@eipps,
    type = x@type@abbr,
    parent = x@parent,
    ext = NA_character_
  )
}

S7::method(as_data_frame, Unit) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "organ",
    state = x@state@abbr,
    region = x@state@region,
    range = x@range,
    eipps = x@type@eipps,
    type = x@type@abbr,
    parent = x@parent,
    ext = NA_character_
  )
}

S7::method(as_data_frame, Supplier) <- function(x) {
  cheapr::fast_df(
    ccn = x@ccn,
    entity = "organ",
    state = x@state@abbr,
    region = x@state@region,
    range = x@range,
    eipps = NA,
    type = x@type@abbr,
    parent = NA_character_,
    ext = NA_character_
  )
}
