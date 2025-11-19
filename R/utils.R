#' @noRd
as_sf <- function(x) {
  stringfish::sf_convert(as.character(x))
}

#' @noRd
pad_three <- function(x) {
  x <- as.character(x)
  n <- nchar(x)

  x[n == 1] <- paste0("00", x[n == 1])
  x[n == 2] <- paste0("0",  x[n == 2])

  stringfish::sf_convert(x)
}

#' @noRd
pad_four <- function(x) {
  x <- as.character(x)
  n <- nchar(x)

  x[n == 1] <- paste0("000", x[n == 1])
  x[n == 2] <- paste0("00",  x[n == 2])
  x[n == 3] <- paste0("0",   x[n == 3])

  stringfish::sf_convert(x)
}

#' @noRd
pad_seven <- function(x) {
  x <- as.character(x)
  n <- nchar(x)

  x[n == 1] <- paste0("000000", x[n == 1])
  x[n == 2] <- paste0("00000",  x[n == 2])
  x[n == 3] <- paste0("0000",   x[n == 3])
  x[n == 4] <- paste0("000",    x[n == 4])
  x[n == 5] <- paste0("00",     x[n == 5])
  x[n == 6] <- paste0("0",      x[n == 6])

  stringfish::sf_convert(x)
}

# nchars_ <- function(x) {
#   stringfish::sf_nchar(x, nthreads = 4L) |> as.character()
  # collapse::vlengths(c("adsfd", "sdgfahrf"), use.names = FALSE)
# }

# nchar_ <- function(x) {
#   stringfish::sf_nchar(x, nthreads = 4L)
# }

#' @noRd
to_string <- function(x) {
  stringfish::sf_collapse(x, collapse = "")
  # paste0(x, collapse = "")
}

#' @noRd
unlist_ <- function(x, ...) {
  unlist(x, use.names = FALSE, ...)
}

#' @noRd
substr_ <- function(x, s) {

  s <- if (length(s) == 1L) c(s, s) else s

  stringfish::sf_substr(
    x        = x,
    start    = s[1],
    stop     = s[2],
    nthreads = 4L
  )
}

#' @noRd
make_test <- function(named_list) {
  function(x) {
    !cheapr::is_na(collapse::fmatch(x, unlist_(named_list)))
  }
}

#' @noRd
make_test2 <- function(vec) {
  function(x) {
    !cheapr::is_na(collapse::fmatch(x, rlang::names2(vec)))
  }
}

#' @noRd
make_df <- function(x, col_names = NULL) {
  x <- purrr::map(x, \(x) cheapr::fast_df(field = x)) |>
    purrr::list_rbind(names_to = "constant") |>
    collapse::roworderv(c("constant", "field"))

  if (!is.null(col_names)) {
    colnames(x) <- col_names
  }
  x
}

#' @noRd
make_switch <- function(x) {

  e <- purrr::map(x, \(x) cheapr::fast_df(field = x)) |>
    purrr::list_rbind(names_to = "constant") |>
    collapse::roworderv(c("constant", "field"))

  function(x) {
    kit::vswitch(
      x       = x,
      values  = e$field,
      outputs = e$constant,
      default = NA_character_,
      nThread = 4L
    )
  }
}

#' @noRd
has_letter <- function(x) {
  stringfish::sf_grepl(x, "[A-Z]", nthreads = 4L)
}

#' @noRd
is_numeric <- function(x) {
  !has_letter(x)
}

#' @noRd
has_hyphen <- function(x) {
  stringfish::sf_grepl(x, "-", fixed = TRUE, nthreads = 4L)
}

#' @noRd
remove_hyphen <- function(x) {
  if (has_hyphen(x)) {
    stringfish::sf_gsub(x, "-", "", fixed = TRUE, nthreads = 4L)
  } else {
    x
  }
}

#' @noRd
clean <- function(x) {
  remove_hyphen(stringfish::sf_toupper(x))
}

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
