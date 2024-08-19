# Tests for eq_data function ---------------------------------------------------

test_that("eq_data function output is appropriate", {
  expect_s3_class(eq_data_summary(), "tbl")
})

urls <- eq_get_bulletin_urls()
eq_df <- eq_get_bulletins(urls[1:3]) |>
  eq_data_bulletin()

test_that("eq_data function output is appropriate", {
  expect_s3_class(eq_df, "tbl")
})
