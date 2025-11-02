#' Decode a CCN
#'
#' Decode a CCN into its component parts.
#'
#' @param x A character vector of CCNs to decode. Must be either 6 or 10 characters long.
#' @return A list with the decoded components of the CCN.
#' @examples
#' decode("670055")
#' decode("21-0101")
#' @export
#' @autoglobal
decode <- function(x) {

  # remove hyphen if present (typically in 3rd position)
  if (grepl("-", x, fixed = TRUE)) x <- gsub("-", "", x, fixed = TRUE)

  chars <- nchar(x)

  switch(
    as.character(chars),
    "6"  = decode_six(x),
    # "10" = decode_ten(x),
    stop("Invalid CCN length: ", chars, ". Must be 6 or 10 characters.", call. = FALSE)
  )
}

#' @noRd
#' @autoglobal
decode_six <- function(x) {

  # three <- substring(x, 3, 3)
  # if (grepl("[^0-9]", three, perl = TRUE, ignore.case = TRUE)) "A" else "YYY"

  fastplyr::list_tidy(
    ccn = x,
    CODE_state = substr(ccn, 1, 2),
    CODE_facility_type = substr(ccn, 3, 6)
  )

}
