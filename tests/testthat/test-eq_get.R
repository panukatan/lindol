# Tests for get table function -------------------------------------------------

tab_list <- eq_get_table()

test_that("get table function outputs are as expected", {
  expect_type(tab_list, "list")
})

test_that("tables are of the correct structure", {
  expect_vector(tab_list, size = 1)
})

tab_list <- eq_get_table(latest = FALSE)
