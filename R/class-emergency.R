#' Emergency Hospitals
#'
#' @description
#' CCNs assigned to Emergency Hospitals (both Federal and non-Federal)
#' that do not participate in the Medicare program.
#'
#' @details
#' Emergency hospitals are identified by a 6-position alphanumeric CCN.
#'
#' Positions one and two identify the state in which the hospital is located.
#'
#' Position six, an alpha character, identifies whether the hospital is Federal
#' (`F`) or non-Federal (`E`).
#'
#' Positions three, four and five represent a sequence beginning with `001`.
#' This sequence identifies the order, by state, in which the CCN was issued.
#'
#' For example, the CCN of the 34th emergency hospital in Maryland would be
#' `21034E`. The Regional Office assigns the CCN in strict numerical sequence
#' without regard to the Federal or non-Federal status.
#'
#' @param x `<character>` 6-position alphanumeric code.
#' @name emergency
#' @returns S7 object of class `<Emergency>`.
#' @examples
#' emergency("21034E")
#' emergency("12345F")
#' emergency("11038F") # USAF Hospital (Moody)
NULL

#' @noRd
emergency_type <- function(x) {
  Type(
    abbr = vs(x, c("E", "F"), c("NF", "F")),
    desc = vs(
      x,
      c("E", "F"),
      c("Non-Federal", "Federal")
    )
  )
}

#' @rdname emergency
#' @export
emergency <- function(x) {
  Emergency(
    ccn = x,
    state = state(x),
    range = if_in(substring(x, 3L, 5L), c(1L, 999L), "001-999"),
    type = emergency_type(substring(x, 6L, 6L))
  )
}
