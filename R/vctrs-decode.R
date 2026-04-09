# decode_state(c("00", "01", "A5"))
#' @noRd
decode_state <- function(x) {
  vec_replace_values(x, from = ccn::states$code, to = ccn::states$abbr)
}
