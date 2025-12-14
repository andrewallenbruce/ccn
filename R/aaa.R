#' @include states.R

#' @noRd
Extension <- S7::new_property(S7::class_character, default = NA_character_)

#' @noRd
Range <- S7::new_class(
  name = "Range",
  properties = list(
    series = S7::class_character,
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

local({
  S7::method(print, Range) <- function(x, ...) {
    cli::cli_text("<{cli::col_cyan(class(x)[1])}>")

    glue::glue(
      '{cli::col_silver(format(S7::prop_names(x), justify = "right"))}',
      '{cli::col_grey(":")} {unname(S7::props(x))}'
    ) |>
      cat(sep = "\n")

    invisible(x)
  }
})

#' @noRd
Type <- S7::new_class(
  name = "Type",
  properties = list(
    abbr = S7::class_character,
    desc = S7::class_character
  )
)

local({
  S7::method(print, Type) <- function(x, ...) {
    cli::cli_text("<{cli::col_cyan(class(x)[1])}>")

    glue::glue(
      '{cli::col_silver(format(S7::prop_names(x), justify = "right"))}',
      '{cli::col_grey(":")} {unname(S7::props(x))}'
    ) |>
      cat(sep = "\n")

    invisible(x)
  }
})

#' @noRd
CCN <- S7::new_class(
  name = "CCN",
  properties = list(
    ccn = S7::class_character,
    state = State,
    range = S7::class_character | Range
  )
)

#' @noRd
Medicare <- S7::new_class(
  name = "Medicare",
  parent = CCN,
  properties = list(extension = Extension)
)

#' @noRd
Supplier <- S7::new_class(
  name = "Supplier",
  parent = CCN,
  properties = list(
    type = Type,
    extension = Extension
  )
)

#' @noRd
Emergency <- S7::new_class(
  name = "Emergency",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Organ <- S7::new_class(
  name = "Organ",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Medicaid <- S7::new_class(
  name = "Medicaid",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Unit <- S7::new_class(
  name = "Unit",
  parent = CCN,
  properties = list(type = Type)
)

#' @noRd
Subunit <- S7::new_class(
  name = "Subunit",
  properties = list(
    ccn = S7::class_character,
    type = Type
  )
)

#' @noRd
Parent <- S7::new_class(
  name = "Parent",
  parent = Medicare,
  properties = list(subunit = Subunit)
)
