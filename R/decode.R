#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x A character vector of CCNs to decode. Must be either 6 or 10 characters long.
#' @return A list with the decoded components of the CCN.
#' @examples
#' decode("670055")
#' decode("21-0101")
#' decode("21-T101")
#' @export
#' @autoglobal
decode <- function(x) {

  # remove hyphen (typically in 3rd position)
  if (has_hyphen(x)) x <- remove_hyphen(x)

  chars <- get_nchars(x)

  switch(as.character(chars),
    "6" = decode_six(x),
    # "10" = decode_ten(x),
    stop(
      "Invalid CCN length: ",
      chars,
      ". Must be 6 or 10 characters.",
      call. = FALSE
    )
  )
}

#' @noRd
#' @autoglobal
decode_six <- function(x) {

  unit <- get_code_unit(x)
  has  <- has_code_unit(unit)
  unit <- if (has) unit else NULL

  # if the 3rd character is non-numeric, it's a unit code
  fastplyr::list_tidy(
    ccn           = x,
    CODE_state    = get_code_state(ccn),
    CODE_unit     = unit,
    CODE_facility = get_code_facility(ccn, if (has) 4L else 3L),
    .keep_null    = FALSE
  )
}
