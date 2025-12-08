#' @noRd
ccn_type <- function(x) {
  kit::nif(
    nchar_provider(x), "provider",
    nchar_provider_ext(x), "provider_ext",
    nchar_supplier(x), "supplier",
    nchar_supplier_ext(x), "supplier_ext",
    default = NA_character_
  )
}

#' @noRd
provider_type <- function(x) {
  kit::nif(
    is_numeric(slice_provider(x)), "medicare",
    is_organ_type(str3(x)), "organ",
    is_emergency_type(str6(x)), "emergency",
    is_medicaid_type(str3(x)), "medicaid",
    is_unit_type(str3(x)) & is_numeric(str4(x)), "unit",
    is_unit_type(str3(x)) & is_sub_type(str4(x)), "subunit",
    default = NA_character_
  )
}

#' @noRd
str_ste <- function(x) {
  substr(x, 1L, 2L)
}

#' @noRd
str3 <- function(x) {
  substr_(x, 3L)
}

#' @noRd
str4 <- function(x) {
  substr_(x, 4L)
}

#' @noRd
str6 <- function(x) {
  substr_(x, 6L)
}

#' @noRd
str_seq <- function(x) {
  switch(provider_type(x),
    organ = ,
    medicaid = ,
    unit = substr(x, 4L, 6L),
    medicare = substr(x, 3L, 6L),
    emergency = substr(x, 3L, 5L),
    subunit = substr(x, 5L, 6L),
    NA_character_
  )
}

#' @noRd
str_typ <- function(x) {
  switch(provider_type(x),
    organ = ,
    medicaid = ,
    unit = ,
    subunit = str3(x),
    emergency = str6(x),
    NA_character_
  )
}

#' Init CCN Parser
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param num ccn code as character vector.
#' @param ext optional extension code as character vector.
#' @name init
#' @returns character vector of names associated with codes.
#' @examples
#' init("670055")
#' init("05P001")
#' init("12345E")
#' init("10C0001062")
#' init("A5J508")
#' init("21T101")
#' init("02TA01")
NULL

#' @rdname init
#' @export
init <- S7::new_class(
  name = "init",
  properties = list(
    num = S7::class_character,
    ste = S7::new_property(getter = \(self) str_ste(self@num)),
    seq = S7::new_property(getter = \(self) str_seq(self@num)),
    typ = S7::new_property(getter = \(self) str_typ(self@num)),
    par = S7::new_property(getter = \(self) is_in(provider_type(self@num) == "subunit", str4(self@num))),
    ext = S7::new_property(default = NA_character_)
  )
)
