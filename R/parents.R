#' Assemble Unit/Subunit Parent CCN
#'
#' @param x `<chr>` A vector of CCNs.
#'
#' @returns A `<chr>` vector of parent CCNs
#'
#' @examples
#' parent_unit(c("45S788", "25U050", "39S027", "34S155", "29Z307"))
#' parent_subunit(c("21SA26", "21TA26", "02TA01", "04SD38", "52TA05"))
#'
#' x = ccn(get_pin("ccn"))
#'
#' tibble::tibble(
#'   unit = has_parent(x)$Unit,
#'   parent = parent_unit(has_parent(x)$Unit)) |>
#'   collapse::na_omit()
#'
#' tibble::tibble(
#'   subunit = has_parent(x)$Subunit,
#'   parent = parent_subunit(has_parent(x)$Subunit))
#' @name parent
NULL

#' @noRd
unit_infix <- function(x) {
  unit_types <- collapse::ss(
    ccn::unit_types,
    cheapr::which_not_na(ccn::unit_types[["infix"]])
  )
  vctrs::vec_slice(
    unit_types[["infix"]],
    vctrs::vec_match(x, unit_types[["code"]])
  )
}

#' @noRd
subunit_prefix <- function(x) {
  vctrs::vec_slice(
    ccn::subunit_types[["prefix"]],
    vctrs::vec_match(x, ccn::subunit_types[["code"]])
  )
}

#' @rdname parent
#' @export
parent_unit <- function(x) {
  fix <- unit_infix(substring(x, 3L, 3L))
  out <- paste0(substring(x, 1L, 2L), fix, substring(x, 4L, 6L))
  idx <- cheapr::which_not_na(fix)
  collapse::setv(x, cheapr::which_na(fix), NA)
  collapse::setv(x, idx, out[idx])
  return(x)
}


#' @rdname parent
#' @export
parent_subunit <- function(x) {
  paste0(
    substring(x, 1L, 2L),
    paste0(
      subunit_prefix(substring(x, 4L, 4L)),
      substring(x, 5L, 6L)
    )
  )
}

#' @rdname parent
#' @export
has_parent <- function(x) {
  UseMethod("has_parent")
}

#' @rdname parent
#' @export
has_parent.ccn <- function(x) {
  i <- collapse::get_elem(get_index(x), "Unit|Subunit", regex = TRUE)
  list(
    Unit = x[i$Unit][
      substring(x[i$Unit], 3L, 3L) %iin%
        ccn::unit_types[["code"]][collapse::whichNA(
          ccn::unit_types[["infix"]],
          invert = TRUE
        )]
    ],
    Subunit = x[i$Subunit][
      substring(x[i$Subunit], 4L, 4L) %iin%
        collapse::na_rm(ccn::subunit_types[["code"]])
    ]
  )
}
