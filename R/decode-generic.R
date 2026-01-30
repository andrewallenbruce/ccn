#' Decode CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns S7 object of class `Medicare`.
#' @examples
#' x = c("670055", "21034E", "01L008", "01J008",
#'       "05P001", "21U101", "21TA26", "45D0634589")
#'
#' purrr::map(x, decode)
#' @export
decode <- function(x) {
  if (is_parsed(x)) {
    return(decode_(x))
  }
  decode_(parse(x))
}

#' @noRd
decode_ <- S7::new_generic("decode_", "x")

S7::method(decode_, S7::new_S3_class("emergency")) <- function(x) {
  Emergency(
    ccn = x$ccn,
    state = State(x$state),
    range = if_in(x$sequence, c(1L, 999L), "001-999"),
    type = emergency_type(x$type)
  )
}

S7::method(decode_, S7::new_S3_class("medicaid")) <- function(x) {
  Medicaid(
    ccn = x$ccn,
    state = State(x$state),
    range = if (is_moh_type(x$type)) {
      RangeMOH(x$sequence)
    } else {
      if_in(x$sequence, c(1L, 999L), "001-999")
    },
    type = TypeMOF(x$type)
  )
}

S7::method(decode_, S7::new_S3_class("medicare")) <- function(x) {
  Medicare(
    ccn = x$ccn,
    state = State(x$state),
    range = RangeMCR(x$sequence),
    extension = x$extension %||% NA_character_
  )
}

S7::method(decode_, S7::new_S3_class("organ")) <- function(x) {
  Organ(
    ccn = x$ccn,
    state = State(x$state),
    range = if_in(x$sequence, c(1L, 99L), "001-099"),
    type = org_type(x$type)
  )
}

S7::method(decode_, S7::new_S3_class("subunit")) <- function(x) {
  Subunit(
    ccn = x$ccn,
    state = State(x$state),
    type = TypeUnit(x$type)
  )
}

S7::method(decode_, S7::new_S3_class("supplier")) <- function(x) {
  Supplier(
    ccn = x$ccn,
    state = State(x$state),
    range = if_in(x$sequence, c(1L, 9999999L), "0000001-9999999"),
    type = supplier_type(x$type),
    extension = x$extension %||% NA_character_
  )
}

S7::method(decode_, S7::new_S3_class("unit")) <- function(x) {
  Unit(
    ccn = x$ccn,
    state = State(x$state),
    range = if_in(x$sequence, c(1L, 999L), "001-999"),
    type = TypeUnit(x$type)
  )
}
