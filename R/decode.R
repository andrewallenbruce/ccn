#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x character vector of CCNs.
#' @param arg argument used for error messaging.
#' @param call environment used for error messaging.
#' @return list of CCN components.
#' @examples
#' decode("670055")
#' decode("21-0101")
#' decode("21-T101")
#' @export
#' @autoglobal
decode <- function(x, arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  check_character(x, arg = arg, call = call)
  check_length(remove_hyphen(x), arg = arg, call = call)
  decode_init(x)
}

#' @noRd
#' @autoglobal
decode_init <- function(x) {
  fastplyr::list_tidy(
    raw = x,
    std = remove_hyphen(raw),
    chr = nchar(std),
    vec = split_(std)
  )
}


