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
NULL

#' @rdname predicates
#' @examples
#' is_medicaid_facility_type(LETTERS)
#' @autoglobal
#' @export
is_medicaid_facility_type <- make_test(MEDICAID_FACILITY_CODE_LIST)

#' @rdname predicates
#' @examples
#' is_ipps_excluded_type(LETTERS)
#' @autoglobal
#' @export
is_ipps_excluded_type <- make_test(IPPS_EXCLUDED_TYPE_CODE_LIST)

#' @rdname predicates
#' @examples
#' is_emergency_hospital_code(LETTERS)
#' @autoglobal
#' @export
is_emergency_hospital_code <- make_test(EMERGENCY_HOSPITAL_CODE_LIST)

#' @rdname predicates
#' @examples
#' is_supplier_code(LETTERS)
#' @autoglobal
#' @export
is_supplier_code <- make_test(SUPPLIER_CODE_LIST)
