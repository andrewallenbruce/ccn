#' @noRd
nchar_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
nchar_provider_ext <- function(x) {
  nchar(x) %between% c(7L, 9L)
}

#' @noRd
nchar_supplier <- function(x) {
  nchar(x) == 10L
}

#' @noRd
nchar_supplier_ext <- function(x) {
  nchar(x) %between% c(11L, 14L)
}

#' @noRd
is_state_code <- function(x) {
  x %chin% ccn::state_codes$code
}

#' @noRd
is_supplier_type <- function(x) {
  x %chin% c("C", "D", "X")
}

#' @noRd
is_organ_type <- function(x) {
  x == "P"
}

#' @noRd
is_emergency_type <- function(x) {
  x %chin% c("E", "F")
}

#' @noRd
is_moh_type <- function(x) {
  x == "J"
}

#' @noRd
is_medicaid_type <- function(x) {
  x %chin% ccn::medicaid_types$code
}

#' @noRd
is_unit_type <- function(x) {
  x %chin% ccn::eipps_unit$code
}

#' @noRd
is_sub_type <- function(x) {
  x %chin% ccn::eipps_subunit$code
}

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
    is_numeric(x),                                              "medicare",
    is_organ_type(substr_(x, 3L)),                              "organ",
    is_emergency_type(substr_(x, 6L)),                          "emergency",
    is_medicaid_type(substr_(x, 3L)),                           "medicaid",
    is_unit_type(substr_(x, 3L)) & is_numeric(substr_(x, 4L)),  "unit",
    is_unit_type(substr_(x, 3L)) & is_sub_type(substr_(x, 4L)), "subunit",
    default = NA_character_
  )
}

#' @noRd
substr_seq <- function(x) {
  switch(provider_type(x),
    organ     = ,
    medicaid  = ,
    unit      = substr(x, 4L, 6L),
    medicare  = substr(x, 3L, 6L),
    emergency = substr(x, 3L, 5L),
    subunit   = substr(x, 5L, 6L),
    NA_character_
  )
}

#' @noRd
substr_typ <- function(x) {
  switch(
    provider_type(x),
    organ     = ,
    medicaid  = ,
    unit      = ,
    subunit   = substr_(x, 3L),
    emergency = substr_(x, 6L),
    NA_character_
  )
}

#' @noRd
ccn_ <- S7::new_class(
  name       = "ccn_",
  properties = list(
    num = S7::class_character,
    ste = S7::new_property(getter = \(self) substr(self@num, 1L, 2L)),
    seq = S7::new_property(getter = \(self) substr_seq(self@num)),
    typ = S7::new_property(getter = \(self) substr_typ(self@num)),
    par = S7::new_property(getter = \(self) {
      if (provider_type(self@num) == "subunit") substr_(self@num, 4L) else NA_character_
    }),
    ext = S7::new_property(default = NA_character_)
  )
)
