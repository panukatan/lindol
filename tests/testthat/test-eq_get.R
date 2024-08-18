# Tests for get table function -------------------------------------------------

tab_list <- eq_get_table()

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

tab_list <- eq_get_table(latest = FALSE)

current_month <- format(Sys.Date(), "%B")
size <- 72 + (1:12)[month.name == current_month]

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = size)
})

tab_list <- eq_get_table(.year = 2020)

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 12)
})

tab_list <- eq_get_table(.year = 2020, .month = 1)

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

tab_list <- eq_get_links()

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

tab_list <- eq_get_links(.year = 2020)

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 12)
  expect_named(tab_list, expected = paste(month.name, 2020))
})
