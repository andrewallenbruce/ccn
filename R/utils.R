#' @noRd
clean_ccn <- function(x) {
  remove_any_spaces(remove_non_alnums(toupper(x)))
}

#' @noRd
unlist_ <- function(x, ...) {
  unlist(x, use.names = FALSE, ...)
}

#' @noRd
substr_ <- function(x, index) {
  substring(text = x, first = index, last = index)
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
remove_non_alnums <- function(x) {
  gsub("[^[:alnum:]]*", "", x, perl = TRUE)
}

#' @noRd
remove_any_spaces <- function(x) {
  gsub("[[:space:]]*", "", x, perl = TRUE)
}

# clean("adsfgd ;.-")
#' @noRd
clean <- function(x) {
  remove_any_spaces(remove_non_alnums(toupper(x)))
}

#' Load a pin
#'
#' @param pin description
#' @param ... description
#' @export
#' @keywords internal
get_pin <- function(pin, ...) {
  board <- mount_board(...)
  pin <- rlang::arg_match0(pin, list_pins())
  pins::pin_read(board, pin)
}

#' @noRd
list_pins <- function(...) {
  board <- mount_board(...)
  pins::pin_list(board)
}

#' @noRd
mount_board <- function(source = c("local", "remote")) {
  switch(
    match.arg(source),
    local = pins::board_folder(fs::path_package(
      "extdata/pins",
      package = "ccn"
    )),
    remote = pins::board_url(paste0(
      "https://raw.githubusercontent.com/",
      "andrewallenbruce/ccn/master/inst/extdata/pins/"
    ))
  )
}
