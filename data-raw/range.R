library(vctrs)
"Federally Qualified Health Center" = list(c(1000L, 1199L), c(1800L, 1989L)),
"Alcohol/Drug Hospital (Number Retired)" = c(1200L, 1224L),
"Medical Assistance Facility" = c(1225L, 1299L),
"Critical Access Hospital" = c(1300L, 1399L)

args   <- list(x = 1234L, left = 1000L, right = 1199L)
args   <- vec_cast_common(!!!args)
x      <- args$x
args$x <- NULL
args   <- vec_recycle_common(!!!args, .size = vec_size(x))

left   <- args$left
right  <- args$right

left   <- vec_compare(x, left + 1000)
left   <- left >= 0L

right  <- vec_compare(x, right)
right  <- right <= 0L

left & right


`%inrange%` <- data.table::`%inrange%`()
`%between%` <- data.table::`%between%`

x = 1234L
x %between% c(1000L, 1199L) | x %between% c(1800L, 1989L)

MEDICAID_HOSPITAL_RANGES = list(
  # pad to THREE digits before use (001-099)
  # c(1L - 1L, 99L) + 100
  "Short-term Acute Care Hospital"  = c(1L, 99L),
  "Children's Hospital"             = c(100L, 199L),
  "Children's Psychiatric Hospital" = c(200L, 299L),
  "Psychiatric Hospital"            = c(300L, 399L),
  "Rehabilitation Hospital"         = c(400L, 499L),
  "Long-term Hospital"              = c(500L, 599L)
)

range <- data.table::data.table(
  start = c(1L, 100L, 200L, 300L, 400L, 500L),
  end = c(99L, 199L, 299L, 399L, 499L, 599L))

names(MEDICAID_HOSPITAL_RANGES)[data.table::between(123L, range$start, range$end)]
