#' @include unit.R
#' @include subunit.R
NULL

#' @noRd
is_decoded <- function(x) {
  rlang::inherits_any(
    x,
    c(
      "ccn::Emergency",
      "ccn::Medicaid",
      "ccn::Medicare",
      "ccn::Organ",
      "ccn::Subunit",
      "ccn::Unit",
      "ccn::Supplier"
    )
  )
}

#' Convert to a data.frame
#'
#' @description
#' Convert various codes to their associated names.
#'
#' @param x character vector of codes to look up.
#' @returns data.frame
#' @examples
#' x = list("670055", "21034E", "01L008", "01J008", "05P001", "21U101", "21TA26", "45D0634589")
#'
#' purrr::map(x, \(x) as.data.frame(parse(x))) |> purrr::list_rbind()
#'
#' purrr::map(x, \(x) as_data_frame(x)) |> purrr::list_rbind()
#'
#' collapse::join(
#'   purrr::map(x, \(x) as.data.frame(parse(x))) |>
#'   purrr::list_rbind() |>
#'   rlang::set_names(c("class", "ccn", "cd_ste", "cd_seq", "cd_typ", "cd_par")),
#'   purrr::map(x, \(x) as_data_frame(x)) |>
#'   purrr::list_rbind(),
#'   verbose = 0L)
#' @export
as_data_frame <- function(x) {
  if (is_decoded(x)) {
    return(data_frame(x))
  }
  data_frame(decode(x))
}

#' @noRd
state0 <- function(x) {
  S7::prop(x, "state") |>
    (\(x) paste0(S7::prop(x, "abbr"), " (", S7::prop(x, "name"), ")"))()
}

#' @noRd
region0 <- function(x) {
  S7::prop(x, "state") |>
    (\(x) paste0(S7::prop(x, "region"), " (", S7::prop(x, "office"), ")"))()
}

#' @noRd
type0 <- function(x) {
  S7::prop(x, "type") |>
    (\(x) paste0(S7::prop(x, "abbr"), " (", S7::prop(x, "desc"), ")"))()
}

#' @noRd
range0 <- function(x) {
  S7::prop(x, "range") |>
    (\(x) paste0(S7::prop(x, "abbr"), " (", S7::prop(x, "desc"), ")"))()
}

#' @noRd
series0 <- function(x) {
  S7::prop(x, "range") |> S7::prop("series")
}

#' @noRd
ext0 <- function(x) {
  S7::prop(x, "extension")
}

#' @noRd
range0_medicaid <- function(x) {
  if (substring(S7::prop(x, "ccn"), 3L, 3L) == "J") {
    series0(x)
  } else {
    S7::prop(x, "range")
  }
}

#' @noRd
type0_medicaid <- function(x) {
  if (substring(S7::prop(x, "ccn"), 3L, 3L) == "J") {
    range0(x)
  } else {
    type0(x)
  }
}

#' @noRd
S7_as_df <- function(
  x,
  entity,
  range = S7::prop(x, "range"),
  eipps = NA,
  type = type0(x),
  parent = NA_character_,
  ext = NA_character_
) {
  `class<-`(
    cheapr::fast_df(
      ccn = S7::prop(x, "ccn"),
      entity = entity,
      state = state0(x),
      region = region0(x),
      range = range,
      eipps = eipps,
      type = type,
      parent = parent,
      ext = ext
    ),
    c("tbl_df", "tbl", "data.frame")
  )
}

#' @noRd
data_frame <- S7::new_generic("data_frame", "x")

S7::method(data_frame, Emergency) <- function(x) {
  S7_as_df(x, entity = "Emergency Hospital")
}

S7::method(data_frame, Medicaid) <- function(x) {
  S7_as_df(
    x,
    entity = "Medicaid-Only",
    range = range0_medicaid(x),
    type = type0_medicaid(x)
  )
}

S7::method(data_frame, Medicare) <- function(x) {
  S7_as_df(
    x,
    entity = "Medicare",
    range = series0(x),
    eipps = S7::prop(x, "range") |> S7::prop("eipps"),
    type = range0(x),
    ext = ext0(x)
  )
}

S7::method(data_frame, Organ) <- function(x) {
  S7_as_df(x, entity = "Medicare")
}

S7::method(data_frame, Subunit) <- function(x) {
  S7_as_df(
    x,
    entity = "Subunit",
    range = NA_character_,
    eipps = S7::prop(x, "type") |> S7::prop("eipps"),
    type = type0(x),
    parent = S7::prop(x, "parent")
  )
}

S7::method(data_frame, Unit) <- function(x) {
  S7_as_df(
    x,
    entity = "Unit",
    eipps = S7::prop(x, "type") |> S7::prop("eipps"),
    type = type0(x),
    parent = S7::prop(x, "parent")
  )
}

S7::method(data_frame, Supplier) <- function(x) {
  S7_as_df(
    x,
    entity = "Supplier",
    ext = ext0(x)
  )
}
