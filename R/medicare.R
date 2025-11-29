#' Medicare Providers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name medicare
#' @returns character vector of names associated with codes.
#' @examples
#' new_medicare("670055")
NULL

#' @rdname medicare
#' @export
medicare_range <- function(x) {
  x <- as_int(x)
  kit::nif(
    x >= 1L    & x <= 879L,  "0001-0879",
    x >= 880L  & x <= 899L,  "0880-0899",
    x >= 900L  & x <= 999L,  "0900-0999",
    x >= 1000L & x <= 1199L, "1000-1199",
    x >= 1200L & x <= 1224L, "1200-1224",
    x >= 1225L & x <= 1299L, "1225-1299",
    x >= 1300L & x <= 1399L, "1300-1399",
    x >= 1400L & x <= 1499L, "1400-1499",
    x >= 1500L & x <= 1799L, "1500-1799",
    x >= 1800L & x <= 1989L, "1800-1989",
    x >= 1990L & x <= 1999L, "1990-1999",
    x >= 2000L & x <= 2299L, "2000-2299",
    x >= 2300L & x <= 2499L, "2300-2499",
    x >= 2500L & x <= 2899L, "2500-2899",
    x >= 2900L & x <= 2999L, "2900-2999",
    x >= 3000L & x <= 3024L, "3000-3024",
    x >= 3025L & x <= 3099L, "3025-3099",
    x >= 3100L & x <= 3199L, "3100-3199",
    x >= 3200L & x <= 3299L, "3200-3299",
    x >= 3300L & x <= 3399L, "3300-3399",
    x >= 3400L & x <= 3499L, "3400-3499",
    x >= 3500L & x <= 3699L, "3500-3699",
    x >= 3700L & x <= 3799L, "3700-3799",
    x >= 3800L & x <= 3974L, "3800-3974",
    x >= 3975L & x <= 3999L, "3975-3999",
    x >= 4000L & x <= 4499L, "4000-4499",
    x >= 4500L & x <= 4599L, "4500-4599",
    x >= 4600L & x <= 4799L, "4600-4799",
    x >= 4800L & x <= 4899L, "4800-4899",
    x >= 4900L & x <= 4999L, "4900-4999",
    x >= 5000L & x <= 6499L, "5000-6499",
    x >= 6500L & x <= 6989L, "6500-6989",
    x >= 6990L & x <= 6999L, "6990-6999",
    x >= 7000L & x <= 8499L, "7000-8499",
    x >= 8500L & x <= 8899L, "8500-8899",
    x >= 8900L & x <= 8999L, "8900-8999",
    x >= 9000L & x <= 9799L, "9000-9799",
    x >= 9800L & x <= 9899L, "9800-9899",
    x >= 9900L & x <= 9999L, "9900-9999",
    default = NA_character_
  )
}

#' @rdname medicare
#' @export
medicare_range_abbr <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicare_ranges$range,
    outputs = ccn::medicare_ranges$abbr,
    default = NA_character_,
    nThread = 4L
  )
}

#' @rdname medicare
#' @export
medicare_range_desc <- function(x) {
  kit::vswitch(
    x       = x,
    values  = ccn::medicare_ranges$range,
    outputs = ccn::medicare_ranges$desc,
    default = NA_character_,
    nThread = 4L
  )
}

#' @noRd
MedicareSequence <- S7::new_class(
  name = "MedicareSequence",
  parent = SequenceFull,
  properties = list(
    range = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicare_range(self@number)
    ),
    abbr = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicare_range_abbr(self@range)
    ),
    desc = S7::new_property(
      S7::class_character,
      getter = function(self)
        medicare_range_desc(self@range)
    )
  )
)

#' @rdname medicare
#' @export
medicare_sequence <- function(x) {
  MedicareSequence(number = x)
}

#' @noRd
Medicare <- S7::new_class(
  name = "Medicare",
  parent = CCN,
  properties = list(extension = PropExtension)
)

#' @rdname medicare
#' @export
new_medicare <- function(x) {
  Medicare(
    ccn = x,
    entity = "Medicare Provider",
    state = state(x),
    sequence = medicare_sequence(substr_(x, c(3L, 6L)))
    # extension = ext_provider(x@ccn)
  )
}
