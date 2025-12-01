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
