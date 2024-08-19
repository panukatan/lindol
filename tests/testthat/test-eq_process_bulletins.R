# Tests for eq_process_bulletins function --------------------------------------

urls <- eq_get_bulletin_urls()
bulletin_df <- eq_get_bulletins(urls[1:10]) |>
  eq_process_bulletins()

test_that("eq_process_bulletins output is as expected", {
  expect_s3_class(bulletin_df, "tbl")
  expect_equal(nrow(bulletin_df), 10)
  expect_equal(ncol(bulletin_df), 14)
})
