# Tests for eq_process_bulletins function --------------------------------------

.url <- eq_build_url(.year = 2018, .month = "January")
urls <- eq_get_bulletin_links(.url)
bulletin_df <- eq_get_bulletins(urls[1:10]) |>
  eq_process_bulletins()

test_that("eq_process_bulletins output is as expected", {
  expect_s3_class(bulletin_df, "tbl")
  expect_equal(nrow(bulletin_df), 10)
  expect_equal(ncol(bulletin_df), 14)
})
