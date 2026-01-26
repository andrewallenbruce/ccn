# vs(x, c("C", "D", "X"), c("ASC", "CLIA", "PXRF"), checkEnc = FALSE)
#' @noRd
vs <- function(x, v, o, ...) {
  kit::vswitch(
    x = x,
    values = v,
    outputs = o,
    default = NA_character_,
    nThread = 4L,
    ...
  )
}

# if_in(x, c(1L, 999L), "0001-0009")
#' @noRd
if_in <- function(x, rng, lbl) {
  stopifnot(
    "rng = c(1L, 999L)" = length(rng) == 2L,
    'lbl = "0001-0009"' = length(lbl) == 1L
  )
  kit::iif(as.integer(x) %between% rng, lbl, NA_character_, nThread = 4L)
}

# is_in(is_organ_type(x), "OPO")
#' @noRd
is_in <- function(x, txt) {
  kit::iif(x, txt, NA_character_, nThread = 4L)
}

#' @noRd
prefix_names <- function(x, prefix, sep = "_") {
  rlang::set_names(x, \(x) paste0(prefix, sep, x))
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

################## REMOVE EVENTUALLY

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

#' @noRd
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
