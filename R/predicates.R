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
#' x[type_medicaid(x)]
#' x[type_excluded(x)]
#' x[type_emergency(x)]
#' x[type_supplier(x)]
#' x[type_opo(x)]
#' all(is_state_code(ccn:::state_codes))
NULL

#' @rdname predicates
#' @export
type_medicaid <- make_test(MEDICAID$CODE)

#' @rdname predicates
#' @export
type_excluded <- make_test(IPPS_EXCLUDED$CODE)

#' @rdname predicates
#' @export
type_emergency <- make_test(EMERGENCY$CODE)

#' @rdname predicates
#' @export
type_supplier <- make_test(SUPPLIER$CODE)

#' @rdname predicates
#' @export
type_opo <- make_test(OPO$CODE)

#' @rdname predicates
#' @export
is_state_code <- make_test(STATE$CODE)
