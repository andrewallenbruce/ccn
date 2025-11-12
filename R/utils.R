#' @autoglobal
#' @noRd
as_sf <- function(x) {
  stringfish::sf_convert(as.character(x))
}

#' @autoglobal
#' @noRd
pad_three <- function(x) {
  x <- as.character(x)
  n <- nchar(x)

  x[n == 1] <- paste0("00", x[n == 1])
  x[n == 2] <- paste0("0",  x[n == 2])

  stringfish::sf_convert(x)
}

#' @autoglobal
#' @noRd
pad_four <- function(x) {
  x <- as.character(x)
  n <- nchar(x)

  x[n == 1] <- paste0("000", x[n == 1])
  x[n == 2] <- paste0("00",  x[n == 2])
  x[n == 3] <- paste0("0",   x[n == 3])

  stringfish::sf_convert(x)
}

#' @autoglobal
#' @noRd
nchars_ <- function(x) {
  stringfish::sf_nchar(x, nthreads = 4L) |> as.character()
  # collapse::vlengths(c("adsfd", "sdgfahrf"), use.names = FALSE)
}

#' @autoglobal
#' @noRd
nchar_ <- function(x) {
  stringfish::sf_nchar(x, nthreads = 4L)
}

#' @autoglobal
#' @noRd
string <- function(x) {
  stringfish::sf_collapse(x, collapse = "")
  # paste0(x, collapse = "")
}

#' @autoglobal
#' @noRd
unlist_ <- function(x, ...) {
  unlist(x, use.names = FALSE, ...)
}

#' @autoglobal
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

#' @autoglobal
#' @noRd
split_ <- function(x) {
  stringfish::sf_split(x, "", fixed = TRUE, nthreads = 4L)[[1]]
}

#' @autoglobal
#' @noRd
make_test <- function(named_list) {
  function(x) {
    !cheapr::is_na(collapse::fmatch(x, unlist_(named_list)))
  }
}

#' @autoglobal
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

#' @autoglobal
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
      # checkEnc = FALSE
    )
  }
}

#' @autoglobal
#' @noRd
has_letter <- function(x) {
  stringfish::sf_grepl(x, "[A-Z]", nthreads = 4L)
}

#' @autoglobal
#' @noRd
is_numeric <- function(x) {
  !has_letter(x)
}

#' @autoglobal
#' @noRd
has_hyphen <- function(x) {
  stringfish::sf_grepl(x, "-", fixed = TRUE, nthreads = 4L)
}

#' @autoglobal
#' @noRd
remove_hyphen <- function(x) {
  if (has_hyphen(x)) {
    stringfish::sf_gsub(x, "-", "", fixed = TRUE, nthreads = 4L)
  } else {
    x
  }
}

#' @autoglobal
#' @noRd
clean <- function(x) {
  remove_hyphen(stringfish::sf_toupper(x))
}
