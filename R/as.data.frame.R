#' @noRd
S3_as_df <- function(x, ...) {
  `class<-`(list2DF(c(entity = class(x), x)), c("tbl_df", "tbl", "data.frame"))
}

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.medicare <- S3_as_df

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.organ <- S3_as_df

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.emergency <- S3_as_df

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.supplier <- S3_as_df

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.medicaid <- S3_as_df

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.unit <- S3_as_df

#' @export
#' @exportS3Method base::as.data.frame
as.data.frame.subunit <- S3_as_df
