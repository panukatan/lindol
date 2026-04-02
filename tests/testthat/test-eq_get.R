# Tests for get table function -------------------------------------------------

tab_list <- eq_get_tables()

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

tab_list <- eq_get_tables(latest = FALSE)

## Quiet down error on SSL ----
httr::config(ssl_verifypeer = 0L) |>
  httr::set_config()

.session <- rvest::session(url = "https://earthquake.phivolcs.dost.gov.ph")

url_list <- rvest::read_html(.session) |>
  rvest::html_elements(css = ".auto-style94 .MsoNormalTable .auto-style96 a") |>
  rvest::html_attr(name = "href")

latest_archive_url <- url_list |>
  grepv(pattern = "[0-9]{4}") |>
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

size <- ((as.numeric(latest_year) - 2018) * 12) + 
  (1:12)[month.name == latest_month] + 1

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = size)
})

tab_list <- eq_get_tables(.year = 2020)

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 12)
})

tab_list <- eq_get_tables(.year = 2020, .month = 1)

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

test_that("eq_get_table works as expected", {
  expect_null(eq_get_table("https://earthquake.phivolcs.dost.gov.ph/test/test.url"))
})



