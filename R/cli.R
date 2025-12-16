# local({
#   S7::method(print, State) <- function(x, ...) {
#     cli::cli_text("<{cli::col_cyan(class(x)[1])}>")
#
#     glue::glue(
#       '{cli::col_silver(format(S7::prop_names(x), justify = "right"))}',
#       '{cli::col_grey(":")} {unname(S7::props(x))}'
#     ) |>
#       cat(sep = "\n")
#
#     invisible(x)
#   }
# })

# local({
#   S7::method(print, Medicare) <- function(x, ...) {
#     cli::cli_text(
#       paste0(rep(cli::symbol$line, 4), collapse = ""),
#       "<{cli::col_cyan(class(x)[1])}>"
#     )
#     cli::cli_text(cli::symbol$circle_filled, " CCN: <{cli::col_yellow(x@ccn)}>")
#     cli::cli_text(
#       cli::symbol$circle_filled,
#       " State: {cli::col_yellow(x@state@abbr)} - {cli::col_green(x@state@name)}"
#     )
#     cli::cli_text(
#       cli::symbol$circle_filled,
#       " Facility Type: {cli::col_yellow(x@range@abbr)} - {cli::col_green(x@range@desc)}"
#     )
#     cli::cli_text(
#       cli::symbol$circle_filled,
#       " IPPS-Excluded: {if (x@range@eipps) cli::col_red(cli::symbol$tick) else cli::col_yellow(cli::symbol$cross)}"
#     )
#     invisible(x)
#   }
# })
