# Tests for eq_build function --------------------------------------------------

all_urls <- eq_build_url()

test_that("url building function outputs correct class and type", {
  expect_type(all_urls, "character")
})

test_that("urls are as expected and formed properly", {
  expect_contains(
    all_urls,
    file.path(
      "https://earthquake.phivolcs.dost.gov.ph",
      "EQLatest-Monthly",
      c(
        lapply(
          X = 2018:2023,
          FUN = function(x, y) {
            file.path(x, paste0(x, "_", y, ".html"))
          },
          y = month.name
        ) |>
          unlist(),
        file.path(
          format(Sys.Date(), "%Y"),
          paste0(
            format(Sys.Date(), "%Y"), "_",
            month.name[1:(1:12)[month.name == format(Sys.Date(), format = "%B")]],
            ".html"
          )
        )
      )
    ) |>
      (\(x) c(x, "https://earthquake.phivolcs.dost.gov.ph/"))()
  )
})

test_that("warnings and errors are appropriate", {
  expect_warning(eq_build_url(.year = 2016:2020))
  expect_error(eq_build_url(.year = 2016))
  expect_error(eq_build_url(.year = 2016:2017))
  expect_error(eq_build_url(.month = 13))
  expect_error(eq_build_url(.month = "Abril"))
  expect_error(eq_build_url(.month = c("Abril", "May", "June")))
})
