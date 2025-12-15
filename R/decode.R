#' Decode CCNs
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns S7 object of class `Medicare`.
#' @examples
#' decode("670055")
#' decode("123456")
#' decode("21034E")
#' decode("12345F")
#' decode("210101")
#' decode("21T101")
#' decode("21S101")
#' decode("21U101")
#' decode("01L008")
#' decode("22B201")
#' decode("23E301")
#' decode("34F401")
#' decode("01J008")
#' decode("A5J508")
#' decode("21SA26")
#' decode("21TA26")
#' decode("02TA01")
#' decode("04SD38")
#' decode("52TA05")
#' @export
decode <- function(x) {
  decode_(parse(x))
}

#' @noRd
decode_ <- S7::new_generic("decode_", "x")

S7::method(decode_, S7::new_S3_class("medicare")) <- function(x) {
  Medicare(
    ccn = x[["ccn"]],
    state = State(x[["state"]]),
    range = RangeMCR(x[["sequence"]]),
    extension = x[["extension"]] %||% NA_character_
  )
}

S7::method(decode_, S7::new_S3_class("medicaid")) <- function(x) {
  Medicaid(
    ccn = x[["ccn"]],
    state = State(x[["state"]]),
    range = if (is_moh_type(x[["type"]])) {
      RangeMOH(x[["sequence"]])
    } else {
      if_in(x[["sequence"]], c(1L, 999L), "001-999")
    },
    type = TypeMOF(x[["type"]])
  )
}

S7::method(decode_, S7::new_S3_class("emergency")) <- function(x) {
  Emergency(
    ccn = x[["ccn"]],
    state = State(x[["state"]]),
    range = if_in(x[["sequence"]], c(1L, 999L), "001-999"),
    type = emergency_type(x[["type"]])
  )
}

S7::method(decode_, S7::new_S3_class("unit")) <- function(x) {
  Unit(
    ccn = x[["ccn"]],
    state = State(x[["state"]]),
    range = if_in(x[["sequence"]], c(1L, 999L), "001-999"),
    type = TypeUnit(x[["type"]])
  )
}

S7::method(decode_, S7::new_S3_class("subunit")) <- function(x) {
  Subunit(
    ccn = x[["ccn"]],
    state = State(x[["state"]]),
    type = TypeUnit(x[["type"]])
  )
}

# local({
#   S7::method(print, Medicare) <- function(x, ...) {
#     cli::cli_text(
#       paste0(rep(cli::symbol$line, 4), collapse = ""),
#       "<{cli::col_cyan(class(x)[1])}>"
#     )
#     cli::cli_text(cli::symbol$circle_filled, " CCN: <{cli::col_yellow(x@ccn)}>")
#     cli::cli_text(
#       cli::symbol$circle_filled,
#       " State: {cli::col_yellow(x@state@abbr)} - {cli::col_green(x@state@name)}"
#     )
#     cli::cli_text(
#       cli::symbol$circle_filled,
#       " Facility Type: {cli::col_yellow(x@range@abbr)} - {cli::col_green(x@range@desc)}"
#     )
#     cli::cli_text(
#       cli::symbol$circle_filled,
#       " IPPS-Excluded: {if (x@range@eipps) cli::col_red(cli::symbol$tick) else cli::col_yellow(cli::symbol$cross)}"
#     )
#     invisible(x)
#   }
# })
