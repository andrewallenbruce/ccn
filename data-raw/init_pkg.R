init_pkg <- function(
  name,
  local = "C:/Users/Andrew/Desktop/Repositories/",
  github = "https://github.com/andrewallenbruce/"
) {
  usethis::create_package(
    path = glue::glue("{local}{name}"),
    fields = list(
      Package = glue::glue("{name}"),
      `Authors@R` = utils::person(
        given = c("Andrew", "Allen"),
        family = "Bruce",
        email = "andrewallenbruce@gmail.com",
        role = c("aut", "cre", "cph")
      ),
      Maintainer = "Andrew Allen Bruce <andrewallenbruce@gmail.com>",
      URL = glue::glue("{github}{name}"),
      BugReports = glue::glue("{github}{name}/issues")
    )
  )
}

init_pkg("npis")
