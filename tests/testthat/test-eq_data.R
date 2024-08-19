# Tests for eq_data function ---------------------------------------------------

test_that("eq_data function output is appropriate", {
  expect_s3_class(eq_data_summary(), "tbl")
})

#eq_df <- eq_data_bulletin(.year = 2018, .month = "January")
#eq_df <- eq_data_bulletin(.year = 2019, .month = "January")

# test_that("eq_data function output is appropriate", {
#   expect_s3_class(eq_df, "tbl")
# })
