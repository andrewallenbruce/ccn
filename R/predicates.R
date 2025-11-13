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
#' x[is_medicaid_type(x)]
#' x[is_excluded_type(x)]
#' x[is_emergency_type(x)]
#' x[is_supplier_type(x)]
#' x[is_opo_type(x)]
#' all(is_state_code(ccn:::state_codes))
NULL

#' @rdname predicates
#' @export
is_medicaid_type <- make_test(MEDICAID_FACILITY_CODE_LIST)

#' @rdname predicates
#' @export
is_excluded_type <- make_test(IPPS_EXCLUDED_TYPE_CODE_LIST)

#' @rdname predicates
#' @export
is_emergency_type <- make_test(EMERGENCY$CODE)

#' @rdname predicates
#' @export
is_supplier_type <- make_test(SUPPLIER$CODE)

#' @rdname predicates
#' @export
is_opo_type <- make_test(OPO$CODE)

#' @rdname predicates
#' @export
is_state_code <- make_test(STATE$CODE)
