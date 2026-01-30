#' @noRd
S3_as_df <- function(x, ...) {
  `class<-`(list2DF(c(entity = class(x), x)), c("tbl_df", "tbl", "data.frame"))
}

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.medicare <- S3_as_df

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.organ <- S3_as_df

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.emergency <- S3_as_df

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.supplier <- S3_as_df

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.medicaid <- S3_as_df

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.unit <- S3_as_df

#' @rdname slice_medicare
#' @export
#' @keywords internal
as.data.frame.subunit <- S3_as_df
