# Utility functions ------------------------------------------------------------

## Retrieve geocoordinates from location values ----

get_longitude <- function(.location) {
  stringr::str_split(
    string = .location, pattern = ", | - ", simplify = TRUE
  ) |>
    (\(x) x[ , 1])() |>
    stringr::str_remove_all(pattern = "[^0-9.-]") |>
    as.numeric()
}

get_latitude <- function(.location) {
  stringr::str_split(
    string = .location, pattern = ", | - ", simplify = TRUE
  ) |>
    (\(x) x[ , 2])() |>
    stringr::str_remove_all(pattern = "[^0-9.-]") |>
    as.numeric()
}

get_location <- function(.location) {
  stringr::str_split(
    string = .location, pattern = ", | - ", simplify = TRUE
  ) |>
    (\(x) x[ , 3])() |>
    stringr::str_remove(pattern = "^0{1,}")
}

## Simplify vectors ----

simplify_vectors <- function(x) {
  c(x) |> unname() |> unlist()
}
