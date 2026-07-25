utils::globalVariables(c("x"))

.onLoad <- function(libname, pkgname) {
  requireNamespace("pillar", quietly = TRUE)
}
