# Tests for eq_build function --------------------------------------------------

all_urls <- eq_build_url()

test_that("url building function outputs correct class and type", {
  expect_type(all_urls, "character")
  expect_type(eq_build_url(.month = 1:5), "character")
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
            month.name[1:((1:12)[month.name == format(Sys.Date(), format = "%B")] - 1)],
            ".html"
          )
        )
      )
    ) |>
      (\(x) c(x, "https://earthquake.phivolcs.dost.gov.ph/"))() |>
      (\(x)
        {
          ## Quiet down error on SSL ----
          httr::config(ssl_verifypeer = 0L) |>
          httr::set_config()

          .session <- rvest::session(url = "https://earthquake.phivolcs.dost.gov.ph/")

          url_list <- rvest::read_html(.session) |>
            rvest::html_elements(css = ".auto-style94 .MsoNormalTable .auto-style96 a") |>
            rvest::html_attr(name = "href")

          latest_archive_url <- url_list |>
            grep(pattern = "[0-9]{4}", value = TRUE) |>
            basename() |>
            sub(pattern = ".html", replacement = "") |>
            sub(pattern = "_", replacement = " ") |>
            paste("01") |>
            as.Date(format = "%Y %B %d") |>
            (\(x) which(x = x == max(x)))() |>
            (\(x) url_list[x])()

          latest_month <- basename(latest_archive_url) |>
            stringr::str_extract(pattern = month.name) |>
            (\(x) x[!is.na(x)])()

          latest_year <- basename(latest_archive_url) |>
            stringr::str_extract(pattern = "[0-9]{4}")
        
          x[seq_len(which(grepl(pattern = paste0(latest_year, "_", latest_month), x = x)))]
      }
      )()
  )
  expect_contains(
    eq_build_url(.year = 2020, .month = 12),
    "https://earthquake.phivolcs.dost.gov.ph/EQLatest-Monthly/2020/2020_December.html"
  )
})

test_that("warnings and errors are appropriate", {
  expect_warning(eq_build_url(.year = 2016:2020))
  expect_error(eq_build_url(.year = 2016))
  expect_error(eq_build_url(.year = 2015:2016))
  expect_error(eq_build_url(.month = 13))
  expect_error(eq_build_url(.month = "Abril"))
  expect_error(eq_build_url(.month = c("Abril", "May", "June")))
})
