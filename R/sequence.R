#' Sequence Class and Constructors
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name sequence
#' @returns character vector of names associated with codes.
#' @examples
#' sequence_medicare("0055")
#' sequence_medicaid_only("232")
#' sequence_supplier("9000000")
#' sequence_emergency("500")
#' sequence_opo("50")
NULL

#' @noRd
Sequence <- S7::new_class(
  name = "Sequence",
  properties = list(
    number = S7::new_property(
      S7::class_character,
      default = NA_character_
    ),
    range = S7::new_property(
      S7::class_character,
      default = NA_character_
    ),
    abbr = S7::new_property(
      S7::class_character,
      default = NA_character_
    ),
    desc = S7::new_property(
      S7::class_character,
      default = NA_character_
    )
  )
)

#' @rdname sequence
#' @export
sequence_medicare <- function(x) {
  rng <- range_medicare(x)

  Sequence(
    number = x,
    range = rng,
    abbr = range_medicare_abbr(rng),
    desc = range_medicare_desc(rng)
  )
}

#' @rdname sequence
#' @export
sequence_medicaid_only <- function(x) {
  rng <- range_medicaid_only(x)

  Sequence(
    number = x,
    range = rng,
    abbr = range_medicaid_abbr(rng),
    desc = range_medicaid_desc(rng)
  )
}

#' @rdname sequence
#' @export
sequence_supplier <- function(x) {
  Sequence(number = x, range = range_supplier(x))
}

#' @rdname sequence
#' @export
sequence_emergency <- function(x) {
  Sequence(number = x, range = range_emergency(x))
}

#' @rdname sequence
#' @export
sequence_opo <- function(x) {
  Sequence(number = x, range = range_opo(x))
}
