#' Convert to data.frame
#'
#' @param x ccn object
#'
#' @param ... additional arguments
#'
#' @returns data.frame
#'
#' @examples
#' (x <- ccn("01L008"))
#'
#' as_data_frame(x) |> str()
#' @export
as_data_frame <- S7::new_generic("as_data_frame", "x")

S7::method(as_data_frame, MedicaidOnlyProvider) <- function(x) {
  cheapr::new_df(
    category   = "Medicaid-Only Provider",
    number     = S7::prop(x, "number"),
    sequence   = x@sequence@number,
    seq_range  = x@sequence@range,
    seq_abbr   = x@sequence@abbr,
    seq_desc   = x@sequence@desc,
    state_code = x@state@code,
    state_abbr = x@state@abbr,
    state_name = x@state@name,
    extension  = x@extension %||% NA_character_,
    type_code  = x@type@code,
    type_abbr  = x@type@abbr,
    type_desc  = x@type@desc
  )
}

# as_data_frame <- S7::new_external_generic("base", "as.data.frame", "x")
# exportS3Method base::as.data.frame.ccn::MedicaidOnlyProvider
