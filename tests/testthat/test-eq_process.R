# Tests for eq_process function ------------------------------------------------

df <- eq_get_tables() |>
  eq_process_tables()

test_that("eq_process outputs are appropriate", {
  expect_s3_class(df, "tbl")
  expect_named(
    df,
    expected = c(
      "date_time_retrieved", "date_time",
      "latitude", "longitude",
      "depth", "magnitude", "location"
    )
  )
  expect_s3_class(df$date_time_retrieved, "POSIXt")
  expect_s3_class(df$date_time, "POSIXt")
  expect_vector(df$latitude, ptype = double())
  expect_vector(df$longitude, ptype = double())
  expect_vector(df$depth, ptype = double())
  expect_vector(df$magnitude, ptype = double())
})


df <- eq_get_tables(.year = 2020) |>
  eq_process_tables()

test_that("eq_process outputs are appropriate", {
  expect_s3_class(df, "tbl")
  expect_named(
    df,
    expected = c(
      "date_time_retrieved", "date_time",
      "latitude", "longitude",
      "depth", "magnitude", "location"
    )
  )
})

df <- eq_get_tables() |>
  c(list(NULL)) |>
  eq_process_tables()

test_that("eq_process outputs are appropriate", {
  expect_s3_class(df, "tbl")
  expect_named(
    df,
    expected = c(
      "date_time_retrieved", "date_time",
      "latitude", "longitude",
      "depth", "magnitude", "location"
    )
  )
})

