# Test for eq_get_bulletin_urls functions ----------------------------------------------

.url <- eq_build_url(.year = 2020, .month = "January")
url_list <- eq_get_bulletin_links(.url)

test_that("get_links function outputs are as expected", {
  expect_vector(
    url_list, ptype = character(), 
    size = nrow(eq_data_summary(.year = 2020, .month = "January"))
  )
})

.url <- eq_build_url(.year = 2018)
url_list <- lapply(X = .url, eq_get_bulletin_links) |> unlist()

test_that("tables are of the correct structure", {
  expect_vector(
    url_list, ptype = character(),
    size = nrow(eq_data_summary(.year = 2018))
  )
})
