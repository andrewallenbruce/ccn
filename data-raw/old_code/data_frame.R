#' Convert to data.frame
#'
#' @param x ccn object
#'
#' @param ... additional arguments
#'
#' @returns data.frame
#'
#' @examples
#' c("670055", "05P001", "210101", "21T101", "21S101", "21U101", "01L008",
#' "12345E", "10C0001062", "45D0634589", "21X0009807", "02TA01", "04SD38",
#' "52TA05", "212026", "21SA26", "21TA26", "24T019A", "33S23401", "330027001") |>
#' purrr::map(\(x) as_data_frame(ccn(x))) |>
#' purrr::list_rbind() |>
#' ccn:::tbl()
#' @export
as_data_frame <- S7::new_generic("as_data_frame", "x")

S7::method(as_data_frame, MedicareProvider) <- function(x) {

  list2DF(as_list(x))

  # cheapr::fast_df(
  #   category      = "Medicare Provider",
  #   number        = S7::prop(x, "number"),
  #   seq_number    = S7::prop(x, "sequence")@number,
  #   seq_range     = S7::prop(x, "sequence")@range,
  #   seq_abbr      = S7::prop(x, "sequence")@abbr,
  #   seq_desc      = S7::prop(x, "sequence")@desc,
  #   state_code    = S7::prop(x, "state")@code,
  #   state_abbr    = S7::prop(x, "state")@abbr,
  #   state_name    = S7::prop(x, "state")@name,
  #   extension     = S7::prop(x, "extension") %||% NA_character_,
  #   type_code     = NA_character_,
  #   type_abbr     = NA_character_,
  #   type_desc     = NA_character_,
  #   parent_code   = NA_character_,
  #   parent_number = NA_character_
  # )
}

S7::method(as_data_frame, MedicareOPO) <- function(x) {
  cheapr::fast_df(
    category      = "Medicare Provider",
    number        = S7::prop(x, "number"),
    seq_number    = S7::prop(x, "sequence")@number,
    seq_range     = S7::prop(x, "sequence")@range,
    seq_abbr      = NA_character_,
    seq_desc      = NA_character_,
    state_code    = S7::prop(x, "state")@code,
    state_abbr    = S7::prop(x, "state")@abbr,
    state_name    = S7::prop(x, "state")@name,
    extension     = S7::prop(x, "extension") %||% NA_character_,
    type_code     = S7::prop(x, "type")@code,
    type_abbr     = S7::prop(x, "type")@abbr,
    type_desc     = S7::prop(x, "type")@desc,
    parent_code   = NA_character_,
    parent_number = NA_character_
  )
}

S7::method(as_data_frame, Supplier) <- function(x) {
  cheapr::fast_df(
    category      = "Medicare Supplier",
    number        = S7::prop(x, "number"),
    seq_number    = S7::prop(x, "sequence")@number,
    seq_range     = S7::prop(x, "sequence")@range,
    seq_abbr      = NA_character_,
    seq_desc      = NA_character_,
    state_code    = S7::prop(x, "state")@code,
    state_abbr    = S7::prop(x, "state")@abbr,
    state_name    = S7::prop(x, "state")@name,
    extension     = S7::prop(x, "extension") %||% NA_character_,
    type_code     = S7::prop(x, "type")@code,
    type_abbr     = S7::prop(x, "type")@abbr,
    type_desc     = S7::prop(x, "type")@desc,
    parent_code   = NA_character_,
    parent_number = NA_character_
  )
}

S7::method(as_data_frame, EmergencyHospital) <- function(x) {
  cheapr::fast_df(
    category      = "Emergency Hospital",
    number        = S7::prop(x, "number"),
    seq_number    = S7::prop(x, "sequence")@number,
    seq_range     = S7::prop(x, "sequence")@range,
    seq_abbr      = NA_character_,
    seq_desc      = NA_character_,
    state_code    = S7::prop(x, "state")@code,
    state_abbr    = S7::prop(x, "state")@abbr,
    state_name    = S7::prop(x, "state")@name,
    extension     = S7::prop(x, "extension") %||% NA_character_,
    type_code     = S7::prop(x, "type")@code,
    type_abbr     = S7::prop(x, "type")@abbr,
    type_desc     = S7::prop(x, "type")@desc,
    parent_code   = NA_character_,
    parent_number = NA_character_
  )
}

S7::method(as_data_frame, MedicaidOnlyProvider) <- function(x) {
  cheapr::fast_df(
    category      = "Medicaid-Only Provider",
    number        = S7::prop(x, "number"),
    seq_number    = S7::prop(x, "sequence")@number,
    seq_range     = S7::prop(x, "sequence")@range,
    seq_abbr      = S7::prop(x, "sequence")@abbr,
    seq_desc      = S7::prop(x, "sequence")@desc,
    state_code    = S7::prop(x, "state")@code,
    state_abbr    = S7::prop(x, "state")@abbr,
    state_name    = S7::prop(x, "state")@name,
    extension     = S7::prop(x, "extension") %||% NA_character_,
    type_code     = S7::prop(x, "type")@code,
    type_abbr     = S7::prop(x, "type")@abbr,
    type_desc     = S7::prop(x, "type")@desc,
    parent_code   = NA_character_,
    parent_number = NA_character_
  )
}

S7::method(as_data_frame, IppsExcludedProvider) <- function(x) {
  cheapr::fast_df(
    category      = "IPPS-Excluded Provider",
    number        = S7::prop(x, "number"),
    seq_number    = S7::prop(x, "sequence")@number,
    seq_range     = S7::prop(x, "sequence")@range,
    seq_abbr      = S7::prop(x, "sequence")@abbr,
    seq_desc      = S7::prop(x, "sequence")@desc,
    state_code    = S7::prop(x, "state")@code,
    state_abbr    = S7::prop(x, "state")@abbr,
    state_name    = S7::prop(x, "state")@name,
    extension     = S7::prop(x, "extension") %||% NA_character_,
    type_code     = S7::prop(x, "type")@code,
    type_abbr     = S7::prop(x, "type")@abbr,
    type_desc     = S7::prop(x, "type")@desc,
    parent_code   = NA_character_,
    parent_number = NA_character_
  )
}

S7::method(as_data_frame, IppsExcludedUnit) <- function(x) {
  cheapr::fast_df(
    category      = "IPPS-Excluded Unit",
    number        = S7::prop(x, "number"),
    seq_number    = S7::prop(x, "sequence")@number,
    seq_range     = S7::prop(x, "sequence")@range,
    seq_abbr      = S7::prop(x, "sequence")@abbr,
    seq_desc      = S7::prop(x, "sequence")@desc,
    state_code    = S7::prop(x, "state")@code,
    state_abbr    = S7::prop(x, "state")@abbr,
    state_name    = S7::prop(x, "state")@name,
    extension     = S7::prop(x, "extension") %||% NA_character_,
    type_code     = S7::prop(x, "type")@code,
    type_abbr     = S7::prop(x, "type")@abbr,
    type_desc     = S7::prop(x, "type")@desc,
    parent_code   = S7::prop(x, "parent")@code,
    parent_number = S7::prop(x, "parent")@number
  )
}
