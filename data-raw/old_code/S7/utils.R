#' @noRd
new_ccn_df <- function(x = list(), n = NULL, ..., class = NULL) {
  vctrs::new_data_frame(x, n = n, ..., class = c(class, "tbl_df", "tbl"))
}

#' @noRd
ccn_tbl <- function(...) {
  data <- vctrs::df_list(...)
  new_ccn_df(data, class = "ccn_tbl")
}

#' @noRd
ccnr_tbl <- function(...) {
  data <- vctrs::df_list(...)
  new_ccn_df(data, class = "ccnr_tbl")
}

#' @noRd
data_frame0 <- function(x, call = caller_call()) {
  check_data_frame(x, call = call)
  structure(x, class = c("tbl_df", "tbl", "data.frame"))
}

# vs(x, c("C", "D", "X"), c("ASC", "CLIA", "PXRF"), checkEnc = FALSE)
#' @noRd
vs <- function(x, v, o, ...) {
  kit::vswitch(
    x = x,
    values = v,
    outputs = o,
    default = NA_character_,
    nThread = 4L,
    ...
  )
}

# if_in(x, c(1L, 999L), "0001-0009")
#' @noRd
if_in <- function(x, rng, lbl) {
  stopifnot(
    "rng = c(1L, 999L)" = length(rng) == 2L,
    'lbl = "0001-0009"' = length(lbl) == 1L
  )
  kit::iif(as.integer(x) %between% rng, lbl, NA_character_, nThread = 4L)
}

# is_in(is_organ_type(x), "OPO")
#' @noRd
is_in <- function(x, txt) {
  kit::iif(x, txt, NA_character_, nThread = 4L)
}

#' @noRd
prefix_names <- function(x, prefix, sep = "_") {
  rlang::set_names(x, \(x) paste0(prefix, sep, x))
}
