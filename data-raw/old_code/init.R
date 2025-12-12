#' @noRd
str_ste <- function(x) {
  substring(x, 1L, 2L)
}

#' @noRd
str3 <- function(x) {
  substring(x, 3L, 3L)
}

#' @noRd
str4 <- function(x) {
  substring(x, 4L, 4L)
}

#' @noRd
str6 <- function(x) {
  substring(x, 6L, 6L)
}

#' @noRd
str_seq <- function(x) {
  switch(
    provider_type(x),
    organ = ,
    medicaid = ,
    unit = substring(x, 4L, 6L),
    medicare = substring(x, 3L, 6L),
    emergency = substring(x, 3L, 5L),
    subunit = substring(x, 5L, 6L),
    NA_character_
  )
}

#' @noRd
str_typ <- function(x) {
  switch(
    provider_type(x),
    organ = ,
    medicaid = ,
    unit = ,
    subunit = substring(x, 3L, 3L),
    emergency = substring(x, 6L, 6L),
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
    par = S7::new_property(getter = \(self) {
      is_in(provider_type(self@num) == "subunit", substring(self@num, 4L, 4L))
    }),
    ext = S7::new_property(default = NA_character_)
  )
)
