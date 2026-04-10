# decode_medicaid_type(c("A", "K", NA))
#' @noRd
decode_medicaid_type <- function(x) {
  vec_recode_values(
    x,
    from = vec_c("A", "B", "E", "F", "G", "H", "J", "K", "L", NA_character_),
    to = vec_c("SNF-NF", "ICF-IID", "MOH", "HHA", "PRTF", NA_character_)
  )
}

# decode_unit_type(c("M", "T", "Z", NA))
#' @noRd
decode_unit_type <- function(x) {
  vec_recode_values(
    x,
    from = vec_c("M", "R", "S", "T", "U", "V", "W", "Y", "Z", NA_character_),
    to = vec_c(
      "PSYCH [CAH] (EIPPS)",
      "IRU [CAH] (EIPPS)",
      "PSYCH (EIPPS)",
      "IRU (EIPPS)",
      "SWING [ACUTE]",
      "ADU (EIPPS)",
      "SWING [LTCH]",
      "SWING [IRF]",
      "SWING [CAH]",
      NA_character_
    )
  )
}

# unit_type_infix(c("M", "T", "Z", NA))
#' @noRd
unit_type_infix <- function(x) {
  vec_recode_values(
    x,
    from = vec_c("M", "R", "U", "W", "Y", "Z", NA_character_),
    to = vec_c("1", "1", "0", "2", "3", "1", NA_character_)
  )
}

# subunit_type_prefix(c("A", "K", NA))
#' @noRd
subunit_type_prefix <- function(x) {
  vec_recode_values(
    x,
    from = vec_c(
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "J",
      "K",
      NA_character_
    ),
    to = c(20:22, 30L, 33L, 40:44, NA_character_)
  )
}

# decode_supplier_type(c("C", "D", "X", NA))
#' @noRd
decode_supplier_type <- function(x) {
  vec_recode_values(
    x,
    from = vec_c("C", "D", "X", NA_character_),
    to = vec_c("ASC", "CLIA", "PXRF", NA_character_)
  )
}

# decode_emergency_type(c("E", "F", NA))
#' @noRd
decode_emergency_type <- function(x) {
  vec_recode_values(
    x,
    from = vec_c("E", "F", NA_character_),
    to = vec_c("NON", "FED", NA_character_)
  )
}

# decode_organ_type(c("P", NA))
#' @noRd
decode_organ_type <- function(x) {
  vec_recode_values(
    x,
    from = vec_c("P", NA_character_),
    to = vec_c("OPO", NA_character_)
  )
}
