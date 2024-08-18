# Tests for eq_get_bulletins ---------------------------------------------------

bulletin_df <- eq_get_bulletin_urls(.year = 2018) |>
  (\(x) x[1:10])() |>
  eq_get_bulletins()

test_that("outpout of eq_get_bulletins function is as expected", {
  expect_s3_class(bulletin_df, "tbl")
  expect_named(
    bulletin_df,
    c("date_time", "bulletin_number", "depth", "magnitude", "location",
      "origin", "reported_intensity", "expect_damage", "expect_aftershocks",
      "date_time_issued", "prepared_by")
  )
  expect_equal(nrow(bulletin_df), 10)
})
