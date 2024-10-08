# Tests for get table function -------------------------------------------------

tab_list <- eq_get_tables()

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

tab_list <- eq_get_tables(latest = FALSE)

current_month <- format(Sys.Date(), "%B")
size <- 72 + (1:12)[month.name == current_month]

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
  expect_null(eq_get_table("https://earthquake.phivolcs.dost.gov.ph/test"))
})



