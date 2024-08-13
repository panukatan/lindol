# Tests for eq_data function ---------------------------------------------------

test_that("eq_data function output is appropriate", {
  expect_s3_class(eq_data(), "tbl")
})
