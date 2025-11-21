#' @include utils.R
NULL

#' Logical Predicates
#'
#' @description
#' Logical tests for various code types
#'
#' @param x character vector of codes to test.
#' @name predicates
#' @returns logical vector indicating if codes are of the specified type.
#' @examples
#' x <- LETTERS
#' x[is_type_medicaid(x)]
#' x[is_type_excluded(x)]
#' x[is_type_unit(x)]
#' x[is_type_emergency(x)]
#' x[is_type_supplier(x)]
#' x[is_type_opo(x)]
NULL

#' @rdname predicates
#' @export
is_type_medicaid <- make_test(MEDICAID$CODE)

#' @rdname predicates
#' @export
is_type_excluded <- make_test(EXCLUDED$CODE)

#' @rdname predicates
#' @export
is_type_unit <- make_test2(EXCLUDED$PARENT)

#' @rdname predicates
#' @export
is_type_emergency <- make_test(EMERGENCY$CODE)

#' @rdname predicates
#' @export
is_type_supplier <- make_test(SUPPLIER$CODE)

#' @rdname predicates
#' @export
is_type_opo <- make_test(OPO$CODE)

#' @noRd
is_provider <- function(x) {
  nchar(x) == 6L
}

#' @noRd
is_supplier <- function(x) {
  nchar(x) == 10L & is_type_supplier(substr_(x, 3L))
}

#' @noRd
is_provider_with_extension <- function(x) {
  nchar(x) > 6L & nchar(x) < 10L
}
