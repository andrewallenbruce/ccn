# space("02TA01") |>
#   strsplit(" ") |>
#   _[[1]] |>
#   setNames(c("state", "type", "parent", "sequence")) |>
#   as.list()
#' @noRd
parse <- function(x) {
  # Medicare Provider: "670055" -> "67 0055"
  c(x, gsub("([A-Z0-9]{2})([0-9]{4})", "\\1 \\2", x, perl = TRUE) |> strsplit(" ") |> _[[1]]) |>
    rlang::set_names(c("number", "state", "sequence"))

  # Medicare OPO Provider: "05P001" -> "05 P 001"
  # IPPS Excluded Provider: "21T101" -> "21 T 101"
  # Medicaid Only Provider: "01L008" -> "01 L 008"
  c(x, gsub("([A-Z0-9]{2})([A-Z])([0-9]{3})", "\\1 \\2 \\3", x, perl = TRUE) |> strsplit(" ") |> _[[1]]) |>
    rlang::set_names(c("number", "state", "type", "sequence"))

  # Emergency Hospital: "12345E" -> "12 E 345"
  c(x, gsub("([A-Z0-9]{2})([0-9]{3})([E])", "\\1 \\3 \\2", x, perl = TRUE) |> strsplit(" ") |> _[[1]]) |>
    rlang::set_names(c("number", "state", "type", "sequence"))

  # IPPS Excluded Unit: "02TA01" -> "02 T A 01"
  c(x, gsub("([A-Z0-9]{2})([A-Z])([A-Z])([0-9]{2})", "\\1 \\2 \\3 \\4", x, perl = TRUE) |> strsplit(" ") |> _[[1]]) |>
    rlang::set_names(c("number", "state", "type", "parent", "sequence"))

  # Medicare Supplier: "10C0001062" -> "10 C 0001062"
  c(x, gsub("([A-Z0-9]{2})([CDX])([0-9]{7})", "\\1 \\2 \\3", x, perl = TRUE) |> strsplit(" ") |> _[[1]]) |>
    rlang::set_names(c("number", "state", "type", "sequence"))
}
