# REGEX FOR EACH CCN STANDARD
rm_brace <- \(x) stringr::str_remove_all(x, "[\\(\\)]")

glue_rex <- function(state = NULL,
                     type = NULL,
                     sequence = NULL,
                     parent = NULL) {
  glue::glue("^", "{state}",
    if (!is.null(type)) "[{type}]" else "{type}",
    if (!is.null(parent)) "[{parent}]" else "{parent}",
    "{sequence}",
    "$",
    sep = "", .null = NULL
  )
}

ccn_rex <- list(
  state = "[0-9A-B][0-9]",
  medicare = list(sequence = "[0-9]{4}"),
  organ = list(type = "P", sequence = "[0-9]{3}"),
  medicaid = list(type = "ABEFGHJKL", sequence = "[0-9]{3}"),
  supplier = list(type = "CDX", sequence = "[0-9]{7}"),
  emergency = list(type = "EF", sequence = "[0-9]{3}"),
  excluded = list(
    unit    = list(type = "MRSTUWYZ", sequence = "[0-9]{3}"),
    subunit = list(type = "MRSTUWYZ", parent = "ABCDEFGHJK", sequence = "[0-9]{2}")
  )
)

glue_rex(
  state    = ccn_rex$state,
  type     = ccn_rex$excluded$subunit$type,
  parent   = ccn_rex$excluded$subunit$parent,
  sequence = ccn_rex$excluded$subunit$sequence
)

jsonify::to_json(ccn_regex, unbox = FALSE) |>
  jsonify::pretty_json()

cat(yaml12::format_yaml(ccn_regex))

rex <- slash::slash$new(data = ccn_regex)

rex$get(path = "medicaid")

rex$print_tree()

R6::R6Class()

fastplyr::list_tidy(
  cap = "(^[0-9A-B][0-9])([CDX])([0-9]{7}$)",
  all = rm_brace(cap),
  asc = stringr::str_replace(cap, "\\[CDX\\]", "C"),
  clia = stringr::str_replace(cap, "\\[CDX\\]", "D"),
  prxf = stringr::str_replace(cap, "\\[CDX\\]", "X")
)
