#' Emergency Hospital CCNs
#'
#' @description
#' This S7 class represents CMS Certification Numbers (CCNs) assigned to
#' emergency hospitals (both Federal and non-Federal) that do not participate
#' in the Medicare program.
#'
#' @section Further Information:
#'
#' Emergency Hospital CMS Certification Numbers (Non-Participating Hospitals)
#' Rev. 29, Pg. 411, Iss. 04-20-07, Eff./Imp. 10-01-2007
#'
#' The CCN for emergency hospitals is a 6-position alphanumeric code. The first
#' 2 digits are the State code. The third, fourth, and fifth digits represent a
#' sequence number. The first emergency number in a State would contain the
#' sequence number `"001"`. In the sixth position use the letter `"E"` for
#' non-Federal emergency hospitals, or `"F"` for Federal emergency hospitals.
#'
#' For example, the 34th emergency hospital issued a CCN in Maryland would have
#' the number `"21-034E"`. The RO assigns the CCN in strict numerical sequence
#' without regard to the Federal or non-Federal status. If a terminated facility
#' again qualifies as an emergency hospital, the RO issues a new CCN. For a
#' non-participating hospital that is now fully participating, see subsection I.
#'
#' @param x character vector of codes to look up.
#' @name emergency
#' @returns S7 object of class `EmergencyHospital`.
#' @examples
#' emergency("21034E")
#' emergency("12345F")
NULL

#' @noRd
emergency_type <- function(x) {
  Type(
    code = x,
    abbr = kit::vswitch(x, c("E", "F"), c("NFEH", "FEH"), NA_character_, nThread = 4L),
    desc = kit::vswitch(
      x,
      c("E", "F"),
      c("Non-Federal Emergency Hospital", "Federal Emergency Hospital"),
      NA_character_,
      nThread = 4L
    )
  )
}

#' @noRd
emergency_sequence <- function(x) {
  Sequence(x, if_in(x, c(1L, 999L), "0001-0009"))
}

#' @noRd
Emergency <- S7::new_class(
  name       = "Emergency",
  parent     = CCN,
  properties = list(type = Type)
)

#' @rdname emergency
#' @export
emergency <- function(x) {
  Emergency(
    ccn      = x,
    entity   = "Emergency Hospital",
    state    = state(x),
    type     = emergency_type(substr_(x, 6L)),
    sequence = emergency_sequence(substr(x, 3L, 5L))
  )
}
