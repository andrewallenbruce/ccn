#' Convert to a data.frame
#'
#' @param x ccn object
#'
#' @param ... additional arguments
#'
#' @returns list or data.frame
#'
#' @examplesIf FALSE
#' as_data_frame(decode("670055"))
#' as_data_frame(decode("05P001"))
#'
#' c("670055", "05P001", "210101", "21T101", "21S101", "21U101",
#'   "01L008", "12345E", "10C0001062", "45D0634589", "21X0009807",
#'   "02TA01", "04SD38", "52TA05", "212026", "21SA26", "21TA26",
#'   "24T019A", "33S23401", "330027001") |>
#' purrr::map(decode) |>
#' as_data_frame()
#' @name as_data_frame
NULL

#' @rdname as_data_frame
#' @export
as_data_frame <- S7::new_generic("as_data_frame", "x")

#' @noRd
as_df_impl <- function(ccn         = NA_character_,
                       entity      = NA_character_,
                       state_code  = NA_character_,
                       state_abbr  = NA_character_,
                       state_name  = NA_character_,
                       seq_number  = NA_character_,
                       seq_range   = NA_character_,
                       seq_abbr    = NA_character_,
                       seq_desc    = NA_character_,
                       type_code   = NA_character_,
                       type_abbr   = NA_character_,
                       type_desc   = NA_character_,
                       extension   = NA_character_,
                       parent_type = NA_character_,
                       parent_ccn  = NA_character_) {
  cheapr::fast_df(
    ccn         = ccn,
    entity      = entity,
    state_code  = state_code,
    state_abbr  = state_abbr,
    state_name  = state_name,
    seq_number  = seq_number,
    seq_range   = seq_range,
    seq_abbr    = seq_abbr,
    seq_desc    = seq_desc,
    type_code   = type_code,
    type_abbr   = type_abbr,
    type_desc   = type_desc,
    extension   = extension,
    parent_type = parent_type,
    parent_ccn  = parent_ccn
  )

}

S7::method(as_data_frame, Medicare) <- function(x) {
  as_df_impl(
    ccn = x@ccn,
    entity = x@entity,
    state_code = x@state@code,
    state_abbr = x@state@abbr,
    state_name = x@state@name,
    seq_number = x@sequence@number,
    seq_range = x@sequence@range,
    seq_abbr = x@sequence@abbr,
    seq_desc = x@sequence@desc,
    extension = x@extension,
  )
}
