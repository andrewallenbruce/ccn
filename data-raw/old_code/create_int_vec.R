create_int_vec <- function(
  x,
  collapse = ", ",
  enclose = c("c(", ")"),
  style = TRUE,
  ...
) {
  x <- paste0(gsub(" ", "", x), "L", collapse = collapse)
  x <- paste0(enclose[1], x, enclose[2], collapse = "")
  if (style) {
    x <- styler::style_text(text = x, ...)
  }
  return(x)
}

create_int_vec(ccn::medicare_ranges$start)
