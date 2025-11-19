#' @include utils.R
NULL

#' Facility Ranges
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name ranges
#' @returns character vector of names associated with codes.
#' @examples
#' get_care_range(c("0055", "5232", "9999")) |>
#'  print() |>
#'  get_care_range_abbr() |>
#'  print() |>
#'  get_care_range_name()
#'
#' get_caid_range(c("055", "232", "599")) |>
#'  print() |>
#'  get_caid_range_abbr() |>
#'  print() |>
#'  get_caid_range_name()
NULL

#' @rdname ranges
#' @export
get_care_range <- make_switch(MEDICARE$RANGES)

#' @rdname ranges
#' @export
get_care_range_abbr <- make_switch(MEDICARE$ABBR)

#' @rdname ranges
#' @export
get_care_range_name <- make_switch(MEDICARE$NAME)

#' @rdname ranges
#' @export
get_caid_range <- make_switch(MEDICAID$RANGES)

#' @rdname ranges
#' @export
get_caid_range_abbr <- make_switch(MEDICAID$ABBR)

#' @rdname ranges
#' @export
get_caid_range_name <- make_switch(MEDICAID$NAME)

#' @rdname ranges
#' @export
get_opo_range <- make_switch(OPO$RANGE)

#' @rdname ranges
#' @export
get_supplier_range <- make_switch(SUPPLIER$RANGE)

#' @rdname ranges
#' @export
get_parent_prefix <- function(x) {
  unlist_(EXCLUDED$PARENT)[seq_along(EXCLUDED$PARENT) %% 2L == 0L][
    collapse::fmatch(x, rlang::names2(EXCLUDED$PARENT))]
}

#' @rdname ranges
#' @export
get_parent_abbr <- function(x) {
  unlist_(EXCLUDED$PARENT)[seq_along(EXCLUDED$PARENT) %% 2L == 1L][
    collapse::fmatch(x, rlang::names2(EXCLUDED$PARENT))]
}

#' @rdname ranges
#' @export
get_unit_sequence <- function(x) {
  to_string(c(get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))))
}
