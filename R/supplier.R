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
#' is_supplier_type(c("C", "D", "X"))
#' supplier_range("9000000")
#' supplier_sequence("10C0001062")
#' supplier_abbr(c("C", "D", "X"))
#' supplier_desc(c("C", "D", "X"))
NULL

#' @rdname supplier
#' @export
is_supplier <- function(x) {
  is_supplier_type(substr_(x, 3L)) &
    (nchar(x) == 10L ||
       nchar(x) > 10L & nchar(x) < 15L)
}

#' @rdname supplier
#' @export
is_supplier_type <- function(x) {
  # vctrs::vec_in(x, c("C", "D", "X"))
  x %in_% c("C", "D", "X")
}

#' @rdname supplier
#' @export
supplier_range <- function(x) {
  x <- as_int(x)
  cheapr::if_else_(x >= 1L & x <= 9999999L, "0000001-9999999", NA_character_)
}

#' @rdname supplier
#' @export
supplier_sequence <- function(x) {
  Sequence(
    number = substr_(x, c(4L, 10L)),
    range = supplier_range(substr_(x, c(4L, 10L))))
}

#' @rdname supplier
#' @export
supplier_abbr <- function(x) {
  cheapr::val_match(
    x,
    "C" ~ "ASC",
    "D" ~ "CLIA",
    "X" ~ "XRAY",
    .default = NA_character_
  )
}

# TODO: Replace when vctrs updates
# supplier_abbr <- function(x) {
#   vctrs::vec_recode_values(x, c("C", "D", "X"), c("ASC", "CLIA", "XRAY"), default = NA_character_)
# }

#' @rdname supplier
#' @export
supplier_desc <- function(x) {
  cheapr::val_match(
    x,
    "C" ~ "Ambulatory Surgical Center",
    "D" ~ "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory",
    "X" ~ "Portable X-Ray Facility",
    .default = NA_character_
  )
}

# TODO: Replace when vctrs updates
# supplier_desc <- function(x) {
#   vctrs::vec_recode_values(
#   x,
#   c("C", "D", "X"),
#   c("Ambulatory Surgical Center", "Clinical Laboratory Improvement Amendments of 1988 (CLIA) Laboratory", "Portable X-Ray Facility"),
#   NA_character_)
# }

#' @noRd
SupplierType <- S7::new_class(
  name = "SupplierType",
  parent = Type,
  properties = list(
    code = S7::class_character,
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        supplier_abbr(self@code)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        supplier_desc(self@code)
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
