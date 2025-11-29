#' @noRd
prefix_names <- function(x, prefix, sep = "_") {
  rlang::set_names(x, \(x) paste0(prefix, sep, x))
}

#' @noRd
as_int <- function(x) {
  if (!rlang::is_integerish(x)) as.integer(x) else x
}

#' @noRd
to_string <- function(x) {
  paste0(x, collapse = "")
}

#' @noRd
unlist_ <- function(x, ...) {
  unlist(x, use.names = FALSE, ...)
}

#' @noRd
substr_ <- function(x, i) {
  i <- if (length(i) == 1L) c(i, i) else i
  substr(x = x, start = i[1], stop = i[2])
}

#' @noRd
has_letter <- function(x) {
  grepl("[A-Z]", x, ignore.case = TRUE, perl = TRUE)
}

#' @noRd
is_numeric <- function(x) {
  !has_letter(x)
}

#' @noRd
has_hyphen <- function(x) {
  grepl("-", x, fixed = TRUE)
}

#' @noRd
remove_hyphen <- function(x) {
  if (has_hyphen(x)) gsub("-", "", x, fixed = TRUE) else x
}

#' @noRd
clean <- function(x) {
  remove_hyphen(toupper(x))
}

################## REMOVE EVENTUALLY

#' @noRd
qs_url <- function(url) qs::qread_url(url)

#' @noRd
mount_board <- function(source = c("local", "remote")) {
  switch(
    match.arg(source),
    local = pins::board_folder(fs::path_package(
      "extdata/pins",
      package = "ccn"
      )
    ),
    remote = pins::board_url(paste0(
      "https://raw.githubusercontent.com/",
      "andrewallenbruce/ccn/master/inst/extdata/pins/"
      )
    )
  )
}

#' @noRd
get_pin <- function(pin, ...) {
  board <- mount_board(...)
  pin   <- rlang::arg_match0(pin, list_pins())
  pins::pin_read(board, pin)
}

#' @noRd
list_pins <- function(...) {
  board <- mount_board(...)
  pins::pin_list(board)
}
