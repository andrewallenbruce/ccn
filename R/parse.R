#' Parse CMS Certification Numbers
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @name parse
#' @returns character vector of names associated with codes.
#' @examples
#' parse_medicare("670055")
#' parse_opo("05P001")
#' parse_emergency("12345E")
#' parse_supplier("10C0001062")
#' parse_medicaid("A5J508")
#' parse_unit("21T101")
#' parse_subunit("02TA01")
NULL

#' @noRd
parser <- function(
  entity,
  regex,
  groups = "\\2 \\3",
  names = c("type", "sequence")
) {
  function(x) {
    c(
      x,
      entity,
      strsplit(
        gsub(
          pattern = paste0("([0-9A-B][0-9])", regex),
          replacement = paste0("\\1 ", groups),
          x = x,
          perl = TRUE
        ),
        split = " ",
        fixed = TRUE
      )
    ) |>
      unlist_() |>
      rlang::set_names(c("ccn", "entity", "state", names))
  }
}

# Medicare Provider: 670055 -> 67 0055
#' @rdname parse
#' @export
parse_medicare <- parser(
  entity = "Medicare Provider",
  regex = "([0-9]{4})",
  groups = "\\2",
  names = "sequence"
)

# Medicare OPO Provider: 05P001 -> 05 P 001
#' @rdname parse
#' @export
parse_opo <- parser(
  entity = "Medicare Provider",
  regex = "([P])([0-9]{3})"
)

# Emergency Hospital: 12345E -> 12 E 345
#' @rdname parse
#' @export
parse_emergency <- parser(
  entity = "Emergency Hospital",
  regex = "([0-9]{3})([E])",
  groups = "\\3 \\2"
)

# Medicare Supplier: 10C0001062 -> 10 C 0001062
#' @rdname parse
#' @export
parse_supplier <- parser(
  entity = "Medicare Supplier",
  regex = "([CDX])([0-9]{7})",
  groups = "\\2 \\3"
)

# Medicaid-Only Facility: 01L008 -> 01 L 008
#' @rdname parse
#' @export
parse_medicaid <- parser(
  entity = "Medicaid-Only Provider",
  regex = "([ABE-HJ-L])([0-9]{3})"
)

# IPPS-Excluded Provider: 21T101 -> 21 T 101
#' @rdname parse
#' @export
parse_unit <- parser(
  entity = "IPPS-Excluded Unit",
  regex = "([MR-UWYZ])([0-9]{3})",
  groups = "\\2 \\3"
)

# IPPS-Excluded Unit: 02TA01 -> 02 T A 01
#' @rdname parse
#' @export
parse_subunit <- parser(
  entity = "IPPS-Excluded Subunit",
  regex = "([MR-UWYZ])([A-HJK])([0-9]{2})",
  groups = "\\2 \\3 \\4",
  names = c("type", "parent", "sequence")
)
