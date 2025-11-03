#' @autoglobal
#' @noRd
has_hyphen <- function(x) stringfish::sf_grepl(x, "-", fixed = TRUE, nthreads = 4L)

#' @autoglobal
#' @noRd
rm_hyphen <- function(x) stringfish::sf_gsub(x, "-", "", fixed = TRUE, nthreads = 4L)

#' @autoglobal
#' @noRd
get_state_code <- function(x) stringfish::sf_substr(x, 1L, 2L, nthreads = 4L)

#' @autoglobal
#' @noRd
get_unit_code <- function(x) stringfish::sf_substr(x, 3L, 3L, nthreads = 4L)

#' @autoglobal
#' @noRd
has_unit_code <- function(x) stringfish::sf_grepl(x, "[^0-9]", nthreads = 4L)

#' @autoglobal
#' @noRd
get_facility_code <- function(x, at = 3L) stringfish::sf_substr(x, start = at, 6L, nthreads = 4L)

#' @autoglobal
#' @noRd
get_nchars <- function(x) stringfish::sf_nchar(x, nthreads = 4L)

#' @autoglobal
#' @noRd
make_switch <- function(x) {
  e <- x |>
    purrr::map(\(x) cheapr::fast_df(field = x)) |>
    purrr::list_rbind(names_to = "constant") |>
    collapse::roworder(constant, field)

  function(x) {
    kit::vswitch(x, e$field, e$constant, default = NA_character_, nThread = 4L)
  }
}

#' State Code Lookup
#' Convert state codes to standard state names.
#' @param x `[character]` vector of state codes.
#' @examples
#' state_code(c("00", "01"))
#' @returns character vector of state names.
#' @autoglobal
#' @export
state_code <- make_switch(x = STATE_CODES)

#' Supplier Code Lookup
#' Convert supplier codes to standard supplier names.
#' @param x character vector of supplier codes.
#' @examples
#' supplier_code(c("C", "D", "X"))
#' @returns character vector of supplier names.
#' @autoglobal
#' @export
supplier_code <- make_switch(x = SUPPLIER_CODES)

#' Emergency Code Lookup
#' Convert emergency codes to standard emergency names.
#' @param x character vector of emergency codes.
#' @examples
#' emergency_code(c("E", "F"))
#' @returns character vector of emergency names.
#' @autoglobal
#' @export
emergency_code <- make_switch(x = EMERGENCY_CODES)
