#' @noRd
decode_state <- function(x) {
  vec_replace_values(x, from = ccn::states$code, to = ccn::states$abbr)
}
