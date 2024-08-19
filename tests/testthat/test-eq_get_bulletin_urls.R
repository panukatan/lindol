# Test for eq_get_bulletin_urls functions ----------------------------------------------

url_list <- eq_get_bulletin_urls()

test_that("get_links function outputs are as expected", {
  expect_vector(url_list, ptype = character(), size = nrow(eq_data_summary()))
})

url_list <- eq_get_bulletin_urls(latest = FALSE)

test_that("get_links function outputs are as expected", {
  expect_vector(url_list, ptype = character())
})

url_list <- eq_get_bulletin_urls(.year = 2018)

test_that("tables are of the correct structure", {
  expect_vector(url_list, ptype = character())
})
