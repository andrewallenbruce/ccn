#' Medicare Supplier
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name supplier
#' @returns character vector of names associated with codes.
#' @examples
#' is_supplier("10C0001062")
#' supplier_sequence("10C0001062")
#' is_supplier_type(c("C", "D", "X"))
#' supplier_type_abbr(c("C", "D", "X"))
#' supplier_type_desc(c("C", "D", "X"))
NULL

#' @rdname supplier
#' @export
is_supplier_type <- function(x) {
  x %in% c("C", "D", "X")
}

#' @rdname supplier
#' @export
is_supplier <- function(x) {
  is_supplier_type(substr_(x, 3L)) &
    (nchar(x) == 10L || nchar(x) > 10L & nchar(x) < 15L)
}

#' @rdname supplier
#' @export
supplier_sequence <- function(x) {
  Sequence(
    number = x,
    range = kit::iif(as_int(x) >= 1L & as_int(x) <= 9999999L, "0000001-9999999", NA_character_)
  )
}

#' @rdname supplier
#' @export
supplier_type_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("C", "D", "X"),
    outputs = c("ASC", "CLIA", "XRAY"),
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname supplier
#' @export
supplier_type_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = c("C", "D", "X"),
    outputs = c(
      "Ambulatory Surgical Center",
      "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory",
      "Portable X-Ray Facility"
    ),
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
SupplierType <- S7::new_class(
  name = "SupplierType",
  parent = Type,
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        supplier_type_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        supplier_type_desc(self@code)
    )
  )
)

#' @rdname supplier
#' @export
supplier_type <- function(x) {
  SupplierType(code = substr_(x, 3L))
}

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties  = list(
    sequence  = Sequence,
    type      = SupplierType,
    extension = Extension_Prop
  )
)
