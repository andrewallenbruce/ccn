decode <- function(x) {
  x <- clean(x)

  if (is_provider_nchar(x)) {
    return(switch(
      provider_type(x@ccn),
      medicare = as_medicare(x),
      opo = as_medicare_opo(x),
      emergency = as_emergency(x),
      medicaid = as_medicaid_only(x),
      excluded = as_excluded(x),
      x
    ))
  }

  if (is_supplier_nchar(x) & is_supplier_type(x)) {
    return(as_supplier(x))
  }
  return(x)
}
